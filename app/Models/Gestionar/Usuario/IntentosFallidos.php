<?php

namespace App\Models\Gestionar\Usuario;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['intfalusurio','intfalipacceso','intfalfecha'])]
class IntentosFallidos extends Model
{
    protected $table      = 'intentosfallidos';
	protected $primaryKey = 'intfalid';
}