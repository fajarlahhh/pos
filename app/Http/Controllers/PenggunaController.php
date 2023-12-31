<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use App\Models\Pengguna;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;

class PenggunaController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $req)
    {
        $tipe = $req->tipe ? $req->tipe : 0;

        $data = Pengguna::where('id', 'like', '%' . $req->cari . '%')->where('nama', 'like', '%' . $req->cari . '%');

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
        return view('pages.pengguna.index', [
            'data' => $data,
            'i' => ($req->input('page', 1) - 1) * 10,
            'cari' => $req->cari,
            'tipe' => $tipe,
        ]);
    }

    private function menu()
    {
        $menu = [];
        foreach (config('sidebar.menu') as $key => $row) {
            $sub_menu = [];
            if ($row['title'] != 'Dashboard') {
                if (!empty($row['sub_menu'])) {
                    foreach ($row['sub_menu'] as $key => $sub) {
                        $last_menu = [];
                        if (!empty($sub['sub_menu'])) {
                            foreach ($sub['sub_menu'] as $key => $last) {
                                array_push($last_menu, [
                                    'id' => $last['id'],
                                    'value' => $last['id'],
                                    'title' => $last['title']
                                ]);
                            }
                        }
                        array_push($sub_menu, [
                            'id' => $sub['id'],
                            'value' => $sub['id'],
                            'title' => $sub['title'],
                            'sub' => $last_menu
                        ]);
                    }
                }
                array_push($menu, [
                    'value' => !empty($row['sub_menu']) ? strtolower($row['title']) : $row['id'],
                    'title' => $row['title'],
                    'id' => $row['id'],
                    'sub' => $sub_menu
                ]);
            }
        }

        return $menu;
    }

    function subMenu($data, $value, $silsilah)
    {
        $subMenu = '';
        foreach ($value as $key => $row) {
            $class = $silsilah . " " . $row['id'];
            $subSubMenu = '';

            if (!empty($row['sub_menu'])) {
                $subSubMenu .= $this->subMenu($data, $row['sub_menu'], $class);
            }
            $checked = $data ? $data->roles[0]->name == 'admin' ? 'checked' : ($data->hasPermissionTo(!empty($row['sub_menu']) ? strtolower($row['id']) : $row['id']) ? 'checked' : '') : '';
            $subMenu .= "<div class='hakakses checkbox checkbox-css col-md-12'>
                            <input type='checkbox' class='" . $silsilah . "' onchange='child(this)' id='" . $row['id'] . "' name='menu[]' value='" . $row['id'] . "' " . $checked . "/>
                            <label for='" . $row['id'] . "' >" . $row['title'] . "</label>" . $subSubMenu . "</div>";
        }
        return $subMenu;
    }

    public function tambah()
    {
        $menu = '';
        foreach (config('sidebar.menu') as $key => $row) {
            if ($row['id'] != 'dashboard') {
                $class = $row['id'];
                $subMenu = '';
                if (!empty($row['sub_menu'])) {
                    $subMenu .= $this->subMenu(null, $row['sub_menu'], $class);
                }
                $menu .= "<div class='hakakses checkbox checkbox-css col-md-6 col-lg-6 col-xl-4'>
                            <input type='checkbox' id='" . $row['id'] . "' onchange='child(this)' name='menu[]' value='" . $row['id'] . "'/>
                            <label for='" . $row['id'] . "'>" . $row['title'] . "</label>" . $subMenu . "</div>";
            }
        }
        return view('pages.pengguna.form', [
            'level' => Role::all(),
            'back' => Str::contains(url()->previous(), ['pengguna/tambah', 'pengguna/edit']) ? '/pengguna' : url()->previous(),
            'menu' => $menu,
            'aksi' => 'Tambah',
            'i' => 0
        ]);
    }

    public function simpan(Request $req)
    {
        $req->validate([
            'id' => 'required',
            'nama' => 'required',
            'pengguna_level' => 'required'
        ]);

        if ($req->get('ID')) {
            DB::transaction(function () use ($req) {
                $pengguna = Pengguna::findOrFail($req->get('ID'));
                if ($req->get('sandi')) {
                    $pengguna->sandi = Hash::make($req->get('sandi'));
                }
                $pengguna->id = $req->get('id');
                $pengguna->nama = $req->get('nama');
                $pengguna->save();
                $pengguna->syncPermissions();
                $pengguna->removeRole($pengguna->getRoleNames()[0]);
                $pengguna->assignRole($req->get('pengguna_level'));

                $pengguna->givePermissionTo('dashboard');
                if ($req->get('menu')) {
                    foreach ($req->get('menu') as $key => $menu) {
                        $pengguna->givePermissionTo($menu);
                    }
                }
            });
            toast('Berhasil mengedit data', 'success')->autoClose(2000);
        } else {
            DB::transaction(function () use ($req) {
                $pengguna = new Pengguna();
                $pengguna->nama = $req->get('nama');
                $pengguna->id = $req->get('id');
                $pengguna->sandi = Hash::make($req->get('sandi'));
                $pengguna->save();
                $pengguna->assignRole($req->get('pengguna_level'));

                $pengguna->givePermissionTo('dashboard');
                if ($req->get('menu')) {
                    for ($i = 0; $i < sizeof($req->get('menu')); $i++) {
                        $pengguna->givePermissionTo($req->get('menu')[$i]);
                    }
                }
            });
            toast('Berhasil menambah data', 'success')->autoClose(2000);
        }
        return redirect($req->get('redirect') ? $req->get('redirect') : 'pengguna');
    }

    public function edit(Request $req)
    {
        $data = Pengguna::findOrFail($req->id);
        $menu = '';
        foreach (config('sidebar.menu') as $key => $row) {
            if ($row['id'] != 'dashboard') {
                $class = $row['id'];
                $subMenu = '';
                if (!empty($row['sub_menu'])) {
                    $subMenu .= $this->subMenu($data, $row['sub_menu'], $class);
                }
                $checked = $data ? $data->roles[0]->name == 'admin' ? 'checked' : ($data->hasPermissionTo(!empty($row['sub_menu']) ? strtolower($row['id']) : $row['id']) ? 'checked' : '') : '';
                $menu .= "<div class='hakakses checkbox checkbox-css col-md-6 col-lg-6 col-xl-4'>
                            <input type='checkbox' id='" . $row['id'] . "' onchange='child(this)' name='menu[]' value='" . $row['id'] . "' " . $checked . "/>
                            <label for='" . $row['id'] . "'>" . $row['title'] . "</label>" . $subMenu . "</div>";
            }
        }
        return view('pages.pengguna.form', [
            'data' => $data,
            'level' => Role::all(),
            'back' => Str::contains(url()->previous(), 'pengguna/edit') ? '/pengguna' : url()->previous(),
            'menu' => $menu,
            'aksi' => 'Edit',
            'i' => 0
        ]);
    }

    public function ganti_sandi($value = '')
    {
        return view('includes.component.modal-password');
    }

    public function do_ganti_sandi(Request $req)
    {
        $validator = Validator::make(
            $req->all(),
            [
                'sandi_baru' => 'required|min:5',
                'sandi_lama' => 'required|min:5',
            ]
        );

        if ($validator->fails()) {
            alert()->error('Validasi Gagal', implode('<br>', $validator->messages()->all()))->toHtml();
            return redirect()->back()->withInput()->with('error', $validator->messages()->all());
        }

            $pengguna = Pengguna::findOrFail(Auth::id());
            if ($pengguna) {
                if (!Hash::check($req->get('sandi_lama'), $pengguna->sandi)) {
                    alert()->error('Ganti Sandi Gagal', 'Kata sandi lama salah');
                    return redirect()->back();
                }
            } else {
                alert()->error('Ganti Sandi Gagal', 'Data pengguna tidak tersedia');
                return redirect()->back();
            }
            $pengguna->sandi = Hash::make($req->get('sandi_baru'));
            $pengguna->save();
            toast('Berhasil mengganti kata sandi', 'success')->autoClose(2000);
            return redirect()->back();
        } catch (\Exception $e) {
            alert()->error('Ganti Sandi Gagal', $e->getMessage());
            return redirect(url()->previous());
        }
    }

    public function ganti_status(Request $req)
    {
            $pengguna = Pengguna::findOrFail($req->get('id'));
            $pengguna->pengguna_status = $req->get('status');
            $pengguna->save();
            return $req->get('status');
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }

    public function hapus(Request $req)
    {
            $pengguna = Pengguna::findOrFail($req->get('id'));
            $pengguna->delete();
            toast('Berhasil menghapus data', 'success')->autoClose(2000);
        } catch (\Exception $e) {
            alert()->error('Hapus Data', $e->getMessage());
        }
    }

    public function restore(Request $req)
    {
            Pengguna::withTrashed()->findOrFail($req->get('id'))->restore();
            toast('Berhasil mengembalikan data', 'success')->autoClose(2000);
        } catch (\Exception $e) {
            alert()->error('Restore Data', $e->getMessage());
        }
    }
}
