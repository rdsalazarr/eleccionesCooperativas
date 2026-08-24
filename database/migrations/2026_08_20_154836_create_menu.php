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
        Schema::create('modulo', function (Blueprint $table) {
            $table->smallIncrements('moduid')->comment('Identificador de la tabla módulo');
            $table->string('modunombre', 30)->comment('Nombre del módulo');
            $table->string('moduicono', 30)->nullable()->comment('Clase de css para montar en el link del módulo');
            $table->smallInteger('moduorden')->comment('Orden del en el árbol del menú que se muestra el módulo');
            $table->boolean('moduactivo')->default(true)->comment('Determina si el módulo encuentra activo');
            $table->timestamps();
        });

        Schema::create('funcionalidad', function (Blueprint $table) {
            $table->smallIncrements('funcid')->comment('Identificador de la tabla funcionalidad');
            $table->unsignedSmallInteger('moduid')->comment('Identificador del módulo');
            $table->string('funcnombre', 80)->comment('Nombre de la funcionalidad');
            $table->string('functitulo', 80)->nullable()->comment('Título de la funcionalidad');
            $table->string('funcruta', 60)->nullable()->comment('Ruta de la funcionalidad');
            $table->string('funcicono', 30)->nullable()->comment('Clase de css para montar en el link del menú');
            $table->smallInteger('funcorden')->comment('Orden del en el árbol del menú');
            $table->boolean('funcactiva')->default(true)->comment('Determina si la funcionalidad encuentra activa'); 
            $table->timestamps();
            $table->foreign('moduid')->references('moduid')->on('modulo')->onUpdate('cascade')->index('fk_modufunc');
        });

        Schema::create('rol', function (Blueprint $table) {
            $table->smallIncrements('rolid')->comment('Identificador de la tabla rol');
            $table->string('rolnombre', 80)->comment('Nombre del rol');
            $table->boolean('rolactivo')->default(true)->comment('Determina si el rol encuentra activo'); 
            $table->timestamps();
        });

        Schema::create('rolfuncionalidad', function (Blueprint $table) {
            $table->mediumIncrements('rolfunid')->comment('Identificador de la tabla rol funcionalidad');
            $table->unsignedSmallInteger('rolfunrolid')->comment('Identificador del rol');
            $table->unsignedSmallInteger('rolfunfuncid')->comment('Identificador de la funcionalidad');

            $table->foreign('rolfunrolid')->references('rolid')->on('rol')->onUpdate('cascade')->index('fk_rolfunrol');
            $table->foreign('rolfunfuncid')->references('funcid')->on('funcionalidad')->onUpdate('cascade')->index('fk_rolfunfunc');  
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rolfuncionalidad');
        Schema::dropIfExists('usuariorol');
        Schema::dropIfExists('funcionalidad');
        Schema::dropIfExists('rol');
    }
};
