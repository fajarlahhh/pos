<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BarangMasukDetail extends Model
{
    use HasFactory;
    //
    protected $table = 'barang_masuk_detail';
    public $timestamps = false;

    public function barang()
    {
        return $this->belongsTo(Barang::class)->withTrashed();
    }

    public function barang_masuk()
    {
        return $this->belongsTo(BarangMasuk::class);
    }
}
