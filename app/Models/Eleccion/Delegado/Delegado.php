<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['agenid','deledocumento','deleprimernombre','delesegundonombre','deleprimerapellido','delesegundoapellido',
			'delenumero','delecorreo','deletelefono','deleactivo'])]
class Delegado extends Model
{
   protected $table       = 'delegado';
	protected $primaryKey = 'deleid';
}