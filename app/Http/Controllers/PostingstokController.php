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
        StokAwal::where('tanggal', $periode)->delete();
        $barang = Barang::with([
            'stok_awal' => fn ($q) =>
            $q->select('barang_id', 'qty')->where('tanggal', $periode)
        ])->with([
            'barang_masuk_detail' => fn ($q) =>
            $q->select('barang_id', 'qty')->whereHas(
                'barang_masuk',
                fn ($r) =>
                $r->whereRaw(DB::raw("month(tanggal)=$bulan and year(tanggal)=$tahun"))
            )
        ])->with([
            'penjualan_detail' => fn ($q) =>
            $q->select('barang_id', 'qty')->whereHas(
                'penjualan',
                fn ($r) =>
                $r->whereRaw(DB::raw("year(tanggal)=$tahun"))->whereRaw(DB::raw("month(tanggal)=$bulan"))
            )
        ])->get();

        $data = [];
        foreach ($barang as $index => $row) {
            $stok = 0;
            $masuk = 0;
            $keluar = 0;

            if ($row->stok_awal)
                $stok = $row->stok_awal->sum('qty');
            if ($row->barang_masuk)
                $masuk = $row->barang_masuk->sum('qty');
            if ($row->penjualan)
                $keluar = $row->penjualan->sum('qty');

            $sisa = $stok + $masuk - $keluar;
            array_push($data, [
                'tanggal' => $periode,
                'barang_id' => $row->id,
                'qty' => $sisa
            ]);
        }
        StokAwal::insert($data);

        return 1;
    }
}
