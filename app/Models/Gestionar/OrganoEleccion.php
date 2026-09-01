<?php

namespace App\Models\Gestionar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use App\Models\Gestionar\OrganoEleccionTipoOrgano;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['orgeleanio','orgeletitulo','orgelelugar','orgeleperiodo', 'orgeleactivo'])]
class OrganoEleccion extends Model
{
    protected $table      = 'organoeleccion';
	protected $primaryKey = 'orgeleid';

    public function tipoOrganos(){
        return $this->hasMany(OrganoEleccionTipoOrgano::class, 'orgeleid', 'orgeleid');
    }

    protected static function booted()
    {
        static::deleting(function ($tipoOrgano) {
            $tipoOrgano->tipoOrganos()->delete();
        });
    }
}