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
        Schema::create('agencia', function (Blueprint $table) {
            $table->unsignedTinyInteger('agenid')->comment('Identificador de la tabla agencia');
            $table->string('agennombre', 50)->comment('Nombre de la agencia');
            $table->primary('agenid')->index('pk_agen');
        });

        Schema::create('usuario', function (Blueprint $table) {
            $table->smallIncrements('usuaid')->comment('Identificador de la tabla usuario');
            $table->unsignedTinyInteger('agenid')->comment('Identificador de la agencia a la cual pertenece el usuario'); 
            $table->string('usuadocumento', 15)->comment('Documento del usuario');
            $table->string('usuanombre', 50)->comment('Nombre del usuario');
            $table->string('usuaapellidos', 50)->comment('Apellidos del usuario');
            $table->string('usuaemail', 80)->unique('uk_usuario')->comment('Correo del usuario');
            $table->string('usuanick', 20)->unique('uk_usuario1')->comment('Nick del usuario');
            $table->string('password')->comment('Password del usuario');
            $table->boolean('usuacambiarpassword')->default(true)->comment('Determina si el usuario debe cambar la contraseña para poder iniciar sesión');
            $table->boolean('usuabloqueado')->default(false)->comment('Determina si el usuario esta bloqueado');
            $table->boolean('usuaactivo')->default(true)->comment('Determina si el usuario esta activo');
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('agenid', 'fk_useragen')->references('agenid')->on('agencia')->onUpdate('cascade');
        });

        Schema::create('ingresosistema', function (Blueprint $table) {
            $table->bigIncrements('ingsisid')->comment('Identificador de la tabla ingreso sistema');
            $table->unsignedSmallInteger('usuaid')->comment('Identificador del usuario');
            $table->string('ingsisipacceso', 40)->comment('Ip de la cual accede el usuario al sistema');
            $table->dateTime('ingsisfechahoraingreso')->comment('Fecha y hora de ingreso al sistema'); 
            $table->dateTime('ingsisfechahorasalida')->nullable()->comment('Fecha y hora de salida del sistema');
            $table->timestamps();
            $table->foreign('usuaid','fk_usuaingsis')->references('usuaid')->on('usuario')->onUpdate('cascade');
        });

        Schema::create('intentosfallidos', function (Blueprint $table) {
            $table->bigIncrements('intfalid')->comment('Identificador de la tabla intentos fallidos'); 
            $table->string('intfalusurio', 20)->comment('Usuario que accede al sistema');
            $table->string('intfalipacceso', 40)->comment('Ip de la cual accede el usuario al sistema');
            $table->dateTime('intfalfecha')->comment('Fecha y hora de registro del intento fallido'); 
            $table->timestamps();
        });

        Schema::create('historialcontrasena', function (Blueprint $table) {
            $table->bigIncrements('hisconid')->comment('Identificador de la tabla historial de contrasena');
            $table->unsignedSmallInteger('usuaid')->comment('Identificador del usuario');
            $table->string('hisconpassword')->comment('Password del usuario utilizado');
            $table->timestamps();
            $table->foreign('usuaid', 'fk_usuahiscon')->references('usuaid')->on('usuario')->onUpdate('cascade');
        });

        Schema::create('usuariorol', function (Blueprint $table) {
            $table->increments('usurolid')->index('pk_usurol')->comment('Identificador de la tabla usuario rol');
            $table->unsignedSmallInteger('usurolusuaid')->comment('Identificador del usuario');
            $table->unsignedSmallInteger('usurolrolid')->comment('Identificador del rol');

            $table->foreign('usurolusuaid', 'fk_usuausurol')->references('usuaid')->on('usuario')->onUpdate('cascade');
            $table->foreign('usurolrolid', 'fk_rolusurol')->references('rolid')->on('rol')->onUpdate('cascade');
        });

        Schema::create('sessions', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->foreignId('user_id')->nullable()->index();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->longText('payload');
            $table->integer('last_activity')->index();
        });

        Schema::create('cache', function (Blueprint $table) {
            $table->string('key')->primary();
            $table->mediumText('value');
            $table->integer('expiration');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historialcontrasena');
        Schema::dropIfExists('intentosfallidos');
        Schema::dropIfExists('ingresosistema');
        Schema::dropIfExists('usuariorol');
        Schema::dropIfExists('agencia');
        Schema::dropIfExists('usuario');
        Schema::dropIfExists('sessions');
        Schema::dropIfExists('cache');
    }
};
