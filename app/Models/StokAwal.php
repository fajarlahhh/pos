<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokAwal extends Model
{
    use HasFactory;
    protected $table = 'stok_awal';
    protected $primaryKey = ["barang_id", "stok_awal_tanggal"];
    public $incrementing = false;
    public $timestamps = false;
    protected $keyType = 'string';
}
