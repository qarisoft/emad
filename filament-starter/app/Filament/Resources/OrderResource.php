<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('customer_id')
                    ->relationship('customer','name')
                    ->createOptionForm(Customer::getForm())
                    ->editOptionForm(Customer::getForm())->required()
                ,
                Forms\Components\Repeater::make('items')
                    ->relationship('items')
                    ->schema(
                        [
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
//                                ->disabled()
                                ->numeric()

//                                ->default(0)
                            ,
//                            Select::make('order_id')
//                                ->hidden(function () use($orderId){
//                                    return $orderId != null;
//                                })
//                                ->relationship('order', 'id')
//                            ,
                        ]
                    )
                    ->cloneable()
//                Forms\Components\TextInput::make('order_price')
//                    ->required()
//                    ->numeric(),
//                Forms\Components\TextInput::make('total_price')
//                    ->required()
//                    ->numeric(),
//                Forms\Components\TextInput::make('items_total_count')
//                    ->required()
//                    ->numeric(),
//                Forms\Components\Toggle::make('is_delivered')
//                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('customer.name')
                    ->sortable(),
                Tables\Columns\TextColumn::make('order_price')
                    ->numeric()
                    ->sortable(),
//                Tables\Columns\TextColumn::make('items'),
                Tables\Columns\TextColumn::make('items')
//                    ->numeric()
                    ->sortable()
                ->formatStateUsing(function ($state, Model $record){
                    $q = 0;
                    foreach ($record->items as $item){
                        $q+=$item->quantity;
                    }
                    return $q;
//                    return json_encode($record->items);
//                    return count($record->items->toArray());
                })
//                    ->label('ddd')
                ,
                Tables\Columns\IconColumn::make('is_delivered')
                    ->boolean(),
                Tables\Columns\IconColumn::make('is_posted')
                    ->boolean(),
//                Tables\Columns\ToggleColumn::make('is_posted'),
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
            ->actions([
                Tables\Actions\Action::make('post')->action(function (Model $recorde){
                    $recorde->post();
                })->requiresConfirmation()->icon('heroicon-o-arrow-up-tray'),
                Tables\Actions\Action::make('deliver')->action(function (Model $recorde){
                    $recorde->deliver();
                })->requiresConfirmation()->icon('heroicon-o-arrow-up-circle')
//                Tables\Actions\ViewAction::make(),
//                Tables\Actions\EditAction::make(),
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
//            RelationManagers\ItemsRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'view' => Pages\ViewOrder::route('/{record}'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }
}
