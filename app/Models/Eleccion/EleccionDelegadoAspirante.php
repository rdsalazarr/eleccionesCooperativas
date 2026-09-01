<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','tipideid','agenid','eldeasdocumento', 'eldeasnumero','eldeasfechahora','eldeasprimernombre','eldeassegundonombre',
            'eldeasprimerapellido','eldeassegundoapellido', 'eldeascorreo','eldeastelefono','eldeasimagen','eldeasactivo','eldeasesvotoblanco'])]
class EleccionDelegadoAspirante extends Model
{
    protected $table      = 'elecciondelegadoaspirante';
	protected $primaryKey = 'eldeasid';
}