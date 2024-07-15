<?php

namespace App\Models;
use Filament\Forms;
use Filament\Forms\Form;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $guarded = [
    ];
    public static function getForm(): array
    {
        return [
            Forms\Components\TextInput::make('name')
                ->required(),
        ];
    }
}
