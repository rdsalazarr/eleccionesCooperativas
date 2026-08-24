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
        Schema::create('empresa', function (Blueprint $table) {
            $table->tinyIncrements('emprid')->comment('Identificador de la tabla empresa');
            $table->string('emprnit', 15)->comment('Nit de la empresa');
            $table->string('emprnombre', 100)->comment('Nombre de la empresa');
            $table->string('emprsigla', 20)->nullable()->comment('Sigla de la empresa');
            $table->string('emprlema', 100)->nullable()->comment('Lema de la empresa');
            $table->string('emprdireccion', 80)->comment('Dirección de la empresa');
            $table->string('emprciudad', 80)->comment('Ciudad en donde se encuentra la empresa');
            $table->string('emprcorreo', 80)->nullable()->comment('Correo de la empresa');
            $table->string('emprtelefonofijo', 20)->nullable()->comment('Teléfono fijo de contacto con la empresa');
            $table->string('emprtelefonocelular', 20)->nullable()->comment('Teléfono celular de contacto con la empresa');
            $table->string('emprurl', 100)->nullable()->comment('Url de la páguina web institucional');
            $table->string('emprlogo', 100)->nullable()->comment('Favicon de la empresa en jpg'); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('empresa');
    }
};
