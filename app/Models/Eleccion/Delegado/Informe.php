<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use DB;

#[Fillable(['eledelid','usuaid','eldeinfechahora','eldeinnumeroinforme','eldeintotalvotos','eldeinrutaarchivo'])]
class Informe extends Model
{
    protected $table      = 'elecciondelegadoinforme';
	protected $primaryKey = 'eldeinid';

    public static function obtenerConsecutivo(int $eleccionId): int
    {
        $ultimoNumero = DB::table('elecciondelegadoinforme')
                        ->where('eledelid', $eleccionId)
                        ->max('eldeinnumeroinforme');

        return ((int) $ultimoNumero) + 1;
    }
}