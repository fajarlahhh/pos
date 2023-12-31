<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Barang;
use App\Models\StokAwal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PostingstokController extends Controller
{
    //
    public function index(Request $req)
    {
        return view('pages.postingstok.form', [
            'tahun' => date("Y", strtotime("-1 months")),
            'bulan' => date("m", strtotime("-1 months"))
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'bulan' => 'required',
            'tahun' => 'required'
        ]);

        $bulan = $req->get('bulan');
        $tahun = $req->get('tahun');
        $periode = Carbon::create($tahun, $bulan, 1, 0)->addMonths(1)->format('Y-m-01');
        StokAwal::where('awal_tanggal', $periode)->delete();
        $barang = Barang::with(['stok_awal' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', 'qty')->whereRaw(DB::raw("year(awal_tanggal)=$tahun"))->whereRaw(DB::raw("month(awal_tanggal)=$bulan"));
        }])->with(['barang_masuk' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', DB::raw("sum(qty) masuk"))->whereHas('barang_masuk', function ($r) use ($bulan, $tahun) {
                return $r->whereRaw(DB::raw("month(tanggal)=$bulan and year(tanggal)=$tahun"));
            })->groupBy('barang_id');
        }])->with(['penjualan' => function ($q) use ($bulan, $tahun) {
            $q->select('barang_id', DB::raw("sum(qty/rasio_dari_utama) keluar"))->whereHas('penjualan', function ($r) use ($bulan, $tahun) {
                $r->whereRaw(DB::raw("year(tanggal)=$tahun"))->whereRaw(DB::raw("month(tanggal)=$bulan"));
            })->groupBy('barang_id');
        }])->whereNull('pbf_id')->get();

        $data = [];
        foreach ($barang as $index => $row) {
            $stok = 0;
            $masuk = 0;
            $keluar = 0;

            if ($row->stok_awal->count() > 0) {
                $stok = $row->stok_awal->first()->qty;
            }
            if ($row->barang_masuk->count() > 0) {
                $masuk = $row->barang_masuk->first()->masuk;
            }
            if ($row->penjualan->count() > 0) {
                $keluar = $row->penjualan->first()->keluar;
            }

            $sisa = $stok + $masuk - $keluar;
            array_push($data, [
                'awal_tanggal' => $periode,
                'barang_id' => $row->id,
                'qty' => $sisa
            ]);
        }
        StokAwal::insert($data);

        return 1;
    }
}
