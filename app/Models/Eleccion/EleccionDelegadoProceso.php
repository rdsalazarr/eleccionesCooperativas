<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelid','asocid','eldeprfecha','eldeprhora'])]
class EleccionDelegadoProceso extends Model
{
    protected $table      = 'elecciondelegadoproceso';
	protected $primaryKey = 'eldeprid';
}