<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\Pengguna;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BarangMasuk extends Model
{
    use HasFactory;
    use Pengguna;
    use SoftDeletes;
    //
    protected $table = 'barang_masuk';
    protected $primaryKey = 'barang_masuk_id';

    public function pengguna()
    {
        return $this->belongsTo('App\Models\Pengguna', 'pengguna_id', 'pengguna_id');
    }

    public function detail()
    {
        return $this->hasMany('App\Models\BarangMasukDetail', 'barang_masuk_id', 'barang_masuk_id');
    }

    public function supplier()
    {
        return $this->belongsTo('App\Models\Supplier', 'supplier_id', 'supplier_id');
    }

    public function getCreatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }

    public function getUpdatedAtAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LLLL');
    }

    public function getBarangMasukKadaluarsaAttribute($value)
    {
         return Carbon::parse($value)->isoFormat('LL');
    }
}
