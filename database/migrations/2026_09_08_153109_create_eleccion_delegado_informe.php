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
        Schema::create('elecciondelegadoinforme', function (Blueprint $table) {
            $table->increments('eldeinid')->comment('Identificador de la tabla eleccion delegado informe');
            $table->unsignedSmallInteger('eledelid')->comment('Identificador de la elección de delegado');
            $table->unsignedSmallInteger('usuaid')->comment('Identificador del usuario que genera el informe');
            $table->datetime('eldeinfechahora')->comment('Fecha y hora en la cual se registra el delegado');
            $table->tinyInteger('eldeinnumeroinforme')->comment('Número de informe realizado');
            $table->unsignedInteger('eldeintotalvotos')->comment('Número total de votos realizados hasta la fecha y hora del informe');
            $table->string('eldeinrutaarchivo', 80)->comment('Ruta del archivo en el cual se encuentra el informe generado');
            $table->timestamps();
            $table->foreign('eledelid', 'fk_eldeineledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade'); 
            $table->foreign('usuaid', 'fk_usuaeldeinn')->references('usuaid')->on('usuario')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elecciondelegadoinforme');
    }
};
