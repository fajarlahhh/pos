<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use Illuminate\Http\Request;

class CekstokController extends Controller
{
    //
    public function index()
    {
        return view('pages.cekstok.index');
    }

	public function tambah_barang(Request $req, $id)
	{
        return view('pages.cekstok.barang',[
            'barang' => Barang::all(),
            'id' => $id
        ]);
    }
}
