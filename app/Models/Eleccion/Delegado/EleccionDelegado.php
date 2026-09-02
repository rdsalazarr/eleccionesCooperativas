<?php

namespace App\Models\Eleccion\Delegado;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use App\Models\Eleccion\Delegado\Agencia;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['eledelanio','eledeltitulo','eledelperiodo','eledelhorainicio',
            'eledelhoracierre','eledelabrireleccion','eledelcerrareleccion','eledelpublicareleccion'])]
class EleccionDelegado extends Model
{
    protected $table      = 'elecciondelegado';
	protected $primaryKey = 'eledelid';

    //Para realizar la relacion
    public function delegadoAgencia(){ 
        return $this->hasMany(Agencia::class, 'eledelid', 'eledelid');    
    }

    protected static function booted()
    {
        static::deleting(function ($delegado) {
            $delegado->delegadoAgencia()->delete();
        });
    }

}