<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionDetails extends Model
{
    use HasFactory;


    protected $fillable = [
        'order_id',
        'status',
        'start_production',
        'end_production',
        'printing_progress',
        'sewing_progress',
        'downtime',
        'note'
    ];
    public function order() {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function printer() {
        return $this->hasOne(Equipment::class, 'id', 'printer_id');
    }
}
