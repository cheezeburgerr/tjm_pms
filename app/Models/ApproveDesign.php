<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApproveDesign extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'image_name',
        'status'
    ];


    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
}
