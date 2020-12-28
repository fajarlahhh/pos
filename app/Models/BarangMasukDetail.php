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
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;

    public function barang()
    {
        return $this->belongsTo('App\Models\Barang', 'barang_id', 'barang_id');
    }

    public function barang_masuk()
    {
        return $this->belongsTo('App\Models\BarangMasuk', 'barang_masuk_id', 'barang_masuk_id');
    }
}
