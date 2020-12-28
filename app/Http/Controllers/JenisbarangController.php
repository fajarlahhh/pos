<?php

namespace App\Http\Controllers;

use App\Models\JenisBarang;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class JenisbarangController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;

        $data = JenisBarang::with('pengguna')->where('jenis_barang_uraian', 'like', '%'.$req->cari.'%');

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
        return view('pages.datamaster.jenisbarang.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.jenisbarang.form', [
            'back' => Str::contains(url()->previous(), ['jenisbarang/tambah', 'jenisbarang/edit'])? '/jenisbarang': url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'jenis_barang_uraian' => 'required'
        ]);

        try{
            if ($req->get('id')) {
                $data = JenisBarang::findOrFail($req->get('id'));
                $data->jenis_barang_uraian = $req->get('jenis_barang_uraian');
                $data->save();
                toast('Berhasil mengedit data', 'success')->autoClose(2000);
            } else {
                $data = new JenisBarang();
                $data->jenis_barang_uraian = $req->get('jenis_barang_uraian');
                $data->save();

                toast('Berhasil menambah data', 'success')->autoClose(2000);
            }

            return redirect($req->get('redirect')? $req->get('redirect'): 'jenisbarang');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.jenisbarang.form', [
            'data' => JenisBarang::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['jenisbarang/tambah', 'jenisbarang/edit'])? '/jenisbarang': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            JenisBarang::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            JenisBarang::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
