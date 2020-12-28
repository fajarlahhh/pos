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
        $tipe = $req->tipe? $req->tipe: 0;
        $barang = $req->barang? $req->barang: 0;
        $jenis = $req->jenis? $req->jenis: 0;
        $konsinyasi = $req->konsinyasi? $req->konsinyasi: 0;

        $data = Barang::with('jenis_barang')->with('satuan_utama')->with('pengguna')->where('barang_nama', 'like', '%'.$req->cari.'%');

        if($jenis != 'semua'){
            $data = $data->where('jenis_barang_id', $jenis);
        }

        if($konsinyasi != 'semua'){
            $data = $data->where('supplier_id', $konsinyasi);
        }

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        $data = $data->orderBy('barang_nama')->paginate(10);
        $data->appends([$req->cari, $req->tipe, $req->barang_harga_jual]);
        return view('pages.datamaster.barang.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'jenis' => $jenis,
            'konsinyasi' => $konsinyasi,
            'tipe' => $tipe,
            'cari' => $req->cari,
            'jenis_barang' => JenisBarang::all(),
            'supplier' => Supplier::all(),
        ]);
    }

    public function satuan(Request $req)
    {
        return Barang::with('satuan_semua')->findOrFail($req->get('id'));
    }

    public function cari(Request $req)
    {
        return Barang::where('barang_nama', 'like', '%'.$req->cari.'%')->with('satuan_utama')->limit(20
        )->get();
    }

	public function tambah(Request $req)
	{
        return view('pages.datamaster.barang.form', [
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit'])? '/barang': url()->previous(),
            'jenis_barang' => JenisBarang::all(),
            'supplier' => Supplier::all(),
            'data' => [],
            'aksi' => 'Tambah'
        ]);
    }

	public function tambah_satuan(Request $req, $id)
	{
        return view('pages.datamaster.barang.satuan',[
            'data' => $req->satuan,
            'id' => $id
        ]);
    }

    private function simpan_satuan($barang, $req)
    {
        $utama = new Satuan();
        $utama->barang_id = $barang;
        $utama->satuan_id = 0;
        $utama->satuan_nama = $req->get('satuan_nama');
        $utama->satuan_harga = str_replace(',', '', $req->get('satuan_harga'));
        $utama->satuan_rasio_dari_utama = 1;
        $utama->utama = 1;
        $utama->save();

        if ($req->satuan) {
            foreach ($req->satuan as $index => $row) {
                $satuan = new Satuan();
                $satuan->barang_id = $barang;
                $satuan->satuan_id = $index + 1;
                $satuan->satuan_nama = $row['satuan_nama'];
                $satuan->satuan_harga = str_replace(',', '', $row['satuan_harga']);
                $satuan->satuan_rasio_dari_utama = $row['satuan_rasio_dari_utama'];
                $satuan->utama = 0;
                $satuan->save();
            }
        }
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'barang_nama' => 'required',
            'satuan_nama' => 'required',
            'barang_stok_min' => 'required',
            'satuan_harga' => 'required',
        ]);

        try{
            DB::transaction(function () use ($req) {
                if ($req->get('id')) {
                    $data = Barang::findOrFail($req->get('id'));
                    $data->barang_nama = $req->get('barang_nama');
                    $data->barang_stok_min = $req->get('barang_stok_min');
                    $data->barang_keterangan = $req->get('barang_keterangan');
                    $data->stok = $req->get('stok');
                    $data->jenis_barang_id = $req->get('jenis_barang_id');
                    $data->supplier_id = $req->get('supplier_id');
                    $data->save();
                    Satuan::where('barang_id', $req->get('id'))->delete();
                    $this->simpan_satuan($req->get('id'), $req);
                    toast('Berhasil mengedit data', 'success')->autoClose(2000);
                }else{
                    $data = new Barang();
                    $data->barang_nama = $req->get('barang_nama');
                    $data->barang_stok_min = $req->get('barang_stok_min');
                    $data->barang_keterangan = $req->get('barang_keterangan');
                    $data->stok = $req->get('stok');
                    $data->jenis_barang_id = $req->get('jenis_barang_id');
                    $data->supplier_id = $req->get('supplier_id');
                    $data->save();
                    $this->simpan_satuan($data->barang_id, $req);
                    toast('Berhasil menambah data', 'success')->autoClose(2000);
                }
            });

            return redirect($req->get('redirect')? $req->get('redirect'): 'barang');
		}catch(\Exception $e){
            alert()->error('Simpan Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

	public function edit(Request $req)
	{
        $data = Barang::with('satuan_lain')->findOrFail($req->get('id'));
        return view('pages.datamaster.barang.form', [
            'data' => $data,
            'supplier' => Supplier::all(),
            'jenis_barang' => JenisBarang::all(),
            'back' => Str::contains(url()->previous(), ['barang/tambah', 'barang/edit'])? '/barang': url()->previous(),
            'aksi' => 'Edit'
        ]);
    }

	public function hapus(Request $req)
	{
		try{
            Barang::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Hapus Data Gagal', $e->getMessage());
		}
	}

	public function restore(Request $req)
	{
		try{
            Barang::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
		}catch(\Exception $e){
            alert()->error('Restore Data Gagal', $e->getMessage());
		}
	}
}
