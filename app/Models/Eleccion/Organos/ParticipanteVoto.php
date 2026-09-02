<?php

namespace App\Models\Eleccion\Organos;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['orelpaid','orelpvfecha'])]
class ParticipanteVoto extends Model
{
    protected $table      = 'organoeleccionparticipantevoto';
	protected $primaryKey = 'orelpvid';
}