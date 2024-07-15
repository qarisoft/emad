<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Charge extends Model
{
    use HasFactory;
    protected $guarded=[];
    protected $casts=[
        'is_posted'=> 'boolean',
    ];

    public function product():BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    protected static function booted()
    {
        static::creating(function (Charge $charge){
            $charge->year=date('Y');
        });

    }

    public function scopeIn($query)
    {
        return $query->where('type','=','in');
    }

    public function scopeOut($query)
    {
        return $query->where('type','=','out');
    }
}
