<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\PenggunaTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Barang extends Model
{
    use HasFactory;
    use SoftDeletes;
    use PenggunaTrait;
    //
    protected $table = 'barang';

    public function jenis_barang()
    {
        return $this->belongsTo(JenisBarang::class);
    }

    public function barang_masuk_detail()
    {
        return $this->hasMany(BarangMasukDetail::class);
    }

    public function stok_awal()
    {
        return $this->hasMany(StokAwal::class);
    }

    public function penjualan_detail()
    {
        return $this->hasMany(PenjualanDetail::class);
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
