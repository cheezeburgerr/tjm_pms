<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lineup extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id', 'product_id', 'player_name', 'player_details', 'classification',
        'gender', 'upper_size', 'lower_size', 'remarks', 'price'
    ];

    public function products ()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }
}
