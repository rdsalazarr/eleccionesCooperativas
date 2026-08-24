<?php

namespace App\Models\Configurar;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['incocohost','incocousuario','incococlave','incococlaveapi', 'incocopuerto'])]
class ConfiguracionCorreo extends Model
{
    protected $table      = 'informacionconfiguracioncorreo';
	protected $primaryKey = 'incocoid';
}