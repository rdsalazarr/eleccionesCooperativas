<?php

namespace App\Models\Configurar\Menu;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['modunombre','moduicono','moduorden','moduactivo'])]
class Modulo extends Model
{
    protected $table      = 'modulo';
    protected $primaryKey = 'moduid';
}