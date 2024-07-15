<?php

namespace App\Models;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Infolists\Components\TextEntry;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderItem extends Model
{
    use HasFactory;
    protected $guarded =[];

    public function order():BelongsTo
    {
        return $this->belongsTo(Order::class);
    }

    public function product():BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
    protected static function booted(): void
    {
        static::created(function (OrderItem $orderItem) {
            $total_price = $orderItem->quantity;
            $total_price *= $orderItem->product->price;
//            $total_price *= Product::find($orderItem->product_id)->price;
                $orderItem->order_item_price = $total_price;
//                $orderItem->save();
                $orderItem->order->updatePrice();

        });
        static::updated(function (OrderItem $orderItem) {
            $total_price = $orderItem->quantity;
            $total_price *= $orderItem->product->price;

//            $total_price *= Product::find($orderItem->product_id)->price;
            $orderItem->order_item_price = $total_price;
//            $orderItem->save();
            $orderItem->order->updatePrice();

        });
    }

    public static function getForm($orderId=null):array
    {
        return [
            Select::make('product_id')
                ->relationship('product', 'name')
                ->live()
                ->required()
                ->afterStateUpdated(
                    function (?string $state,Get $get,Set $set){
                        $qu=$get('quantity');
                        $p = Product::find($state)->price *$qu;
                        $set('order_item_price',$p);
                    }
                )

            ,

            TextInput::make('quantity')
                ->required()
                ->live()
                ->numeric()
                ->default(1)
                ->afterStateUpdated(
                    function (?string $state,Get $get,Set $set){
                        if($get('product_id')==null){return;}
                        $p = Product::find($get('product_id'))->price *$state;
                        $set('order_item_price',$p);
                    }
                )

            ,
            TextInput::make('order_item_price')
                ->required()
//                ->disabled(true)
                ->numeric()

                ->default(0),
//            TextEntry::make('title'),


            Select::make('order_id')
                ->hidden(function () use($orderId){
                    return $orderId != null;
                })
                ->relationship('order', 'id'),
        ];
    }
}
