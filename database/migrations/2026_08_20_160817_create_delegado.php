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
        Schema::create('elecciondelegado', function (Blueprint $table) {
            $table->smallIncrements('eledelid')->comment('Identificador de la tabla elección de delegado');
            $table->year('eledelanio')->unique('uk_elecciondelegado')->comment('Año en el cual se presenta la elección de delegado');
            $table->string('eledeltitulo',150)->comment('Título general de la elección de delegado');
            $table->string('eledelperiodo',20)->comment('Periodo en el cual va estar cumplir la elección de delegado');  
            $table->string('eledelhorainicio',10)->comment('Hora de inicio de la elección de delegado');
            $table->string('eledelhoracierre',10)->comment('Hora de cierre de la elección de delegado');
            $table->boolean('eledelabrireleccion')->default(false)->comment('Determina si la elección se debe abrir');
            $table->boolean('eledelcerrareleccion')->default(false)->comment('Determina si la elección se debe cerrar');
            $table->boolean('eledelpublicareleccion')->default(false)->comment('Determina si la elección de delegado esta publicada');
            $table->timestamps();
        });

        Schema::create('elecciondelegadoagencia', function (Blueprint $table) {
            $table->increments('eldeagid')->comment('Identificador de la tabla eleccion delegado agencia');
            $table->unsignedSmallInteger('eledelid')->comment('Identificador de la elección de delegado');
            $table->unsignedTinyInteger('agenid')->comment('Identificador de la agencia');
            $table->string('eldeaglugar',100)->comment('Lugar en el cual se lleva a cabo la elección de delegado');
            $table->string('eldeagnumerodeleprincipal',3)->comment('Número de delegado principales en la agencia');
            $table->string('eldeagnumerodelesuplente',3)->comment('Número de delegado suplente en la agencia');

            $table->timestamps(); 
            $table->unique(['eledelid', 'agenid'],'uk_elecciondelegadoagencia');
            $table->foreign('eledelid', 'fk_eldeageledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade'); 
            $table->foreign('agenid', 'fk_eldeagagen')->references('agenid')->on('agencia')->onUpdate('cascade');
        });

        Schema::create('elecciondelegadoagenciajurado', function (Blueprint $table) {
            $table->increments('eldeajid')->comment('Identificador de la tabla eleccion delegado agencia jurado');  
            $table->unsignedInteger('eldeagid')->comment('Identificador de la tabla eleccion agencia');
            $table->string('eldeajdocumento',50)->comment('Documento del jurado');
            $table->string('eldeajnombre',100)->comment('Nombre del jurado');
            $table->string('eldeajcargo',50)->nullable()->comment('Cargo del jurado');

            $table->timestamps();
            $table->unique(['eldeagid', 'eldeajdocumento'], 'uk_elecciondelegadoagenciajurado');
            $table->foreign('eldeagid', 'fk_eldeajeldeag')->references('eldeagid')->on('elecciondelegadoagencia')->onUpdate('cascade');
        });

        Schema::create('elecciondelegadoaspirante', function (Blueprint $table) {
            $table->smallIncrements('eldeasid')->comment('Identificador de la tabla inscripcion delegado');
            $table->smallInteger('eledelid')->unsigned()->comment('Identificador de la elección de delegado');
            $table->tinyInteger('tipideid')->unsigned()->comment('Identificador del tipo de identificación de aspirante');
            $table->tinyInteger('agenid')->unsigned()->comment('Identificador de la agencia'); 
            $table->string('eldeasdocumento', 15)->comment('Documento de inscripción delegado');
            $table->tinyInteger('eldeasnumero')->comment('Número en el orden el cual fue inscrito como delegado'); 
            $table->datetime('eldeasfechahora')->comment('Fecha y hora en la cual se registra el delegado');
            $table->string('eldeasprimernombre', 50)->comment('Primer nombre del delegado que se inscribe');
            $table->string('eldeassegundonombre', 50)->nullable()->comment('Segundo nombre del delegado que se inscribe');
            $table->string('eldeasprimerapellido', 50)->comment('Primer apellido del delegado que se inscribe');
            $table->string('eldeassegundoapellido', 50)->nullable()->comment('Segundo apellido del delegado que se inscribe');
            $table->string('eldeascorreo', 80)->nullable()->comment('Correo del delegado que se inscribe');
            $table->string('eldeastelefono', 20)->nullable()->comment('Teléfono del delegado que se inscribe');
            $table->string('eldeasimagen', 100)->nullable()->comment('Ruta de la imagen del delegado que se inscribe');
            $table->boolean('eldeasactivo')->default(true)->comment('Determina si el delegado inscrito esta activo');
            $table->boolean('eldeasesvotoblanco')->default(false)->comment('Determina si el delegado es voto en blanco');
            $table->timestamps();
            $table->unique(['eledelid', 'agenid','eldeasnumero'],'uk_inscripciondelegado');
            $table->foreign('eledelid', 'fk_eldeaseledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade'); 
            $table->foreign('tipideid', 'fk_eldeastipide')->references('tipideid')->on('tipoidentificacion')->onUpdate('cascade');
            $table->foreign('agenid', 'fk_eldeasagen')->references('agenid')->on('agencia')->onUpdate('cascade');
        });

        Schema::create('elecciondelegadoproceso', function (Blueprint $table) {
            $table->increments('eldeprid')->comment('Identificador de la tabla inscripcion delegado proceso');
            $table->smallInteger('eledelid')->unsigned()->comment('Identificador de la elección de delegado');
            $table->integer('asocid')->unsigned()->comment('Identificador de la tabla asociado');
            $table->date('eldeprfecha')->comment('Fecha en la cual se registra el voto por el asociado');
            $table->time('eldeprhora')->comment('Hora en la cual se registra el voto por el asociado');
            $table->timestamps();
            $table->unique(['eledelid', 'asocid','eldeprfecha'],'uk_elecciondelegadoproceso');
            $table->foreign('eledelid', 'fk_eldepreledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade');
            $table->foreign('asocid', 'fk_eldeprasoc')->references('asocid')->on('asociado')->onUpdate('cascade'); 
        });

        Schema::create('elecciondelegadovoto', function (Blueprint $table) {
            $table->increments('eldevoid')->comment('Identificador de la tabla inscripción delegado voto');
            $table->smallInteger('eledelid')->unsigned()->comment('Identificador de la elección de delegado');
            $table->smallInteger('eldeasid')->unsigned()->comment('Identificador del aspirante a delegado');
            $table->timestamps();
            $table->foreign('eledelid', 'fk_eldevoeledel')->references('eledelid')->on('elecciondelegado')->onUpdate('cascade');
            $table->foreign('eldeasid', 'fk_eldevoeldeas')->references('eldeasid')->on('elecciondelegadoaspirante')->onUpdate('cascade');
        });

        Schema::create('delegado', function (Blueprint $table) {
            $table->smallIncrements('deleid')->comment('Identificador de la tabla delegado');
            $table->string('deledocumento', 15)->unique('uk_delegado')->comment('Documento del delegado');
            $table->string('deleprimernombre', 50)->comment('Primer nombre del delegado');
            $table->string('delesegundonombre', 50)->nullable()->comment('Segundo nombre del delegado');
            $table->string('deleprimerapellido', 50)->comment('Primer apellido del delegado');
            $table->string('delesegundoapellido', 50)->nullable()->comment('Segundo apellido del delegado');
            $table->tinyInteger('delenumero')->comment('Número en el orden el cual fue asignado como delegado');
            $table->string('delecorreo', 80)->nullable()->comment('Correo del delegado');
            $table->string('deletelefono', 20)->nullable()->comment('Teléfono del delegado');
            $table->boolean('deleactivo')->default(true)->comment('Determina si el delegado esta activo');
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elecciondelegadovoto');
        Schema::dropIfExists('elecciondelegadoproceso');
        Schema::dropIfExists('elecciondelegadoaspirante');
        Schema::dropIfExists('elecciondelegadoagenciajurado');
        Schema::dropIfExists('elecciondelegadoagencia');
        Schema::dropIfExists('elecciondelegado');
        Schema::dropIfExists('delegado');
    }
};