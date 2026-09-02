<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','eldeasid'])]
class Voto extends Model
{
    protected $table      = 'elecciondelegadovoto';
	protected $primaryKey = 'eldevoid';
}