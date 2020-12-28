<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class DokterController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;
        $konsinyasi = $req->konsinyasi? $req->konsinyasi: 0;

        $data = Dokter::with('pengguna')->where(function($q) use ($req){
            $q->where('dokter_nama', 'like', '%'.$req->cari.'%')->orWhere('dokter_bidang', 'like', '%'.$req->cari.'%');
        });

        if($konsinyasi != 'semua'){
            $data = $data->where('konsinyasi', $konsinyasi);
        }

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->konsinyasi]);
        return view('pages.datamaster.dokter.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'konsinyasi' => $konsinyasi,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.dokter.form', [
            'back' => Str::contains(url()->previous(), ['dokter/tambah', 'dokter/edit'])? '/dokter': url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'dokter_nama' => 'required',
            'dokter_bidang' => 'required'
        ]);

        try{
            if ($req->get('id')) {
                $data = Dokter::findOrFail($req->get('id'));
                $data->dokter_nama = $req->get('dokter_nama');
                $data->dokter_bidang = $req->get('dokter_bidang');
                $data->save();
                toast('Berhasil mengedit data', 'success')->autoClose(2000);
            }else{
                $data = new Dokter();
                $data->dokter_nama = $req->get('dokter_nama');
                $data->dokter_bidang = $req->get('dokter_bidang');
                $data->save();

                toast('Berhasil menambah data', 'success')->autoClose(2000);
            }
            return redirect($req->get('redirect')? $req->get('redirect'): 'dokter');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.dokter.form', [
            'data' => Dokter::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['dokter/tambah', 'dokter/edit'])? '/dokter': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Dokter::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Dokter::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
