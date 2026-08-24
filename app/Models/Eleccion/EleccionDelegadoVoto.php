<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','eldeasid'])]
class EleccionDelegadoVoto extends Model
{
    protected $table      = 'elecciondelegadovoto';
	protected $primaryKey = 'eldevoid';
}