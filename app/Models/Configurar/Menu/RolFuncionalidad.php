<?php

namespace App\Models\Configurar\Menu;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['rolfunrolid','rolfunfuncid'])]
class RolFuncionalidad extends Model
{    
    public $timestamps    = false;
    protected $table      = 'rolfuncionalidad';   
    protected $primaryKey = 'rolfunid';
}