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
        $tipe = $req->tipe ? $req->tipe : 0;

        $data = Pelanggan::with('pengguna')->where(function ($q) use ($req) {
            $q->where('nama', 'like', '%' . $req->cari . '%')->orWhere('alamat', 'like', '%' . $req->cari . '%');
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
            'back' => Str::contains(url()->previous(), ['pelanggan/tambah', 'pelanggan/edit']) ? '/pelanggan' : url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'nama' => 'required',
            'alamat' => 'required',
            'kontak' => 'required'
        ]);

        if ($req->get('id')) {
            $data = Pelanggan::findOrFail($req->get('id'));
            $data->nama = $req->get('nama');
            $data->alamat = $req->get('alamat');
            $data->kontak = $req->get('kontak');
            $data->save();
            toast('Berhasil mengedit data', 'success')->autoClose(2000);
        } else {
            $data = new Pelanggan();
            $data->nama = $req->get('nama');
            $data->alamat = $req->get('alamat');
            $data->kontak = $req->get('kontak');
            $data->save();

            toast('Berhasil menambah data', 'success')->autoClose(2000);
        }
        return redirect($req->get('redirect') ? $req->get('redirect') : 'pelanggan');
    }

    public function edit(Request $req)
    {
        return view('pages.datamaster.pelanggan.form', [
            'data' => Pelanggan::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['pelanggan/tambah', 'pelanggan/edit']) ? '/pelanggan' : url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

    public function hapus(Request $req)
    {
            Pelanggan::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
    }

    public function restore(Request $req)
    {
            Pelanggan::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
    }
}
