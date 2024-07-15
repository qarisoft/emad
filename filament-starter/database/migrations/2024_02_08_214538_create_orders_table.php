<?php

use App\Models\Customer;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();

            $table->foreignIdFor(Customer::class)->nullable();
            $table->double('order_price')->default(0);
            $table->double('total_price')->default(0);
            $table->integer('items_total_count')->default(0);
            $table->boolean('is_posted')->default(false);
            $table->boolean('is_delivered')->default(false);
            $table->timestamps();
        });


//        Schema::create('order_product', function (Blueprint $table) {
//            $table->id();
////
////            $table->foreignIdFor(Product::class);
////            $table->integer('quantity')->default(1);
////            $table->double('order_item_price')->default(0);
////            $table->foreignIdFor(Order::class)->nullable();
//            $table->timestamps();
//        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
