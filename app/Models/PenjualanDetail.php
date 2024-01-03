<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenjualanDetail extends Model
{
    use HasFactory;
    protected $table = 'penjualan_detail';
    public $timestamps = false;

    public function barang()
    {
        return $this->belongsTo(Barang::class)->withTrashed();
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function penjualan()
    {
        return $this->belongsTo(Penjualan::class);
    }
}
