<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgid','orgeleid','deleid','orelpaordenparticipacion','orelpaesvotoblanco'])]
class OrganoEleccionParticipante extends Model
{
    protected $table      = 'organoeleccionparticipante';
	protected $primaryKey = 'orelpaid';
}