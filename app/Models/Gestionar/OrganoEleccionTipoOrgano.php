<?php

namespace App\Models\Gestionar;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgid','orgeleid','oreltofechahorainicio', 'oreltofechahoracierre'])]
class OrganoEleccionTipoOrgano extends Model
{
    protected $table      = 'organoelecciontipoorgano';
	protected $primaryKey = 'oreltoid';
}