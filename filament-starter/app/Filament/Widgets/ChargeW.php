<?php

namespace App\Filament\Widgets;

use App\Models\Charge;
use App\Models\Product;
use Filament\Widgets\ChartWidget;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Number;

class ChargeW extends BaseWidget
{
    protected static ?string $heading = 'Chart';

    public function getCount($data)
    {
        $q=0;
        foreach ($data as $d){
            $q=$q+$d->quantity;
        }
        return $q;

    }

    protected function getStats():array
    {
//        $all = Charge::all();
        $in  = Charge::in();
        $out = Charge::out();
        $data=[];
        foreach (Product::all() as $p){
//            $pc=Charge::where('product_id','=',$p->id)->count();
            $in_p = $this->getCount(Charge::in()->where('product_id','=',$p->id)->get());
            $out_p = $this->getCount(Charge::out()->where('product_id','=',$p->id)->get());

//            $pin=$in->where('product_id','=',$p->id)->count();
//            $pout=$out->where('product_id','=',$p->id)->count();



            $rest=$in_p-$out_p;
            $state = Stat::make($p->name,$in_p.'   :  '.$out_p.'  =  '.$rest)
                ->icon('heroicon-o-book-open')->label(__($p->name))->description($in_p);
            $data[] = $state;
//            $data[]=Stat::make($p->name,Number::format($pc));
        }
        return $data;
//        return [
//            Stat::make('All', Number::format($all))
//                ->label(__('All'))
//                ->description(__('The total number of tasks'))
//                ->icon('heroicon-o-book-open'),
//
//            Stat::make('In', Number::format($in))
//                ->label(__('In'))
////                ->description(__('The total number of published tasks'))
//                ->icon('heroicon-o-check-circle')->color('success'),
//
//            Stat::make(__('Out'), Number::format($out))
////                ->description(__('The total number of draft tasks'))
//                ->icon('heroicon-o-x-circle'),
//
//        ];

    }
//    protected function getData(): array
//    {
//        return [
//            //
//        ];
//    }
//
//    protected function getType(): string
//    {
//        return 'bar';
//    }
}
