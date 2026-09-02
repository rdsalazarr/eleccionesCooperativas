<?php

namespace App\Models\Eleccion\Organos;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgid','orgeleid','deleid','orelpaordenparticipacion','orelpaesvotoblanco'])]
class Participante extends Model
{
    protected $table      = 'organoeleccionparticipante';
	protected $primaryKey = 'orelpaid';
}