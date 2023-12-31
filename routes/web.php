<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BiayaController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\CekstokController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PelangganController;
use App\Http\Controllers\PenjualanController;
use App\Http\Controllers\BarangmasukController;
use App\Http\Controllers\JenisbarangController;
use App\Http\Controllers\PostingstokController;
use App\Http\Controllers\PenjualanresepController;
use App\Http\Controllers\ReturController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::post('login', [LoginController::class, 'authenticate']);
Route::group(['middleware' => ['auth']], function () {
    Route::get('/', [DashboardController::class,'index']);
    Route::get('/dashboard/faktur', [DashboardController::class,'faktur']);
    Route::get('/dashboard/nota', [DashboardController::class,'nota']);
    Route::post('/dashboard/kadaluarsa', [DashboardController::class,'kadaluarsa']);
    Route::post('/dashboard/lunasbm', [DashboardController::class,'lunas_bm']);
    Route::post('/dashboard/lunasjual', [DashboardController::class,'lunas_penjualan']);
    Route::get('/dashboard', [DashboardController::class,'index']);
    Route::get('/gantisandi', [PenggunaController::class, 'ganti_sandi'])->name('gantisandi');
    Route::patch('/gantisandi', [PenggunaController::class, 'do_ganti_sandi'])->name('gantisandi.simpan');
    Route::get('/barang/cari', [BarangController::class, 'cari']);

    Route::group(['middleware' => ['role_or_permission:super-admin|cekstok']], function () {
        Route::prefix('cekstok')->group(function () {
            Route::get('/', [CekstokController::class, 'index'])->name('cekstok');
            Route::get('/tambahbarang/{id}', [CekstokController::class, 'tambah_barang']);
            Route::get('/cek', [CekstokController::class, 'cek'])->middleware(['role:super-admin|user|supervisor'])->name('cekstok.cek');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|biaya']], function () {
        Route::prefix('biaya')->group(function () {
            Route::get('/', [BiayaController::class, 'index'])->name('biaya');
            Route::post('/simpan', [BiayaController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('biaya.simpan');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|postingstok']], function () {
        Route::prefix('postingstok')->group(function () {
            Route::get('/', [PostingstokController::class, 'index'])->name('postingstok');
            Route::post('/', [PostingstokController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('postingstok.posting');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|barang']], function () {
        Route::prefix('barang')->group(function () {
            Route::get('/tambahsatuan/{id}', [BarangController::class, 'tambah_satuan']);
            Route::get('/', [BarangController::class, 'index'])->name('barang');
            Route::get('/tambah', [BarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barang.tambah');
            Route::get('/edit', [BarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('barang.edit');
            Route::post('/simpan', [BarangController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('barang.simpan');
            Route::delete('/hapus', [BarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [BarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|jenisbarang']], function () {
        Route::prefix('jenisbarang')->group(function () {
            Route::get('/', [JenisbarangController::class, 'index'])->name('jenisbarang');
            Route::get('/tambah', [JenisbarangController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.tambah');
            Route::get('/edit', [JenisbarangController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.edit');
            Route::post('/simpan', [JenisbarangController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('jenisbarang.simpan');
            Route::delete('/hapus', [JenisbarangController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [JenisbarangController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|supplier']], function () {
        Route::prefix('supplier')->group(function () {
            Route::get('/', [SupplierController::class, 'index'])->name('supplier');
            Route::get('/tambah', [SupplierController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('supplier.tambah');
            Route::get('/edit', [SupplierController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('supplier.edit');
            Route::post('/simpan', [SupplierController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('supplier.simpan');
            Route::delete('/hapus', [SupplierController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [SupplierController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pelanggan']], function () {
        Route::prefix('pelanggan')->group(function () {
            Route::get('/', [PelangganController::class, 'index'])->name('pelanggan');
            Route::get('/tambah', [PelangganController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pelanggan.tambah');
            Route::get('/edit', [PelangganController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('pelanggan.edit');
            Route::post('/simpan', [PelangganController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('pelanggan.simpan');
            Route::delete('/hapus', [PelangganController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PelangganController::class, 'restore'])->middleware(['role:super-admin|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|pengguna']], function () {
        Route::prefix('pengguna')->group(function () {
            Route::get('/', [PenggunaController::class, 'index'])->name('pengguna');
            Route::get('/tambah', [PenggunaController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.tambah');
            Route::get('/edit', [PenggunaController::class, 'edit'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.edit');
            Route::post('/simpan', [PenggunaController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('pengguna.simpan');
            Route::delete('/hapus', [PenggunaController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::delete('/restore', [PenggunaController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|barangmasuk']], function () {
        Route::prefix('barangmasuk')->group(function () {
            Route::get('/tambahbarang/{id}', [BarangmasukController::class, 'tambah_barang']);
            Route::get('/', [BarangmasukController::class, 'index'])->name('barangmasuk');
            Route::get('/tambah', [BarangmasukController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('barangmasuk.tambah');
            Route::post('/simpan', [BarangmasukController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('barangmasuk.simpan');
            Route::delete('/hapus', [BarangmasukController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [BarangmasukController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|retur']], function () {
        Route::prefix('retur')->group(function () {
            Route::get('/tambahbarang/{id}', [ReturController::class, 'tambah_barang']);
            Route::get('/', [ReturController::class, 'index'])->name('retur');
            Route::get('/tambah', [ReturController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('retur.tambah');
            Route::post('/simpan', [ReturController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('retur.simpan');
            Route::delete('/hapus', [ReturController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [ReturController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|penjualan']], function () {
        Route::prefix('penjualan')->group(function () {
            Route::get('/kwitansi/{cetak}/{id}', [PenjualanController::class, 'nota']);
            Route::get('/tambahbarang/{id}', [PenjualanController::class, 'tambah_barang']);
            Route::get('/data', [PenjualanController::class, 'index'])->name('penjualan');
            Route::get('/penjualan/kwitansi/{id}', [PenjualanController::class, 'index']);
            Route::get('/', [PenjualanController::class, 'tambah']);
            Route::get('/tambah', [PenjualanController::class, 'tambah'])->middleware(['role:super-admin|user|supervisor'])->name('penjualan.tambah');
            Route::post('/simpan', [PenjualanController::class, 'simpan'])->middleware(['role:super-admin|user|supervisor'])->name('penjualan.simpan');
            Route::delete('/hapus', [PenjualanController::class, 'hapus'])->middleware(['role:super-admin|user|supervisor']);
            Route::patch('/restore', [PenjualanController::class, 'restore'])->middleware(['role:super-admin|user|supervisor']);
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanpenjualan']], function () {
        Route::prefix('laporanpenjualan')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanpenjualan'])->name('laporanpenjualan');
            Route::get('/{cetak}', [LaporanController::class, 'laporanpenjualan'])->name('laporanpenjualan.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanstokbarang']], function () {
        Route::prefix('laporanstokbarang')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanstokbarang'])->name('laporanstokbarang');
            Route::get('/{cetak}', [LaporanController::class, 'laporanstokbarang'])->name('laporanstokbarang.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporanlabarugi']], function () {
        Route::prefix('laporanlabarugi')->group(function () {
            Route::get('/', [LaporanController::class, 'laporanlabarugi'])->name('laporanlabarugi');
            Route::get('/{cetak}', [LaporanController::class, 'laporanlabarugi'])->name('laporanlabarugi.cetak');
        });
    });

    Route::group(['middleware' => ['role_or_permission:super-admin|laporankonsinyasi']], function () {
        Route::prefix('laporankonsinyasi')->group(function () {
            Route::get('/', [LaporanController::class, 'laporankonsinyasi'])->name('laporankonsinyasi');
            Route::get('/{cetak}', [LaporanController::class, 'laporankonsinyasi'])->name('laporankonsinyasi.cetak');
        });
    });
});


