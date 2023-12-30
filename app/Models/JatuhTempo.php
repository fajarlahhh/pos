<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JatuhTempo extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'jatuh_tempo';

    public function barang_masuk()
    {
        return $this->hasMany(BarangMasuk::class, 'faktur', 'faktur');
    }
}
