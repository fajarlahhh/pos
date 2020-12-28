<?php

namespace App\Http\Controllers;

use App\Models\Penjualan;
use App\Models\BarangMasuk;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use App\Models\BarangMasukDetail;

class DashboardController extends Controller
{
    //

    public function index(Request $req)
    {
        $barang_masuk = BarangMasuk::orderBy('barang_masuk_tanggal')->with('supplier')->whereRaw("TIMESTAMPDIFF(day, now(), barang_masuk_tanggal) <= 7")->whereNull('barang_masuk_lunas')->get();
        $penjualan = Penjualan::orderBy('penjualan_tanggal')->with('pelanggan')->whereNull('penjualan_lunas')->whereRaw("TIMESTAMPDIFF(day, now(), penjualan_tanggal) <= 7")->get();
        $kadaluarsa = BarangMasukDetail::where('barang_masuk_kadaluarsa', '<=', date('Y-m-d'))->where('check', 0)->orderBy('barang_masuk_kadaluarsa')->whereRaw("TIMESTAMPDIFF(day, now(), barang_masuk_kadaluarsa) <= 7")->get();

        return view('pages.dashboard.index',[
            'barang_masuk' => $barang_masuk,
            'kadaluarsa' => $kadaluarsa,
            'penjualan' => $penjualan
        ]);
    }

    public function faktur(Request $req)
    {
        $data =  BarangMasukDetail::where('barang_masuk_id', $req->id)->get();
        return view('pages.dashboard.jatuhtempo', [
            'data' => $data
        ]);
    }

    public function nota(Request $req)
    {
        $data =  PenjualanDetail::where('penjualan_id', $req->id)->get();
        return view('pages.dashboard.penjualan', [
            'data' => $data
        ]);
    }

    public function lunas_bm(Request $req)
    {
        BarangMasuk::where('barang_masuk_id', $req->barang_masuk_id)->update([
            'barang_masuk_lunas' => now()
        ]);
        return redirect()->back();
    }

    public function lunas_penjualan(Request $req)
    {
        Penjualan::where('penjualan_id', $req->penjualan_id)->update([
            'penjualan_lunas' => now()
        ]);
        return redirect()->back();
    }

    public function kadaluarsa(Request $req)
    {
        BarangMasukDetail::where('barang_masuk_id', $req->id)->where('barang_id', $req->barang)->update([
            'check' => 1
            ]);
        return redirect()->back();
    }
}
