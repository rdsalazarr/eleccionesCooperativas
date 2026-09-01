<?php

namespace App\Imports;

use App\Models\Gestionar\AsociadoTemporal;
use Illuminate\Database\Eloquent\Model;
use Maatwebsite\Excel\Concerns\ToModel;
use Carbon\Carbon;

class AsociadosImport implements ToModel
{
    public function model(array $row): Model|array|null
    {
        return new AsociadoTemporal([
            'asotemagencia'         => $row[0],
            'asotemtipodocumento'   => $row[1],
            'asotemnumero'          => $row[2],
            'asotemnombrecompleto'  => $row[3],
            'asotemfechanacimiento' => $this->getUpdatedAtAttribute($row[4]),
            'asotemfechaexpedicion' => $this->getUpdatedAtAttribute($row[5]),
            'asotememail'           => $row[6],
            'asotemtelefono'        => $row[7],
            'asotemcelular'         => $row[8],
        ]);
    }

    public function getUpdatedAtAttribute($date)
    {
        if (empty($date)) {
            return null;
        }

        if ($date instanceof DateTimeInterface) {
            return Carbon::instance($date)->format('Y-m-d');
        }

        // Si llegó como texto
        return Carbon::parse(trim((string) $date))->format('Y-m-d');
        //return Carbon::createFromFormat('d/m/Y', $date)->format('Y-m-d');
    }
}