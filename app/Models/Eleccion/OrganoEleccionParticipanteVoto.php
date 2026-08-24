<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['orelpaid','orelpvfecha'])]
class OrganoEleccionParticipanteVoto extends Model
{
    protected $table      = 'organoeleccionparticipantevoto';
	protected $primaryKey = 'orelpvid';
}