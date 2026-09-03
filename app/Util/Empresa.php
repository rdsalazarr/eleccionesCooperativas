<?php

namespace App\Util;

use DB;

class Empresa
{
    public static function informacion()
	{
        return DB::table('empresa')
                ->select('emprnombre','emprdireccion','emprcorreo','emprtelefonofijo','emprtelefonocelular','emprurl', 'emprlema','emprnit','emprsigla',
                    DB::raw("CONCAT('NIT:', emprnit) as nitEmpresa"),
                    DB::raw("CONCAT('Dirección:', emprdireccion) as direccionEmpresa"),
                    DB::raw("CONCAT('Correo electrónico:', emprcorreo) as correoElectronico"),
                    DB::raw("CONCAT('archivos/images/logoIntitucion/',emprlogo) as logoEmpresa"),
                    DB::raw(" CASE 
                                WHEN emprtelefonofijo IS NOT NULL AND emprtelefonocelular IS NOT NULL 
                                    THEN CONCAT('Teléfonos: ', emprtelefonofijo, ' / ', emprtelefonocelular)
                                WHEN emprtelefonofijo IS NOT NULL 
                                    THEN CONCAT('Teléfono: ', emprtelefonofijo)
                                WHEN emprtelefonocelular IS NOT NULL 
                                    THEN CONCAT('Teléfono: ', emprtelefonocelular)
                                ELSE 'Sin teléfono'
                            END as telefonosEmpresa
                        "))
            ->where('emprid', 1)
            ->first();
    }
}