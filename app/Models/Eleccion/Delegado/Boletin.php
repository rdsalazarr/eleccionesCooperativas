<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use DB;

#[Fillable(['eledelid','usuaid','eldebofechahora','eldebonumeroboletin','eldebototalvotos','eldeborutaarchivo'])]
class Boletin extends Model
{
    protected $table      = 'elecciondelegadoboletin';
	protected $primaryKey = 'eldeboid';

    public static function obtenerConsecutivo(int $eleccionId): int
    {
        $ultimoNumero = DB::table('elecciondelegadoboletin')
                        ->where('eledelid', $eleccionId)
                        ->max('eldebonumeroboletin');

        return ((int) $ultimoNumero) + 1;
    }
}