<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Barang;
use App\Models\Supplier;
use App\Models\JatuhTempo;
use App\Models\BarangMasuk;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\BarangMasukDetail;
use Illuminate\Support\Facades\DB;

class BarangmasukController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
		$tanggal = explode(' - ', $req->get('tanggal'));
		$tgl1 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[0])): date('Y-m-01');
		$tgl2 = $req->get('tanggal')? date('Y-m-d', strtotime($tanggal[1])): date('Y-m-d');

        $data = BarangMasuk::with('pengguna')->with('detail.barang')->where(function($q) use ($req){
            $q->where('barang_masuk_faktur', 'like', '%'.$req->cari.'%')->orWhere('barang_masuk_sales', 'like', '%'.$req->cari.'%')->orWhere('barang_masuk_keterangan', 'like', '%'.$req->cari.'%')->orWhereHas('supplier', function($q) use ($req){
                $q->where('supplier_nama', 'like', '%'.$req->cari.'%');
            });
        })->whereBetween('barang_masuk_tanggal', [$tgl1, $tgl2])->orderBy('created_at', 'desc');

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends([$req->cari, $req->tipe]);
        return view('pages.barangmasuk.index', [
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
        return view('pages.barangmasuk.form', [
            'supplier' => Supplier::all(),
            'barang_masuk' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['barangmasuk/tambah', 'barangmasuk/edit'])? '/barangmasuk': url()->previous()
        ]);
    }

	public function tambah_barang(Request $req, $id)
	{
        return view('pages.barangmasuk.barang',[
            'barang' => Barang::with('satuan_utama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'barang_masuk_faktur' => 'required',
            'barang_masuk_tanggal' => 'required'
        ]);

        try{
            if (BarangMasuk::where('barang_masuk_faktur', $req->barang_masuk_faktur)->where('barang_masuk_jatuh_tempo', $req->barang_masuk_jatuh_tempo)->count() > 0) {
                alert()->error('Gagal Menyimpan Data','Nomor faktur sudah diinputkan');
                return redirect()->back()->withInput();
            }
            DB::transaction(function () use ($req) {
                $data = new BarangMasuk();
                $data->barang_masuk_tanggal = Carbon::parse($req->get('barang_masuk_tanggal'))->format('Y-m-d');
                $data->barang_masuk_faktur = $req->get('barang_masuk_faktur');
                $data->supplier_id = $req->get('supplier_id');
                if( $req->get('barang_masuk_jatuh_tempo')){
                    $data->barang_masuk_jatuh_tempo = $req->get('barang_masuk_jatuh_tempo')? Carbon::parse($req->get('barang_masuk_jatuh_tempo'))->format('Y-m-d'): null;
                }else{
                    $data->barang_masuk_lunas = Carbon::now()->format('Y-m-d');
                }
                $data->barang_masuk_sales = $req->get('barang_masuk_sales');
                $data->barang_masuk_keterangan = $req->get('barang_masuk_keterangan');
                $data->save();

                foreach ($req->barang_masuk as $index => $barang_masuk) {
                    $detail = new BarangMasukDetail();
                    $detail->barang_masuk_id = $data->barang_masuk_id;
                    $detail->barang_id = $barang_masuk['barang_id'];
                    $detail->barang_masuk_nomor_batch = $barang_masuk['barang_masuk_nomor_batch'];
                    $detail->barang_masuk_harga_barang = str_replace(',', '', $barang_masuk['barang_masuk_harga_barang']);
                    $detail->barang_masuk_harga_ppn = str_replace(',', '', $barang_masuk['barang_masuk_harga_ppn']);
                    $detail->barang_masuk_qty = $barang_masuk['barang_masuk_qty'];
                    $detail->barang_masuk_diskon = $barang_masuk['barang_masuk_diskon'];
                    $detail->barang_masuk_kadaluarsa = Carbon::parse($barang_masuk['barang_masuk_kadaluarsa'])->format('Y-m-d');
                    $detail->barang_masuk_sub_total_ppn = str_replace(',', '', $req->get('barang_masuk_sub_total_ppn'));
                    $detail->barang_masuk_sub_total = str_replace(',', '', $req->get('barang_masuk_sub_total'));
                    $detail->save();
                }
            });

            toast('Berhasil menambah data', 'success')->autoClose(2000);
            if($req->banyak == 1)
                return redirect('barangmasuk/tambah?jumlah=banyak');
            else
                return redirect($req->get('redirect')? $req->get('redirect'): 'barangmasuk');
        }catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function hapus(Request $req)
	{
		try{
            BarangMasuk::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
    }

	public function restore(Request $req)
	{
		try{
            BarangMasuk::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
