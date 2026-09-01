<?php

namespace App\Models\Eleccion;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['toketoken'])]
class Token extends Model
{
    protected $table      = 'token';
    protected $primaryKey = 'tokeid';
}