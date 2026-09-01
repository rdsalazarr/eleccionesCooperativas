<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','agenid','eldeaglugar', 'eldeagnumerodeleprincipal','eldeagnumerodelesuplente'])]
class EleccionDelegadoAgencia extends Model
{
    protected $table      = 'elecciondelegadoagencia';
	protected $primaryKey = 'eldeagid';
}