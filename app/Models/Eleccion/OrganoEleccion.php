<?php

namespace App\Models\Eleccion;

use App\Models\Eleccion\OrganoEleccionTipoOrgano;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['orgeleanio','orgeletitulo','orgelelugar','orgeleperiodo', 'orgeleactivo'])]
class OrganoEleccion extends Model
{
    protected $table      = 'organoeleccion';
	protected $primaryKey = 'orgeleid';

    public function tipoOrganos(){
        return $this->hasMany(OrganoEleccionTipoOrgano::class, 'orgeleid', 'orgeleid');
    }
}