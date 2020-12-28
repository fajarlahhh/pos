<?php

namespace App\Http\Controllers;

use App\Models\Pelanggan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class PelangganController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;

        $data = Pelanggan::with('pengguna')->where(function($q) use ($req){
            $q->where('pelanggan_nama', 'like', '%'.$req->cari.'%')->orWhere('pelanggan_alamat', 'like', '%'.$req->cari.'%');
        });

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->pelanggan]);
        return view('pages.datamaster.pelanggan.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.pelanggan.form', [
            'back' => Str::contains(url()->previous(), ['pelanggan/tambah', 'pelanggan/edit'])? '/pelanggan': url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'pelanggan_nama' => 'required',
            'pelanggan_alamat' => 'required',
            'pelanggan_kontak' => 'required'
        ]);

        try{
            if ($req->get('id')) {
                $data = Pelanggan::findOrFail($req->get('id'));
                $data->pelanggan_nama = $req->get('pelanggan_nama');
                $data->pelanggan_alamat = $req->get('pelanggan_alamat');
                $data->pelanggan_kontak = $req->get('pelanggan_kontak');
                $data->save();
                toast('Berhasil mengedit data', 'success')->autoClose(2000);
            }else{
                $data = new Pelanggan();
                $data->pelanggan_nama = $req->get('pelanggan_nama');
                $data->pelanggan_alamat = $req->get('pelanggan_alamat');
                $data->pelanggan_kontak = $req->get('pelanggan_kontak');
                $data->save();

                toast('Berhasil menambah data', 'success')->autoClose(2000);
            }
            return redirect($req->get('redirect')? $req->get('redirect'): 'pelanggan');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.pelanggan.form', [
            'data' => Pelanggan::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['pelanggan/tambah', 'pelanggan/edit'])? '/pelanggan': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Pelanggan::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Pelanggan::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
