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
        $barang_masuk = BarangMasuk::orderBy('tanggal')->whereNotNull('jatuh_tempo')->with('supplier')->whereRaw("TIMESTAMPDIFF(day, now(), tanggal) <= 7")->whereNull('lunas')->get();
        $penjualan = Penjualan::orderBy('tanggal')->with('pelanggan')->whereNull('lunas')->whereRaw("TIMESTAMPDIFF(day, now(), tanggal) <= 7")->get();

        return view('pages.dashboard.index',[
            'barang_masuk' => $barang_masuk,
            'penjualan' => $penjualan
        ]);
    }

    public function faktur(Request $req)
    {
        $data =  BarangMasukDetail::where('barang_masuk_id', $req->id)->whereHas('barang_masuk', function($q){
            $q->whereNull('lunas');
        })->get();
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
        BarangMasuk::where('id', $req->id)->update([
            'lunas' => now()
        ]);
        return redirect()->back();
    }

    public function lunas_penjualan(Request $req)
    {
        Penjualan::where('id', $req->id)->update([
            'lunas' => now()
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
