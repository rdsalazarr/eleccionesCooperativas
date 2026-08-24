<?php

namespace App\Models\Gestionar\Usuario;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['usurolusuaid','usurolrolid'])]
class UsuarioRol extends Model
{
    public $timestamps    = false;
    protected $table      = 'usuariorol';
    protected $primaryKey = 'usurolid';
}