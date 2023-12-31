<?php

namespace App\Http\Controllers;

use App\Models\Pbf;
use App\Models\Retur;
use App\Models\Barang;
use App\Models\Dokter;
use App\Models\Penjualan;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class LaporanController extends Controller
{
    //
    public function laporanstokbarang(Request $req, $cetak = null)
    {
        $bulan = $req->bulan?:date('m');
        $tahun = $req->tahun?:date('Y');

        $data = Barang::with('satuan_utama')->with('jenis_barang')->with(['stok_awal' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'qty')->whereRaw(DB::raw("year(awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(qty) masuk"))->whereHas('barang_masuk', function($r) use ($bulan, $tahun){
                return $r->whereRaw(DB::raw("month(tanggal)=$bulan and year(tanggal)=$tahun"));
            })->groupBy('barang_id');
        }])->with(['penjualan' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'penjualan_id', DB::raw("sum(qty/rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                $r->whereRaw(DB::raw("year(tanggal)=$tahun"))->whereRaw(DB::raw("month(tanggal)=$bulan"));
            })->groupBy('barang_id', 'penjualan_id');
        }])->whereNull('supplier_id')->orderBy('nama')->get();
        return view('pages.laporan.laporanstokbarang.index', [
            'data' => $data,
            'cetak' => $cetak,
            'bulan' => $bulan,
            'tahun' => $tahun
        ]);
    }

    public function laporanpenjualan(Request $req, $cetak = null)
    {
        $bulan = $req->bulan?:date('m');
        $tahun = $req->tahun?:date('Y');
        $pembayaran = $req->pembayaran? $req->pembayaran: 0;

        $data = Penjualan::with('detail.barang')->whereRaw(DB::raw("year(tanggal)=$tahun"))->whereRaw(DB::raw("month(tanggal)=$bulan"));

        switch ($pembayaran) {
            case '1':
                $data = $data->whereNull('lunas');
                break;
            case '2':
                $data = $data->whereNotNull('lunas');
                break;
        }

        $data = $data->get();
        return view('pages.laporan.laporanepenjualan.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tahun' => $tahun,
            'bulan' => $bulan,
            'pembayaran' => $pembayaran
        ]);
    }

    public function laporanretur(Request $req, $cetak = null)
    {
        $bulan = $req->bulan?:date('m');
        $tahun = $req->tahun?:date('Y');

        $data = Retur::with('barang')->whereRaw(DB::raw("year(tanggal)=$tahun"))->whereRaw(DB::raw("month(tanggal)=$bulan"))->get();
        return view('pages.laporan.laporanretur.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tahun' => $tahun,
            'bulan' => $bulan,
        ]);
    }

    public function laporanpengeluaran(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal? date('Y-m-d', strtotime($req->tanggal)):date('Y-m-d');
        $pembayaran = $req->pembayaran? $req->pembayaran: 0;

        $data = PenjualanDetail::with('barang')->whereHas('penjualan', function ($q) use ($tanggal)
        {
            return $q->where('tanggal', $tanggal);
        });

        switch ($pembayaran) {
            case '1':
                $data = $data->whereHas('penjualan', function ($q) use ($tanggal)
                {
                    return $q->whereNull('lunas');
                });
                break;
            case '2':
                $data = $data->whereHas('penjualan', function ($q) use ($tanggal)
                {
                    return $q->whereNotNull('lunas');
                });
                break;
        }

        $data = $data->get();
        return view('pages.laporan.laporanpenerimaan.perhari.index', [
            'data' => $data,
            'cetak' => $cetak,
            'tanggal' => $tanggal
        ]);
    }
}
