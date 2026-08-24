<?php

namespace App\Models\Configurar\Menu;

use App\Models\Configurar\Menu\RolFuncionalidad;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['rolnombre','rolactivo'])]
class Rol extends Model
{
    protected $table      = 'rol';
    protected $primaryKey = 'rolid';

    //Para realizar la relacion entre rol funcionalidad
    public function funcionalidades(){
        return $this->hasMany(RolFuncionalidad::class, 'rolfunrolid', 'rolid');
    } 
}