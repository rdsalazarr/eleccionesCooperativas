<?php

namespace App\Models\Gestionar\Usuario;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['usuaid','hisconpassword'])]
class HistorialContrasena extends Model
{
    protected $table      = 'historialcontrasena';
	protected $primaryKey = 'hisconid';
}