<?php

namespace App\Filament\Resources\OrderResource\RelationManagers;

use App\Models\OrderItem;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'items';

    public function isReadOnly(): bool
    {
        return false;
    }


    public function form(Form $form): Form
    {
        return $form
            ->schema([

                    Forms\Components\Repeater::make('items')
                    ->relationship('items')
                    ->schema(
                        OrderItem::getForm($this->getOwnerRecord()->id)
                    )
                    ->cloneable()
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('quantity')
            ->columns([
                    Tables\Columns\TextColumn::make('product.name')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('quantity')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('order_item_price')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('order.id')
                        ->numeric()
                        ->sortable(),
                    Tables\Columns\TextColumn::make('created_at')
                        ->dateTime()
                        ->sortable()
                        ->toggleable(isToggledHiddenByDefault: true),
                    Tables\Columns\TextColumn::make('updated_at')
                        ->dateTime()
                        ->sortable()
                        ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
