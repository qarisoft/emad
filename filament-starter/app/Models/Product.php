<?php

namespace App\Models;

use Filament\Forms;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    use HasFactory;
    protected $guarded = [
    ];


    public function charges():HasMany
    {
        return $this->hasMany(Charge::class);
    }



    public static function getForm():array
    {
        return [
            Forms\Components\TextInput::make('name')
                ->required(),
            Forms\Components\TextInput::make('price')
                ->required()
                ->numeric()
                ->prefix('$'),
        ];
    }
}
