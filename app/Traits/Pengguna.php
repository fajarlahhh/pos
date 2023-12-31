<?php

namespace App\Traits;

/**
 *
 */
trait Pengguna
{
    public static function bootPengguna()
    {
        if (auth()->check()) {
            static::creating(function($model){
                $model->id = auth()->id();
            });
        }
    }
}
