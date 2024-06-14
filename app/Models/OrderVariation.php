<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderVariation extends Model
{
    use HasFactory;

    protected $fillable = ['order_id', 'product_id', 'category_id', 'variation_id'];


    public function category ()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
    public function variations ()
    {
        return $this->belongsTo(Variation::class, 'variation_id');
    }
}
