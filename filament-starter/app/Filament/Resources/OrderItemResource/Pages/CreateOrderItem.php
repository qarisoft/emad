<?php

namespace App\Filament\Resources\OrderItemResource\Pages;

use App\Filament\Widgets\OrderItemResource;
use Filament\Resources\Pages\CreateRecord;

class CreateOrderItem extends CreateRecord
{
    protected static string $resource = OrderItemResource::class;
}
