<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgid','orgeleid','orelprtoken'])]
class OrganoEleccionParticipanteProceso extends Model
{
    protected $table      = 'organoeleccionparticipanteproceso';
	protected $primaryKey = 'orelprid';
}