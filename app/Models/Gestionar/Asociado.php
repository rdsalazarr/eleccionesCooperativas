<?php

namespace App\Models\Gestionar;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;

#[Fillable(['tipideid','agenid','asocnumerodocumento','asocnombrecompleto',
            'asocfechaingreso','asocgenero','asocfechanacimiento','asoctelefono',
            'asocemail','asocdescripcion','asoccelular','asocfechaexpedicion','asocactivo'])]
class Asociado extends Model
{
    protected $table      = 'asociado';
	protected $primaryKey = 'asocid';
}