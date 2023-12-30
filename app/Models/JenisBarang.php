<?php

namespace App\Models;

use Carbon\Carbon;
use App\Traits\Pengguna;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JenisBarang extends Model
{
    use HasFactory;
    use SoftDeletes;
    use Pengguna;
    //
    protected $table = 'jenis_barang';

    public function barang()
    {
        return $this->hasMany(Barang::class);
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
