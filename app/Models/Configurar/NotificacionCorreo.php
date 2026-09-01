<?php

namespace App\Models\Configurar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['innoconombre','innocoasunto','innococontenido','innocoenviarpiepagina', 'innocoenviarcopia'])]
class NotificacionCorreo extends Model
{
    protected $table      = 'informacionnotificacioncorreo';
	protected $primaryKey = 'innocoid';
}