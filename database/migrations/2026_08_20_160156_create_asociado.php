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
        Schema::create('asociadotemporal', function (Blueprint $table) {
            $table->increments('asotemid')->comment('Identificador de la tabla asociado temporal');
            $table->string('asotemagencia', 20)->nullable()->comment('Agencia en la cual pertenece el asociado');
            $table->string('asotemtipodocumento', 30)->nullable()->comment('Tipo de documento del asociado');
            $table->string('asotemnumero', 20)->nullable()->comment('Número de documento del asociado');
            $table->string('asotemnombrecompleto', 100)->nullable()->comment('Nombre completo del asociado');
            $table->string('asotemfechaingreso', 20)->nullable()->comment('Fecha de ingreso del asociado a la cooperativa');
            $table->string('asotemgenero', 20)->nullable()->nullable()->comment('Genero al que pertenece el asociado');
            $table->string('asotemfechanacimiento', 20)->nullable()->nullable()->comment('Fecha de nacimiento del asociado');
            $table->string('asotemtelefono',20)->nullable()->comment('Teléfono del asociado'); 
            $table->string('asotememail',80)->nullable()->comment('Email del asociado'); 
            $table->string('asotemdescripcion',500)->nullable()->comment('Descripción del asociado');
            $table->string('asotemcelular',20)->nullable()->comment('Celular del asociado'); 
            $table->string('asotemfechaexpedicion',20)->nullable()->comment('Fecha expedición del asociado'); 
        });

        Schema::create('asociado', function (Blueprint $table) {
            $table->increments('asocid')->comment('Identificador de la tabla asociado');
            $table->unsignedTinyInteger('tipideid')->comment('Identificador del tipo de identificación'); 
            $table->unsignedTinyInteger('agenid')->comment('Identificador de la agencia'); 
            $table->string('asocnumerodocumento', 20)->unique('uk_asociado')->comment('Número de documento del asociado');
            $table->string('asocnombrecompleto', 100)->comment('Nombre completo del asociado');
            $table->date('asocfechaingreso')->comment('Fecha de ingreso del asociado a la cooperativa');
            $table->string('asocgenero', 1)->comment('Genero al que pertenece el asociado');
            $table->date('asocfechanacimiento')->comment('Fecha de nacimiento del asociado');
            $table->string('asoctelefono',20)->nullable()->comment('Teléfono del asociado');
            $table->string('asocemail',80)->nullable()->comment('Email del asociado'); 
            $table->string('asocdescripcion',500)->nullable()->comment('Descripción del asociado'); 
            $table->string('asoccelular',20)->nullable()->comment('Celular del asociado'); 
            $table->date('asocfechaexpedicion')->comment('Fecha expedición del asociado');
            $table->boolean('asocactivo')->default(true)->comment('Determina si el asociado esta activo');
            $table->timestamps();
            $table->foreign('tipideid', 'fk_tipideasoc')->references('tipideid')->on('tipoidentificacion')->onUpdate('cascade');
            $table->foreign('agenid', 'fk_asocagen')->references('agenid')->on('agencia')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('asociadotemporal');
        Schema::dropIfExists('asociado');
    }
};
