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
        Schema::create('informacionnotificacioncorreo', function (Blueprint $table) {
            $table->tinyIncrements('innocoid')->comment('Identificador de la tabla informacion notificación correo');
            $table->string('innoconombre', 50)->unique('uk_infornotificacioncorreo')->comment('Nombre con el cual se consulta desde el sistema'); 
            $table->string('innocoasunto', 120)->comment('Asunto de la información que lleva notificación del correo'); 
            $table->longText('innococontenido')->comment('Contenido de la información que lleva notificación del correo');
            $table->boolean('innocoenviarpiepagina')->default(true)->comment('Determina si se va incluir el contenido de pie de pagina'); 
            $table->boolean('innocoenviarcopia')->default(true)->comment('Determina se se desea enviar copia al administrador'); 
            $table->timestamps();
        });

        Schema::create('informacionconfiguracioncorreo', function (Blueprint $table) {
            $table->tinyIncrements('incocoid')->comment('Identificador de la tabla información configuración del correo');
            $table->string('incocohost', 50)->comment('Host para el cual se permite enviar el correo');
            $table->string('incocousuario', 80)->comment('Usuario o correo con el cual se va autenticar para enviar los correos en el sistema'); 
            $table->string('incococlave', 20)->comment('Clave del correo para acceder a la plataforma');
            $table->string('incococlaveapi', 20)->comment('Clave de la api para autenticar y poder enviar el corro');
            $table->string('incocopuerto', 4)->comment('Puerto por el cual se envia el correo');
            $table->timestamps();
        });

        Schema::create('acta', function (Blueprint $table) {
            $table->tinyIncrements('actaid')->comment('Identificador de la tabla acta');
            $table->string('actatitulo', 200)->comment('Título del acta');
            $table->string('actacontenido', 4000)->comment('Contendido del acta');
            $table->timestamps();
        });

        Schema::create('token', function (Blueprint $table) {
            $table->smallIncrements('tokeid')->comment('Identificador de la tabla token');
            $table->string('toketoken', 20)->unique('uk_token')->comment('Token único genererado para controlar la elección'); 

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('informacionnotificacioncorreo');
        Schema::dropIfExists('informacionconfiguracioncorreo');
        Schema::dropIfExists('acta');
        Schema::dropIfExists('token');
    }
};