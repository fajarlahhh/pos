<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    //
    public function authenticate(Request $req)
    {
        $validate = $req->validate([
            'uid' => 'required',
            'password' => 'required',
        ]);

        $remember = ($req->remember == 'on') ? true : false;
        if (Auth::attempt(['pengguna_id' => $req->uid, 'password' => $req->password], $remember)) {
            return redirect()->intended('dashboard')
            ->with([
                'gritter_judul' => 'Selamat datang '.Auth::user()->pengguna_nama,
                'gritter_teks' => 'Selamat bekerja dan semoga sukses',
                'gritter_gambar' => '../assets/img/user/user.png'
                ]);
        }
        alert()->error('Login Gagal','ID atau Kata Sandi salah');
        return redirect()->back()->withInput();
    }

    public function logout()
    {
        Auth::logout();
        return redirect('login');
    }
}
