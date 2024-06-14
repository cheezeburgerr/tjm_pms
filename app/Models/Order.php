<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = ['team_name', 'due_date', 'customer_id', 'total_price', 'downpayment'];

    public function products()
    {
        return $this->hasMany(OrderProduct::class);
    }

    public function lineups()
    {
        return $this->hasMany(Lineup::class);
    }

    public function files()
    {
        return $this->hasMany(OrderImage::class);
    }

    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id');
    }

    public function production()
    {
        return $this->hasOne(ProductionDetails::class, 'order_id');
    }
}
