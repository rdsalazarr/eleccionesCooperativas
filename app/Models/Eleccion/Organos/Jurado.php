<?php

namespace App\Models\Eleccion\Organos;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['orgeleid','deleid','oreljuesjurado'])]
class Jurado extends Model
{
    protected $table      = 'organoeleccionjurado';
	protected $primaryKey = 'oreljuid';
}