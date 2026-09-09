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
        Schema::create('elecciondelegadoboletin', function (Blueprint $table) {
            $table->increments('eldeboid')->comment('Identificador de la tabla eleccion delegado boletín');
            $table->unsignedSmallInteger('eledelid')->comment('Identificador de la elección de delegado');
            $table->unsignedSmallInteger('usuaid')->comment('Identificador del usuario que genera el boletín');
            $table->datetime('eldebofechahora')->comment('Fecha y hora en la cual se registra el boletín');
            $table->tinyInteger('eldebonumeroboletin')->comment('Número de boletín realizado');
            $table->unsignedInteger('eldebototalvotos')->comment('Número total de votos realizados hasta la fecha y hora del votación');
            $table->string('eldeborutaarchivo', 80)->comment('Ruta del archivo en el cual se encuentra el boletín generado');
            $table->timestamps();
            $table->foreign('eledelid', 'fk_eldeboeledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade'); 
            $table->foreign('usuaid', 'fk_usuaeldebon')->references('usuaid')->on('usuario')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elecciondelegadoboletin');
    }
};
