<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Variation extends Model
{
    use HasFactory;

    protected $fillable = [
        'variation_name',
        'variation_price',
        'category_id'
    ];

    public function categories ()
    {
        return $this->belongsTo(Category::class, 'product_id');
    }
}
