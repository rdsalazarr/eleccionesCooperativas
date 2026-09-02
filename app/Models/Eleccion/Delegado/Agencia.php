<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','agenid','eldeaglugar', 'eldeagnumerodeleprincipal','eldeagnumerodelesuplente'])]
class Agencia extends Model
{
    protected $table      = 'elecciondelegadoagencia';
	protected $primaryKey = 'eldeagid';
}