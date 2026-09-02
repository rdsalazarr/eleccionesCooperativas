<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','asocid','eldeprfecha','eldeprhora'])]
class Proceso extends Model
{
    protected $table      = 'elecciondelegadoproceso';
	protected $primaryKey = 'eldeprid';
}