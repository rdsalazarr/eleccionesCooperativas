<?php

namespace App\Models\Configurar;

use Illuminate\Database\Eloquent\Model;

#[Fillable(['actatitulo','actacontenido'])]
class Acta extends Model
{
    protected $table      = 'acta';
    protected $primaryKey = 'actaid';
}