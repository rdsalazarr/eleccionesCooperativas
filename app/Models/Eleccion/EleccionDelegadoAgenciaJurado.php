<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['eldeagid','eldeajdocumento','eldeajnombre','eldeajcargo'])]
class EleccionDelegadoAgenciaJurado extends Model
{
    protected $table      = 'elecciondelegadoagenciajurado';
	protected $primaryKey = 'eldeajid';
}