<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    //
    public function index(Request $req)
	{
        $tipe = $req->tipe? $req->tipe: 0;

        $data = Supplier::with('pengguna')->where(function($q) use ($req){
            $q->where('supplier_nama', 'like', '%'.$req->cari.'%')->orWhere('supplier_alamat', 'like', '%'.$req->cari.'%');
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
        $data->appends([$req->cari, $req->tipe, $req->supplier]);
        return view('pages.datamaster.supplier.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'cari' => $req->cari,
        ]);
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.supplier.form', [
            'back' => Str::contains(url()->previous(), ['supplier/tambah', 'supplier/edit'])? '/supplier': url()->previous(),
            'aksi' => 'Tambah'
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'supplier_nama' => 'required',
            'supplier_alamat' => 'required',
            'supplier_kontak' => 'required'
        ]);

        try{
            if ($req->get('id')) {
                $data = Supplier::findOrFail($req->get('id'));
                $data->supplier_nama = $req->get('supplier_nama');
                $data->supplier_alamat = $req->get('supplier_alamat');
                $data->supplier_kontak = $req->get('supplier_kontak');
                $data->save();
                toast('Berhasil mengedit data', 'success')->autoClose(2000);
            }else{
                $data = new Supplier();
                $data->supplier_nama = $req->get('supplier_nama');
                $data->supplier_alamat = $req->get('supplier_alamat');
                $data->supplier_kontak = $req->get('supplier_kontak');
                $data->save();

                toast('Berhasil menambah data', 'success')->autoClose(2000);
            }
            return redirect($req->get('redirect')? $req->get('redirect'): 'supplier');
		}catch(\Exception $e){
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        return view('pages.datamaster.supplier.form', [
            'data' => Supplier::findOrFail($req->get('id')),
            'back' => Str::contains(url()->previous(), ['supplier/tambah', 'supplier/edit'])? '/supplier': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Supplier::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Supplier::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
