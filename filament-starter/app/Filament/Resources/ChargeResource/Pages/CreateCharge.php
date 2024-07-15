<?php

namespace App\Filament\Resources\ChargeResource\Pages;

use App\Filament\Resources\ChargeResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCharge extends CreateRecord
{
    protected static string $resource = ChargeResource::class;

    public function handleRecordCreation($data): \Illuminate\Database\Eloquent\Model
    {
        $data['year']=date('Y');
        return parent::handleRecordCreation($data);
//        return

    }
}
