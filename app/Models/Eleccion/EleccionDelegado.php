<?php

namespace App\Models\Eleccion;

use App\Models\Eleccion\EleccionDelegadoAgencia;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelanio','eledeltitulo','eledelperiodo','eledelhorainicio',
            'eledelhoracierre','eledelabrireleccion','eledelcerrareleccion','eledelpublicareleccion'])]
class EleccionDelegado extends Model
{
    protected $table      = 'elecciondelegado';
	protected $primaryKey = 'eledelid';

    //Para realizar la relacion
    public function delegadoAgencia(){ 
        return $this->hasMany(EleccionDelegadoAgencia::class, 'eledelid', 'eledelid');    
    }
}