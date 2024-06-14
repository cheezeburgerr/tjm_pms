<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_name',
        'product_id'
    ];

    public function products ()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }


    public function variation ()
    {
        return $this->hasMany(Variation::class, 'category_id');
    }
}
