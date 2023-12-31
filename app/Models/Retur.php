<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Retur extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'retur';

    public function barang()
    {
        return $this->belongsTo(Barang::class)->withTrashed();
    }

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class);
    }
}
