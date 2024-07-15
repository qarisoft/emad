<?php

namespace App\Filament\Resources;

use App\Events\OrderShipped;
use App\Filament\Resources\ChargeResource\Pages;
//use App\Filament\Resources\ChargeResource\RelationManagers;
use App\Models\Charge;
//use Filament\Actions\Action;
use Filament\Tables\Enums\FiltersLayout;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ChargeResource extends Resource
{
    protected static ?string $model = Charge::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('quantity')->numeric()
                    ->required()->columnSpan(1)
                    ->disabled(function (?Model $record ,$operation){
                        return  $record?->is_posted ||$operation==='edit';
                    }),
                Forms\Components\Select::make('product_id')->options(function (){
                    return Product::pluck('name','id');
                })
                    ->columnSpan(1)
                    ->disabled(function (?Model $record,$operation ){
                    return  $record?->is_posted ||$operation==='edit';
                }),
                Forms\Components\Select::make('type')->options(['in'=>'in','out'=>'out'])
                    ->columnSpan(1)
                    ->disabled(function (?Model $record ,$operation){
                        return  $record?->is_posted ||$operation==='edit';
                    }),
                Forms\Components\TextInput::make('price')->numeric()
                    ->disabled(function (?Model $record,$operation ){
                    return  $record?->is_posted ||$operation==='edit';
                })

            ])->columns(2);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
//                Tables\Columns\Layout\Stack::make([

                Tables\Columns\TextColumn::make('quantity'),
                Tables\Columns\TextColumn::make('type'),

//                Tables\Columns\Layout\Panel::make([

                Tables\Columns\TextColumn::make('product.name'),
                Tables\Columns\TextColumn::make('price'),
                Tables\Columns\TextColumn::make('year'),
                Tables\Columns\IconColumn::make('is_posted')->boolean()
//                ])
//                ])

            ])->defaultGroup('product_id')
            ->filters([
                Tables\Filters\Filter::make('is_posted')->toggle(),
                Tables\Filters\SelectFilter::make('product_id')->relationship('product','name'),

            ]
//                ,layout: FiltersLayout::AboveContent
            )
            ->actions([
                Action::make('Post')
                    ->requiresConfirmation()
                    ->action(function (Charge $record) {
                        $record->is_posted=true;
                        $record->save();
//                        event(new OrderShipped($record));
                })
                    ->hidden(fn (Charge $record) => $record->is_posted)
                ->color('success')->icon('heroicon-s-arrow-up-tray')
                ,
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCharges::route('/'),
            'create' => Pages\CreateCharge::route('/create'),
//            'edit' => Pages\EditCharge::route('/{record}/edit'),
        ];
    }
}
