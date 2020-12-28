<?php

namespace App\Http\Controllers;

use App\Models\Biaya;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BiayaController extends Controller
{
    //
    public function index(Request $req)
	{
        $data = Biaya::all();
        return view('pages.setup.biaya.form', [
            'data' => $data
        ]);
    }

	public function simpan(Request $req)
	{
        $req->validate([
            'biaya' => 'required'
        ]);

        try{
            DB::transaction(function () use ($req) {
                Biaya::truncate();
                foreach ($req->biaya as $index => $biaya) {
                    $data = new Biaya();
                    $data->biaya_nama = $biaya['biaya_nama'];
                    $data->biaya_nilai = str_replace(',', '', $biaya['biaya_nilai']);
                    $data->biaya_tampil = 1;
                    $data->biaya_per = $biaya['biaya_per'];
                    $data->biaya_satuan = $biaya['biaya_satuan'];
                    $data->save();
                }
            });

            return redirect('biaya');
		}catch(\Exception $e){
            alert()->error('Simpan Data Gagal', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }
}
