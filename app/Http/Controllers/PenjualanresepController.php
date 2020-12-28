<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Pbf;
use App\Models\Biaya;
use App\Models\Barang;
use App\Models\Dokter;
use App\Models\Penjualan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class PenjualanresepController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
		$tanggal = explode(' - ', $req->get('tanggal'));
		$tgl1 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[0])): date('Y-m-01');
		$tgl2 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[1])): date('Y-m-d');

        $data = Penjualan::with('pengguna')->with('detail')->where('penjualan_jenis', 'Resep')->whereBetween('penjualan_tanggal', [$tgl1, $tgl2])->where(function($q) use ($req){
            $q->orWhere('penjualan_keterangan', 'like', '%'.$req->cari.'%')->orWhere('penjualan_id', 'like', '%'.$req->cari.'%')->orWhere('pengguna_id', 'like', '%'.$req->cari.'%');
        })->orderBy('created_at', 'asc');

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends(['cari' => $req->cari, 'tipe' => $req->tipe, 'tanggal' =>  date('d F Y', strtotime($tgl1)).' - '.date('d F Y', strtotime($tgl2))]);
        return view('pages.penjualan.resep.index', [
            'data' => $data,
            'tgl' => date('d F Y', strtotime($tgl1)).' - '.date('d F Y', strtotime($tgl2)),
    		'tgl1' => $tgl1,
            'tgl2' => $tgl2,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        $biaya = Biaya::all();
        return view('pages.penjualan.resep.form', [
            'admin' => $biaya->filter(function ($q)
            {
                return $q->biaya_nama == "Biaya Listrik";
            })->first()->biaya_nilai,
            'racikan' => $biaya->filter(function ($q)
            {
                return $q->biaya_nama == "Biaya Servis";
            })->first()->biaya_nilai,
            'persen' => $biaya->filter(function ($q)
            {
                return $q->biaya_nama == "Persentase Dokter";
            })->first()->biaya_nilai,
            'pbf' => Pbf::all(),
            'barang' => [],
            'banyak' => $req->jumlah,
            'dokter' => Dokter::all(),
            'back' => Str::contains(url()->previous(), ['penjualanresep/tambah', 'penjualanresep/edit'])? '/penjualanresep': url()->previous()
        ]);
    }

	public function tambah_barang(Request $req, $resep, $id)
	{
        return view('pages.penjualan.resep.barang',[
            'barang' => Barang::with('satuan_semua')->with('jenis_barang')->orderBy('barang_nama')->get(),
            'data' => $req->barang,
            'resep' => $resep,
            'id' => $id,
            'resepid' => $resep.$id
        ]);
    }

	public function tambah_resep(Request $req, $id)
	{
        return view('pages.penjualan.resep.resep',[
            'data' => $req->resep,
            'barang' => $req->barang,
            'id' => $id
        ]);
    }

    public function cek_stok($barang)
    {
        $pesan = [];
        $bulan = date('m');
        $tahun = date('Y');
        $transaksi = Barang::whereIn('barang_id', collect($barang)->pluck('barang_id'))->with(['stok_awal' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereRaw(DB::raw("year(barang_masuk_tanggal)=$tahun"))->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan"))->groupBy('barang_id');
        }])->with(['penjualan' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                $r->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));
            })->groupBy('barang_id');
        }])->get();

        foreach ($barang as $index => $row) {
            $stok = 0;
            $masuk = 0;
            $keluar = 0;
            $stok_barang = $transaksi->filter(function ($q) use ($row){
                return $q->barang_id == $row['barang_id'];
            })->first();

            if ($stok_barang->stok == 1) {
                $stok = $stok_barang->stok_awal->count() > 0? $stok_barang->stok_awal->sum('barang_qty'): 0;
                $masuk = $stok_barang->barang_masuk->count() > 0? $stok_barang->barang_masuk->sum('masuk'): 0;
                $keluar = $stok_barang->penjualan->count() > 0? $stok_barang->penjualan->sum('keluar'): 0;

                $sisa = $stok + $masuk - $keluar;

                $satuan = explode(";", $row["satuan_nama"]);
                $jual = $row['penjualan_detail_qty']/$satuan[2];

                if($sisa < $jual || $sisa == 0){
                    if (!in_array("Stok ".$stok_barang['barang_nama']." tersisa ".$sisa."<br>", $pesan)) {
                        array_push($pesan, "Stok ".$stok_barang['barang_nama']." tersisa ".$sisa."<br>");
                    }
                }
            }
        }
        return $pesan;
    }

	public function simpan(Request $req)
	{
        if (str_replace(',', '', $req->get('penjualan_bayar')) < str_replace(',', '', $req->get('penjualan_tagihan'))) {
            alert()->error('Simpan Data Gagal', "Jumlah Pembayaran Kurang");
            return redirect()->back()->withInput();
        }
        if (str_replace(',', '', $req->get('penjualan_tagihan')) <= 0) {
            alert()->error('Simpan Data Gagal', "Belum ada barang yang dipilih");
            return redirect()->back()->withInput();
        }
        if (!$req->barang) {
            alert()->error('Simpan Data Gagal', "Barang Belum Diinputkan");
            return redirect()->back()->withInput();
        }

        $barang_id = [];
        foreach ($req->barang as $row) {
            foreach ($row as $brg) {
                array_push($barang_id, [
                    'barang_id' => $brg['barang_id'],
                    'satuan_nama' => $brg['satuan_nama'],
                    'penjualan_detail_qty' => $brg['penjualan_detail_qty']
                ]);
            }
        }
        try{
            $stok = $this->cek_stok($barang_id);
            if ($stok){
                alert()->error('Simpan Data Gagal', "Stok Beberapa Barang Tidak Tersedia");
                return redirect()->back()->withInput()->with(['stok_kurang' => $stok]);
            }
            $id = Carbon::now()->format('Ymdhmsu');
            DB::transaction(function () use ($req, $id) {
                $data = new Penjualan();
                $data->penjualan_id = $id;
                $data->penjualan_tanggal = Carbon::now()->format('Y-m-d');
                $data->penjualan_jenis = "Resep";
                $data->penjualan_keterangan = $req->get('penjualan_keterangan');
                $data->penjualan_tagihan = str_replace(',', '', $req->get('penjualan_tagihan'));
                $data->penjualan_racikan = str_replace(',', '', $req->get('racikan'));
                $data->penjualan_admin = str_replace(',', '', $req->get('admin'));
                $data->penjualan_dokter = str_replace(',', '', $req->get('dokter'));
                $data->penjualan_bayar = str_replace(',', '', $req->get('penjualan_bayar'));
                $data->penjualan_sisa = str_replace(',', '', $req->get('penjualan_sisa'));
                $data->penjualan_biaya_dokter = str_replace(',', '', $req->get('penjualan_biaya_dokter'));
                $data->dokter_id = $req->get('dokter_id');
                $data->save();
                foreach ($req->barang as $index => $detail) {
                    foreach ($detail as $brg) {
                        $satuan = explode(";", $brg["satuan_nama"]);
                        $barang = explode(";", $brg["barang_id"]);

                        $detail = new PenjualanDetail();
                        $detail->penjualan_id = $id;
                        $detail->penjualan_detail_resep = $req->resep[$index];
                        $detail->penjualan_detail_resep_nama = $req->penjualan_detail_resep_nama[$index];
                        $detail->barang_id = $barang[0];
                        $detail->satuan_nama = $satuan[1];
                        $detail->satuan_harga = str_replace(',', '', $satuan[0]);
                        $detail->penjualan_detail_tambahan = $req->get('dokter_id')? str_replace(',', '', $satuan[0]) * str_replace(',', '', $req->get('dokter'))/100: 0;
                        $detail->satuan_rasio_dari_utama = $satuan[2];
                        $detail->penjualan_detail_qty = $brg['penjualan_detail_qty'];
                        $detail->penjualan_detail_diskon = $brg['penjualan_detail_diskon'];
                        $detail->penjualan_detail_total = str_replace(',', '', $brg['penjualan_detail_total']);
                        $detail->pbf_id = $barang[1]?:null;
                        $detail->save();
                    }
                }
            });

            toast('Berhasil menyimpan data', 'success')->autoClose(2000);
            return redirect('penjualanresep')->with(['kwitansi' => '/penjualanresep/kwitansi/0/'.$id]);
        }catch(\Exception $e){
            alert()->error('Simpan Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function nota($cetak, $id)
    {
        return view('pages.penjualan.resep.kwitansi', [
            'data' => Penjualan::with('detail.barang')->findOrFail($id),
            'cetak' => $cetak
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Penjualan::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Penjualan::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
