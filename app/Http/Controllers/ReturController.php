<?php

namespace App\Http\Controllers;

use App\Models\Retur;
use Illuminate\Http\Request;

class ReturController extends Controller
{
    public function index(Request $req)
    {
        $tipe = $req->tipe ? $req->tipe : 0;
        $tanggal = explode(' - ', $req->get('tanggal'));
        $tgl1 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[0])) : date('Y-m-01');
        $tgl2 = $req->get('tanggal') ? date('Y-m-d', strtotime($tanggal[1])) : date('Y-m-d');

        $data = Retur::with('pengguna')->with('detail.barang')->where(function ($q) use ($req) {
            $q->where('faktur', 'like', '%' . $req->cari . '%')->orWhere('sales', 'like', '%' . $req->cari . '%')->orWhere('keterangan', 'like', '%' . $req->cari . '%')->orWhereHas('supplier', function ($q) use ($req) {
                $q->where('nama', 'like', '%' . $req->cari . '%');
            });
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
        return view('pages.Retur.index', [
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
        return view('pages.Retur.form', [
            'supplier' => Supplier::all(),
            'barang_masuk' => [],
            'banyak' => $req->jumlah,
            'back' => Str::contains(url()->previous(), ['Retur/tambah', 'Retur/edit']) ? '/Retur' : url()->previous()
        ]);
    }

    public function tambah_barang(Request $req, $id)
    {
        return view('pages.Retur.barang', [
            'barang' => Barang::with('satuan_utama')->get(),
            'data' => $req->barang,
            'id' => $id
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'faktur' => 'required',
            'tanggal' => 'required'
        ]);

        try {
            if (Retur::where('faktur', $req->faktur)->where('jatuh_tempo', $req->jatuh_tempo)->count() > 0) {
                alert()->error('Gagal Menyimpan Data', 'Nomor faktur sudah diinputkan');
                return redirect()->back()->withInput();
            }
            DB::transaction(function () use ($req) {
                $data = new Retur();
                $data->tanggal = Carbon::parse($req->get('tanggal'))->format('Y-m-d');
                $data->faktur = $req->get('faktur');
                $data->supplier_id = $req->get('supplier_id');
                if ($req->get('jatuh_tempo')) {
                    $data->jatuh_tempo = $req->get('jatuh_tempo') ? Carbon::parse($req->get('jatuh_tempo'))->format('Y-m-d') : null;
                } else {
                    $data->lunas = Carbon::now()->format('Y-m-d');
                }
                $data->sales = $req->get('sales');
                $data->keterangan = $req->get('keterangan');
                $data->save();

                foreach ($req->barang_masuk as $index => $barang_masuk) {
                    $detail = new ReturDetail();
                    $detail->barang_masuk_id = $data->barang_masuk_id;
                    $detail->barang_id = $barang_masuk['barang_id'];
                    $detail->nomor_batch = $barang_masuk['nomor_batch'];
                    $detail->harga_barang = str_replace(',', '', $barang_masuk['harga_barang']);
                    $detail->harga_pph = str_replace(',', '', $barang_masuk['harga_pph']);
                    $detail->qty = $barang_masuk['qty'];
                    $detail->diskon = $barang_masuk['diskon'];
                    $detail->kadaluarsa = Carbon::parse($barang_masuk['kadaluarsa'])->format('Y-m-d');
                    $detail->sub_total_ppn = str_replace(',', '', $req->get('sub_total_ppn'));
                    $detail->sub_total = str_replace(',', '', $req->get('sub_total'));
                    $detail->save();
                }
            });

            toast('Berhasil menambah data', 'success')->autoClose(2000);
            if ($req->banyak == 1)
                return redirect('Retur/tambah?jumlah=banyak');
            else
                return redirect($req->get('redirect') ? $req->get('redirect') : 'Retur');
        } catch (\Exception $e) {
            alert()->error('Tambah Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function hapus(Request $req)
    {
        try {
            Retur::findOrFail($req->get('id'))->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
        } catch (\Exception $e) {
            alert()->error('Hapus Data Gagal', $e->getMessage());
        }
    }

    public function restore(Request $req)
    {
        try {
            Retur::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
        } catch (\Exception $e) {
            alert()->error('Restore Data Gagal', $e->getMessage());
        }
    }
}
