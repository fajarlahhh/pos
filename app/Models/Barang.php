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

    public function jenis_barang()
    {
        return $this->belongsTo(JenisBarang::class);
    }

    public function satuan_utama()
    {
        return $this->hasOne(Satuan::class)->where('utama', 1);
    }

    public function satuan_lain()
    {
        return $this->hasMany(Satuan::class)->where('utama', 0);
    }

    public function barang_masuk()
    {
        return $this->hasMany(BarangMasukDetail::class);
    }

    public function stok_awal()
    {
        return $this->hasMany(StokAwal::class);
    }

    public function penjualan()
    {
        return $this->hasMany(PenjualanDetail::class)->whereHas('penjualan', function($q){
            $q->where('deleted_at', NULL);
        });
    }

    public function satuan_semua()
    {
        return $this->hasMany(Satuan::class)->orderBy('utama', 'desc');
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class);
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
