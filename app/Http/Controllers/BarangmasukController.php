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
        $tipe = $req->tipe ? $req->tipe : 0;
        $tanggal = explode(' - ', $req->get('tanggal'));
        $tgl1 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[0])) : date('Y-m-01');
        $tgl2 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[1])) : date('Y-m-d');

        $data = BarangMasuk::with('pengguna')->with('detail.barang')->where(function ($q) use ($req) {
            $q->where('faktur', 'like', '%' . $req->cari . '%')->orWhere('sales', 'like', '%' . $req->cari . '%')->orWhere('keterangan', 'like', '%' . $req->cari . '%')->orWhereHas('supplier', function ($q) use ($req) {
                $q->where('nama', 'like', '%' . $req->cari . '%');
            });
        })->whereBetween('tanggal', [$tgl1, $tgl2])->orderBy('created_at', 'desc');

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
            'tgl' => date('d F Y', strtotime($tgl1)) . ' - ' . date('d F Y', strtotime($tgl2)),
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
            'back' => Str::contains(url()->previous(), ['barangmasuk/tambah', 'barangmasuk/edit']) ? '/barangmasuk' : url()->previous()
        ]);
    }

    public function tambah_barang(Request $req, $id)
    {
        return view('pages.barangmasuk.barang', [
            'barang' => Barang::with('satuan_utama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'faktur' => 'required',
            'tanggal' => 'required',
            'barang_masuk.*.id' => 'required'
        ]);

        if (BarangMasuk::where('faktur', $req->faktur)->where('jatuh_tempo', $req->jatuh_tempo)->count() > 0) {
            alert()->error('Gagal Menyimpan Data', 'Nomor faktur sudah diinputkan');
            return redirect()->back()->withInput();
        }
        dd($req->barang_masuk);
        DB::transaction(function () use ($req) {
            $data = new BarangMasuk();
            $data->tanggal = Carbon::parse($req->get('tanggal'))->format('Y-m-d');
            $data->faktur = $req->get('faktur');
            $data->supplier_id = $req->get('supplier_id');
            if ($req->get('jatuh_tempo')) {
                $data->jatuh_tempo = $req->get('jatuh_tempo') ? Carbon::parse($req->get('jatuh_tempo'))->format('Y-m-d') : null;
            } else {
                $data->lunas = Carbon::now()->format('Y-m-d');
            }
            $data->sales = $req->get('sales');
            $data->keterangan = $req->get('keterangan');
            $data->save();

            foreach ($req->barang_masuk as $index => $row) {
                $detail = new BarangMasukDetail();
                $detail->barang_masuk_id = $data->id;
                $detail->barang_id = $row['id'];
                $detail->nomor_batch = $row['nomor_batch'];
                $detail->harga_barang = str_replace(',', '', $row['harga_barang']);
                $detail->harga_pph = str_replace(',', '', $row['harga_pph']);
                $detail->qty = $row['qty'];
                $detail->diskon = $row['diskon'];
                $detail->kadaluarsa = Carbon::parse($row['kadaluarsa'])->format('Y-m-d');
                $detail->sub_total_ppn = str_replace(',', '', $req->get('sub_total_ppn'));
                $detail->sub_total = str_replace(',', '', $req->get('sub_total'));
                $detail->save();
            }
        });

        toast('Berhasil menambah data', 'success')->autoClose(2000);
        if ($req->banyak == 1)
            return redirect('barangmasuk/tambah?jumlah=banyak');
        else
            return redirect($req->get('redirect') ? $req->get('redirect') : 'barangmasuk');
    }

    public function hapus(Request $req)
    {
            BarangMasuk::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
    }

    public function restore(Request $req)
    {
            BarangMasuk::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
    }
}
