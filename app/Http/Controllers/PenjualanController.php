<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Barang;
use App\Models\Supplier;
use App\Models\Pelanggan;
use App\Models\Penjualan;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\PenjualanDetail;
use Illuminate\Support\Facades\DB;

class PenjualanController extends Controller
{
    //
    public function index(Request $req)
    {
        $tipe = $req->tipe ? $req->tipe : 0;
        $pembayaran = $req->pembayaran ? $req->pembayaran : 0;
        $tanggal = explode(' - ', $req->get('tanggal'));
        $tgl1 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[0])) : date('Y-m-01');
        $tgl2 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[1])) : date('Y-m-d');

        $data = Penjualan::with('pengguna')->with('detail')->whereBetween('tanggal', [$tgl1, $tgl2])->where(function ($q) use ($req) {
            $q->orWhere('keterangan', 'like', '%' . $req->cari . '%')->orWhere('id', 'like', '%' . $req->cari . '%')->orWhere('pengguna_id', 'like', '%' . $req->cari . '%')->orWhereHas('detail', function ($r) use ($req) {
                $r->whereHas('barang', function ($s) use ($req) {
                    return $s->where('nama', 'like', '%' . $req->cari . '%');
                });
            });
        })->orderBy('created_at', 'asc');

        switch ($tipe) {
            case '1':
                $data = $data->onlyTrashed();
                break;
            case '2':
                $data = $data->withTrashed();
                break;
        }

        switch ($pembayaran) {
            case '1':
                $data = $data->whereNull('lunas');
                break;
            case '2':
                $data = $data->whereNotNull('lunas');
                break;
        }

        $data = $data->paginate(10);
        $data->appends(['cari' => $req->cari, 'tipe' => $req->tipe, 'tanggal' =>  date('d F Y', strtotime($tgl1)) . ' - ' . date('d F Y', strtotime($tgl2))]);
        return view('pages.penjualan.index', [
            'data' => $data,
            'tgl' => date('d F Y', strtotime($tgl1)) . ' - ' . date('d F Y', strtotime($tgl2)),
            'tgl1' => $tgl1,
            'tgl2' => $tgl2,
            'i' => ($req->input('page', 1) - 1) * 10,
            'tipe' => $tipe,
            'pembayaran' => $pembayaran,
            'cari' => $req->cari,
        ]);
    }

    public function tambah(Request $req)
    {
        return view('pages.penjualan.form', [
            'pelanggan' => Pelanggan::all(),
            'barang' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['penjualan/tambah', 'penjualan/edit']) ? '/penjualan' : url()->previous()
        ]);
    }

    public function tambah_barang(Request $req, $id)
    {
        return view('pages.penjualan.barang', [
            'barang' => Barang::with('jenis_barang')->orderBy('nama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'barang' => 'required',
            'barang.*.qty' => 'required',
            'barang.*.harga' => 'required',
        ]);
        if (str_replace(',', '', $req->get('bayar')) < str_replace(',', '', $req->get('tagihan'))) {
            alert()->error('Simpan Data Gagal', "Jumlah Pembayaran Kurang");
            return redirect()->back()->withInput();
        }
        if (str_replace(',', '', $req->get('tagihan')) <= 0) {
            alert()->error('Simpan Data Gagal', "Subtotal tidak ada");
            return redirect()->back()->withInput();
        }
        if (!$req->barang) {
            alert()->error('Simpan Data Gagal', "Barang Belum Diinputkan");
            return redirect()->back()->withInput();
        }

        DB::transaction(function () use ($req) {
            $id = "CFF" . date('ym') . "00001";
            $penjualan = Penjualan::where('created_at', 'like', date('Y-m-d') . '%')->orderBy('created_at', 'desc')->first();
            if ($penjualan) {
                $penjualan = sprintf('%04s', (int) (substr($penjualan->id, 9)) + 1);
                $id = "CFF" . date('ym') . $penjualan;
            }

            $data = new Penjualan();
            $data->id = $id;
            $data->tanggal = Carbon::now()->format('Y-m-d');
            $data->pelanggan_id = $req->get('pelanggan_id');
            $data->keterangan = $req->get('keterangan');
            $data->sub_total = str_replace(',', '', $req->get('sub_total'));
            $data->diskon = $req->get('diskon') ? str_replace(',', '', $req->get('diskon')) : 0;
            $data->tagihan = str_replace(',', '', $req->get('tagihan'));
            $data->bayar = str_replace(',', '', $req->get('bayar'));
            $data->sisa = str_replace(',', '', $req->get('sisa'));
            if ($req->get('jatuh_tempo')) {
                $data->jatuh_tempo = $req->get('jatuh_tempo') ? Carbon::parse($req->get('jatuh_tempo'))->format('Y-m-d') : null;
            } else {
                $data->lunas = Carbon::now()->format('Y-m-d');
            }
            $data->save();
            foreach ($req->barang as $index => $brg) {
                $detail = new PenjualanDetail();
                $detail->penjualan_id = $id;
                $detail->barang_id = $brg['id'];
                $detail->satuan = $brg['satuan'];
                $detail->harga = str_replace(',', '', $brg['harga']);
                $detail->qty = $brg['qty'];
                $detail->total = str_replace(',', '', $brg['total']);
                $detail->save();
            }

            $cetak = view('pages.penjualan.kwitansi', [
                'data' => Penjualan::find($id),
            ])->render();

            session()->flash('cetak', $cetak);
        });

        toast('Berhasil menyimpan data', 'success')->autoClose(2000);
        return redirect('penjualan');
    }

    public function nota($cetak, $id)
    {
        $cetak = view('pages.penjualan.kwitansi', [
            'data' => Penjualan::find($id),
        ])->render();

        session()->flash('cetak', $cetak);
        return redirect('penjualan/data');
    }

    public function hapus(Request $req)
    {
        Penjualan::findOrFail($req->get('id'))->delete();
        toast('Berhasil menghapus data', 'success')->autoClose(2000);
    }

    public function restore(Request $req)
    {
        Penjualan::withTrashed()->findOrFail($req->get('id'))->restore();
        toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
    }
}
