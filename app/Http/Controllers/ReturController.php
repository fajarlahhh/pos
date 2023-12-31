<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Retur;
use App\Models\Barang;
use App\Models\Pelanggan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReturController extends Controller
{
    public function index(Request $req)
    {
        $tipe = $req->tipe ? $req->tipe : 0;
        $tanggal = explode(' - ', $req->get('tanggal'));
        $tgl1 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[0])) : date('Y-m-01');
        $tgl2 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[1])) : date('Y-m-d');

        $data = Retur::with('pengguna')->with('barang')->whereHas('barang', function ($q) use ($req) {
            $q->where('nama', 'like', '%' . $req->cari . '%');
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
        return view('pages.retur.index', [
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
        return view('pages.retur.form', [
            'pelanggan' => Pelanggan::all(),
            'retur' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['retur/tambah', 'retur/edit']) ? '/retur' : url()->previous()
        ]);
    }

    public function tambah_barang(Request $req, $id)
    {
        return view('pages.retur.barang', [
            'barang' => Barang::with('satuan_utama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'tanggal' => 'required',
            'keterangan' => 'required',
            'barang.*.id' => 'required',
            'barang.*.harga' => 'required|min:10',
            'barang.*.qty' => 'required|min:1'
        ]);
        
        DB::transaction(function () use ($req) {
            foreach ($req->retur as $index => $row) {
                $retur = new Retur();
                $retur->barang_id = $row['id'];
                $retur->pelanggan_id = $req->pelanggan_id;
                $retur->qty = $row['qty'];
                $retur->harga = str_replace(',', '', $row['harga']);
                $retur->tanggal = Carbon::parse($req->get('tanggal'))->format('Y-m-d');
                $retur->satuan = $row['satuan'];
                $retur->keterangan = $req->keterangan;
                $retur->pengguna_id = auth()->id();
                $retur->save();
            }
        });

        toast('Berhasil menambah data', 'success')->autoClose(2000);
        if ($req->banyak == 1)
            return redirect('retur/tambah?jumlah=banyak');
        else
            return redirect($req->get('redirect') ? $req->get('redirect') : 'retur');
    }

    public function hapus(Request $req)
    {
            Retur::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
    }

    public function restore(Request $req)
    {
            Retur::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
    }
}
