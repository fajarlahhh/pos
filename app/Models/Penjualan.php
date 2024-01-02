<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\PenggunaTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Penjualan extends Model
{
    use HasFactory;
    use SoftDeletes;
    use PenggunaTrait;
    //
    protected $table = 'penjualan';
    public $incrementing = false;
    protected $keyType = 'string';

    public function pelanggan()
    {
        return $this->belongsTo(Pelanggan::class);
    }

    public function detail()
    {
        return $this->hasMany(PenjualanDetail::class);
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
