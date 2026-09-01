<?php

namespace App\Models\Gestionar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tiporgnombre','tiporgvotosporpersona','tiporgtotalprincipales','tiporgtotalsuplente', 'tiporglogo', 'tiporgactivo'])]
class TipoOrgano extends Model
{
    protected $table      = 'tipoorgano';
    protected $primaryKey = 'tiporgid';
}