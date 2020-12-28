<?php

namespace App\Http\Controllers;

use App\Models\Pbf;
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
            $q->select('barang_id', 'barang_qty')->whereRaw(DB::raw("year(stok_awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(stok_awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', DB::raw("sum(barang_masuk_qty) masuk"))->whereHas('barang_masuk', function($r) use ($bulan, $tahun){
                return $r->whereRaw(DB::raw("month(barang_masuk_tanggal)=$bulan and year(barang_masuk_tanggal)=$tahun"));
            })->groupBy('barang_id');
        }])->with(['penjualan' => function($q) use ($bulan, $tahun){
            $q->select('barang_id', 'penjualan_id', DB::raw("sum(penjualan_detail_qty/satuan_rasio_dari_utama) keluar"))->whereHas('penjualan', function($r) use ($bulan, $tahun){
                $r->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));
            })->groupBy('barang_id', 'penjualan_id');
        }])->whereNull('supplier_id')->orderBy('barang_nama')->get();
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

        $data = Penjualan::with('detail.barang')->whereRaw(DB::raw("year(penjualan_tanggal)=$tahun"))->whereRaw(DB::raw("month(penjualan_tanggal)=$bulan"));

        switch ($pembayaran) {
            case '1':
                $data = $data->whereNull('penjualan_lunas');
                break;
            case '2':
                $data = $data->whereNotNull('penjualan_lunas');
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

    public function laporanpengeluaran(Request $req, $cetak = null)
    {
        $tanggal = $req->tanggal? date('Y-m-d', strtotime($req->tanggal)):date('Y-m-d');
        $pembayaran = $req->pembayaran? $req->pembayaran: 0;

        $data = PenjualanDetail::with('barang')->whereHas('penjualan', function ($q) use ($tanggal)
        {
            return $q->where('penjualan_tanggal', $tanggal);
        });

        switch ($pembayaran) {
            case '1':
                $data = $data->whereHas('penjualan', function ($q) use ($tanggal)
                {
                    return $q->whereNull('penjualan_lunas');
                });
                break;
            case '2':
                $data = $data->whereHas('penjualan', function ($q) use ($tanggal)
                {
                    return $q->whereNotNull('penjualan_lunas');
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
