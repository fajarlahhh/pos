<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use App\Models\Barang;
use App\Models\Satuan;
use App\Models\JenisBarang;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BarangController extends Controller
{
    //
    public function index(Request $req)
    {
        $tipe = $req->tipe ? $req->tipe : 0;
        $jenis = $req->jenis ? $req->jenis : '';

        $data = Barang::with('jenis_barang')->with('pengguna')->where('nama', 'like', '%' . $req->cari . '%');

        if ($jenis != '') {
            $data = $data->where('jenis_barang_id', $jenis);
        }

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->orderBy('nama')->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->barang_harga_jual]);
        return view('pages.datamaster.barang.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'jenis' => $jenis,
            'tipe' => $tipe,
            'cari' => $req->cari,
            'jenis_barang' => JenisBarang::all(),
            'supplier' => Supplier::all(),
        ]);
    }

    public function cari(Request $req)
    {
        return Barang::where('nama', 'like', '%' . $req->cari . '%')->limit(
            20
        )->get();
    }

    public function tambah(Request $req)
    {
        return view('pages.datamaster.barang.form', [
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit']) ? '/barang' : url()->previous(),
            'jenis_barang' => JenisBarang::all(),
            'supplier' => Supplier::all(),
            'data' => [],
            'aksi' => 'Tambah'
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'nama' => 'required',
            'stok_min' => 'required',
            'harga' => 'required',
        ]);
        
        if ($req->get('id')) {
            $data = Barang::findOrFail($req->get('id'));
        } else {
            $data = new Barang();
        }
        $data->nama = $req->get('nama');
        $data->stok_min = $req->get('stok_min');
        $data->keterangan = $req->get('keterangan');
        $data->stok = $req->get('stok');
        $data->jenis_barang_id = $req->get('jenis_barang_id');
        $data->supplier_id = $req->get('supplier_id');
        $data->satuan = $req->get('satuan');
        $data->harga = str_replace(',', '', $req->get('harga'));
        $data->save();
        toast('Berhasil mengedit data', 'success')->autoClose(2000);

        return redirect($req->get('redirect') ? $req->get('redirect') : 'barang');
    }

    public function edit(Request $req)
    {
        $data = Barang::findOrFail($req->get('id'));

        return view('pages.datamaster.barang.form', [
            'data' => $data,
            'supplier' => Supplier::all(),
            'jenis_barang' => JenisBarang::all(),
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit']) ? '/barang' : url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

    public function hapus(Request $req)
    {
        Barang::findOrFail($req->get('id'))->delete();
        toast('Berhasil menghapus data', 'success')->autoClose(2000);
    }

    public function restore(Request $req)
    {
        Barang::withTrashed()->findOrFail($req->get('id'))->restore();
        toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
    }
}
