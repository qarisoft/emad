<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    use HasFactory;
    protected $guarded = [
    ];


    public function customer():BelongsTo
    {
        return $this->belongsTo(Customer::class);
    }

    public function items():HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function post():void
    {
        $this->is_posted=true;
        $this->save();
        foreach ($this->items as $item){

        Charge::create([
            'year'=>date('Y'),
            'type'=>'out',
            'quantity'=>$item->quantity,
            'product_id'=>$item->product_id,
            'price'=>$item->product->price,
            'is_posted'=>true
        ]);
        }
    }

    public function getQuantity()
    {
        $q=0;
        foreach ($this->items as $item){
            $q+=$item->quantity;
        }
        return $q;

    }
    public function deliver():void
    {
        $this->is_delivered=true;
        $this->save();
    }

    public function updatePrice():void
    {
        $price = 0;
        foreach ($this->items as $item){
            $p = $item->product->price;
            $p*=$item->quantity;
            $price+=$p;
        }
        $this->order_price=$price;
        $this->save();
    }
}
