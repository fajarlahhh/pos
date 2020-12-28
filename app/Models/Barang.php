<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\Pengguna;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Barang extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Pengguna;
    //
    protected $table = 'barang';
    protected $primaryKey = 'barang_id';

    public function jenis_barang()
    {
        return $this->belongsTo('App\Models\JenisBarang', 'jenis_barang_id', 'jenis_barang_id');
    }

    public function satuan_utama()
    {
        return $this->hasOne('App\Models\Satuan', 'barang_id', 'barang_id')->where('utama', 1);
    }

    public function satuan_lain()
    {
        return $this->hasMany('App\Models\Satuan', 'barang_id', 'barang_id')->where('utama', 0);
    }

    public function barang_masuk()
    {
        return $this->hasMany('App\Models\BarangMasukDetail', 'barang_id', 'barang_id');
    }

    public function stok_awal()
    {
        return $this->hasMany('App\Models\StokAwal', 'barang_id', 'barang_id');
    }

    public function penjualan()
    {
        return $this->hasMany('App\Models\PenjualanDetail', 'barang_id', 'barang_id')->whereHas('penjualan', function($q){
            $q->where('deleted_at', NULL);
        });
    }

    public function satuan_semua()
    {
        return $this->hasMany('App\Models\Satuan', 'barang_id', 'barang_id')->orderBy('utama', 'desc');
    }

    public function supplier()
    {
        return $this->belongsTo('App\Models\Supplier', 'supplier_id', 'supplier_id');
    }

    public function pengguna()
    {
        return $this->belongsTo('App\Models\Pengguna', 'pengguna_id', 'pengguna_id');
    }

    public function getCreatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }

    public function getUpdatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }
}
