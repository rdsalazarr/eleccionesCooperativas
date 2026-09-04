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
        Schema::create('organoeleccion', function (Blueprint $table) {
            $table->smallIncrements('orgeleid')->comment('Identificador de la tabla órgano de elección');
            $table->year('orgeleanio')->unique('uk_organoeleccion')->comment('Año en el cual se presenta la órgano de elección');
            $table->string('orgeletitulo',150)->comment('Título de órgano de elección');
            $table->string('orgelelugar',100)->comment('Lugar en el cual se lleva a cabo la órgano de elección');
            $table->string('orgeleperiodo',20)->comment('Perido en el cual esta activa la órgano de elección');
            $table->boolean('orgeleactivo')->default(true)->comment('Determina si el órgano de elección esta activo');
            $table->timestamps();
        });

        Schema::create('organoelecciontipoorgano', function (Blueprint $table) {
            $table->increments('oreltoid')->comment('Identificador de la tabla organo elección tipo órgano');
            $table->unsignedTinyInteger('tiporgid')->comment('Identificador del tipo de órgano de elección');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador del órgano de elección');
            $table->datetime('oreltofechahorainicio')->nullable()->comment('Fecha y hora en la cual se da incio a la elección del tipo de órgano');
            $table->datetime('oreltofechahoracierre')->nullable()->comment('Fecha y hora en la cual se cierra a la elección del tipo de órgano');
            $table->timestamps();

            $table->foreign('tiporgid', 'fk_oreltotiporg')->references('tiporgid')->on('tipoorgano')->onUpdate('cascade');
            $table->foreign('orgeleid', 'fk_oreltoorgele')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade');
        });

        Schema::create('organoeleccionparticipanteproceso', function (Blueprint $table) {
            $table->increments('orelprid')->comment('Identificador de la tabla organo elección participante proceso');
            $table->unsignedTinyInteger('tiporgid')->comment('Identificador del tipo de órgano de elección');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador del órgano de elección');
            $table->string('orelprtoken', 20)->nullable()->comment('Token registrado por el usuario en la elección'); 
            $table->timestamps();

            $table->foreign('tiporgid', 'fk_orelprtiporg')->references('tiporgid')->on('tipoorgano')->onUpdate('cascade');
            $table->foreign('orgeleid', 'fk_orelprorgele')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade');
        });

        Schema::create('organoeleccionparticipante', function (Blueprint $table) {
            $table->increments('orelpaid')->comment('Identificador de la tabla eleccion participante');
            $table->unsignedTinyInteger('tiporgid')->comment('Identificador del tipo de elección');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador de la elección');
            $table->unsignedSmallInteger('deleid')->comment('Identificador del delegado');
            $table->tinyInteger('orelpaordenparticipacion')->comment('Orden de participación del delegado');
            $table->boolean('orelpaesvotoblanco')->default(false)->comment('Determina si es para el voto en blanco');
            $table->timestamps();

            $table->foreign('tiporgid', 'fk_orelpatiporg')->references('tiporgid')->on('tipoorgano')->onUpdate('cascade');
            $table->foreign('orgeleid', 'fk_orelpaelec')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade'); 
            $table->foreign('deleid', 'fk_orelpadele')->references('deleid')->on('delegado')->onUpdate('cascade');
        });

        Schema::create('organoeleccionparticipantevoto', function (Blueprint $table) {
            $table->increments('orelpvid')->comment('Identificador de la tabla eleccion participante voto');
            $table->unsignedInteger('orelpaid')->comment('Identificador de la tabla eleccion participante');
            $table->datetime('orelpvfecha')->comment('Fecha y hora en la cual se registra el voto');
            $table->string('toketoken', 20)->comment('Token utilizado para la elección');
            $table->timestamps();
            $table->foreign('orelpaid', 'fk_orelpvorelpa')->references('orelpaid')->on('organoeleccionparticipante')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('organoeleccionparticipantevoto');
        Schema::dropIfExists('organoeleccionparticipante');
        Schema::dropIfExists('organoeleccionparticipanteproceso');
        Schema::dropIfExists('organoelecciontipoorgano');
        Schema::dropIfExists('organoeleccion');
    }
};
