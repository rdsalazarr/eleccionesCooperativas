<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eldeagid','eldeajdocumento','eldeajnombre','eldeajcargo'])]
class AgenciaJurado extends Model
{
    protected $table      = 'elecciondelegadoagenciajurado';
	protected $primaryKey = 'eldeajid';
}