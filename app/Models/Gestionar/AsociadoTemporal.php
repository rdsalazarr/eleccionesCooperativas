<?php

namespace App\Models\Gestionar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['asotemagencia','asotemtipodocumento','asotemnumero','asotemnombrecompleto',
            'asotemfechaingreso','asotemgenero','asotemfechanacimiento','asotemtelefono',
            'asotememail','asotemcelular','asotemfechaexpedicion'])]
class AsociadoTemporal extends Model
{
    public $timestamps    = false;
    protected $table      = 'asociadotemporal';
	protected $primaryKey = 'asotemid';
}