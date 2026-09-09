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
        Schema::create('organoeleccionjurado', function (Blueprint $table) {
            $table->increments('oreljuid')->comment('Identificador de la tabla organo eleccion jurado');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador de la elección');
            $table->unsignedSmallInteger('deleid')->comment('Identificador del delegado');
            $table->boolean('oreljuesjurado')->default(true)->comment('Determina si es un jurado o un testigo');
            $table->timestamps();
        
            $table->foreign('orgeleid', 'fk_oreljuelec')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade'); 
            $table->foreign('deleid', 'fk_oreljudele')->references('deleid')->on('delegado')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('organoeleccionjurado');
    }
};
