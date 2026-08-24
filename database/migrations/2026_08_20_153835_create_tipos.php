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
        Schema::create('tipoorgano', function (Blueprint $table) {
            $table->tinyIncrements('tiporgid')->comment('Identificador de la tabla tipo de órgano');
            $table->string('tiporgnombre', 50)->comment('Nombre del tipo de órgano');
            $table->tinyInteger('tiporgvotosporpersona')->comment('Número de votos por persona para el tipo de órgano');
            $table->tinyInteger('tiporgtotalprincipales')->comment('Total de persona principales para el tipo de órgano');
            $table->tinyInteger('tiporgtotalsuplente')->comment('Total de persona suplente para el tipo de órgano');
            $table->string('tiporglogo', 100)->nullable()->comment('ruta del logo del tipo de órgano');
            $table->boolean('tiporgactivo')->default(true)->comment('Determina si el tipo de órgano se encuentra activo');
            $table->timestamps();
        });

        Schema::create('tipoidentificacion', function (Blueprint $table) {
            $table->unsignedTinyInteger('tipideid')->comment('Identificador de la tabla tipo de identificación');
            $table->string('tipidesigla', 4)->unique('uk_tipoidentificacion')->comment('Sigla del tipo de identificación');
            $table->string('tipidenombre', 50)->comment('Nombre del tipo de identificación');
            $table->primary('tipideid')->index('pk_tipide');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tipoidentificacion');
        Schema::dropIfExists('tipoeleccion');
    }
};
