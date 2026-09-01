<?php

namespace App\Models\Gestionar\Usuario;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['usuaid','ingsisipacceso','ingsisfechahoraingreso','ingsisfechahorasalida'])]
class IngresoSistema extends Model
{
    protected $table      = 'ingresosistema';
	protected $primaryKey = 'ingsisid';
}