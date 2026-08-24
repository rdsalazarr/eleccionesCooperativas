<?php

namespace App\Util;

use DB;

class Empresa
{
    public static function informacion()
	{
        return DB::table('empresa as e')
                ->select('e.emprnombre','e.emprdireccion','e.emprcorreo','e.emprtelefonofijo','e.emprtelefonocelular',
                    'e.emprurl', 'e.emprlema','e.emprnit','e.emprsigla',
                    DB::raw("CONCAT('NIT:', e.emprnit) as nitEmpresa"),
                    DB::raw("CONCAT('Dirección:', e.emprdireccion) as direccionEmpresa"),
                    DB::raw("CONCAT('Correo electrónico:', e.emprcorreo) as correoElectronico"),
                    DB::raw("CONCAT('archivos/images/logoIntitucion/',e.emprlogo) as logo"),
                    DB::raw(" CASE 
                                WHEN e.emprtelefonofijo IS NOT NULL AND e.emprtelefonocelular IS NOT NULL 
                                    THEN CONCAT('Teléfonos: ', e.emprtelefonofijo, ' / ', e.emprtelefonocelular)
                                WHEN e.emprtelefonofijo IS NOT NULL 
                                    THEN CONCAT('Teléfono: ', e.emprtelefonofijo)
                                WHEN e.emprtelefonocelular IS NOT NULL 
                                    THEN CONCAT('Teléfono: ', e.emprtelefonocelular)
                                ELSE 'Sin teléfono'
                            END as telefonosEmpresa
                        "))
            ->where('e.emprid', 1)
            ->first();
    }
}