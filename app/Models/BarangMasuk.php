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

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class);
    }

    public function detail()
    {
        return $this->hasMany(BarangMasukDetail::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
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
