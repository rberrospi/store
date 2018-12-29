<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('slug');
            $table->unsignedInteger('category_id');
            $table->float('price',8,2)->default(0);
            $table->float('discount',8,2)->default(0);
            $table->text('summary');
            $table->text('body');
            $table->unsignedInteger('stock')->default(0);
            $table->boolean('condition')->default(0);
            $table->boolean('address')->default(0);
            $table->boolean('province')->default(0);
            $table->boolean('free')->default(0);
            $table->boolean('over18')->default(0);
            $table->text('returns');
            $table->text('warranty');
            $table->boolean('status')->default(0);
            $table->boolean('approved')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
