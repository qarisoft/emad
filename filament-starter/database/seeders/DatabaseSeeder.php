<?php

namespace Database\Seeders;

use App\Models\Charge;
use App\Models\Customer;
use App\Models\Post;
use App\Models\Product;
use App\Models\User;
use Filament\Notifications\Notification;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = User::factory()->create([
            'name' => 'admin',
            'email' => 'admin@admin.test',
            'password' => Hash::make('admin'),
        ]);

        Product::factory()->create([
            'name'=>'ابو ميه' ,
            'price'=>100,
        ]);
        Product::factory()->create([
            'name'=>'ابو ميتين' ,
            'price'=>200,
        ]);
        Product::factory()->create([
            'name'=>'ابو خمس ميه' ,
            'price'=>500,
        ]);
        Customer::factory()->create([
           'name'=>'صلاح'
        ]);
        Charge::create([
            'quantity'=>33,
            'product_id'=>Product::find(1)->id,
            'price'=>Product::find(1)->price,
            'type'=>'in','is_posted'=>true,
            'year'=>date('Y')
        ]);
        Charge::create([
            'quantity'=>17,
            'product_id'=>Product::find(2)->id,
            'price'=>Product::find(2)->price,
            'type'=>'in','is_posted'=>true,
            'year'=>date('Y')
        ]);
        Charge::create([
            'quantity'=>14,
            'product_id'=>Product::find(3)->id,
            'price'=>Product::find(3)->price,
            'type'=>'in',
            'is_posted'=>true,
            'year'=>date('Y')
        ]);
        // Post::factory()
        //     ->count(25)
        //     ->create();

        // Notification::make()
        //     ->title('Welcome to Filament')
        //     ->body('You are ready to start building your application.')
        //     ->success()
        //     ->sendToDatabase($user);
    }
}
