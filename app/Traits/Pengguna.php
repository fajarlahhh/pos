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
                $model->pengguna_id = auth()->id();
            });
        }
    }
}
