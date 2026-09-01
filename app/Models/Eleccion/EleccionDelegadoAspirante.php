<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use DB ;

#[Fillable(['eledelid','tipideid','agenid','eldeasdocumento', 'eldeasnumero','eldeasfechahora','eldeasprimernombre','eldeassegundonombre',
            'eldeasprimerapellido','eldeassegundoapellido', 'eldeascorreo','eldeastelefono','eldeasimagen','eldeasactivo','eldeasesvotoblanco'])]
class EleccionDelegadoAspirante extends Model
{
    protected $table      = 'elecciondelegadoaspirante';
	protected $primaryKey = 'eldeasid';

    public function obtenerConsecutivo(int $eleccionId, int $agenciaId): int
    {
        $ultimoNumero = DB::table('elecciondelegadoaspirante')
                        ->where('eledelid', $eleccionId)
                        ->where('agenid', $agenciaId)
                        ->max('eldeasnumero');

        return ((int) $ultimoNumero) + 1;
    }
}