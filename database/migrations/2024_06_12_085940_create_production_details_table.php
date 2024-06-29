<?php

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
        Schema::create('production_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id');
            $table->string('status')->default('Pending');
            $table->string('note')->nullable();
            $table->date('start_production')->nullable();
            $table->date('end_production')->nullable();
            $table->double('printing_progress')->default(0);
            $table->double('sewing_progress')->default(0);
            $table->double('downtime')->default(0);
            $table->foreignId('printer_id')->default(0);
            $table->int('priority')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_details');
    }
};
