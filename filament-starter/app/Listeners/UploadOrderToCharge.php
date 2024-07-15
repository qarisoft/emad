<?php

namespace App\Listeners;

use App\Events\OrderShipped;
use App\Models\Charge;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class UploadOrderToCharge
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {

    }

    /**
     * Handle the event.
     */
    public function handle(OrderShipped $event): void
    {
        foreach ($event->items as $item){

        Charge::create([
            'quantity'=>$item->quantity,
            'product_id'=>$item->product->id,
            'type'=>'out',
            'is_posted'=>true,
            'price'=>$item->product->price,


        ]);
        }
    }
}
