<?php

namespace App\Models\Eleccion\Organos;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgid','orgeleid','orelprtoken'])]
class ParticipanteProceso extends Model
{
    protected $table      = 'organoeleccionparticipanteproceso';
	protected $primaryKey = 'orelprid';
}