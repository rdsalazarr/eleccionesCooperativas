<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['deledocumento','delenombre','deleapellido','delenumero','delecorreo',
			'deletelefono','delenotificacion','deleactivo'])]
class Delegado extends Model
{
   protected $table       = 'delegado';
	protected $primaryKey = 'deleid';
}