<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class ConfiguracionCorreoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('informacionconfiguracioncorreo')->insert([
            'incocoid'       => '1',
            'incocohost'     => 'smtp.gmail.com',
            'incocousuario'  => 'notificacionpqrs@gmail.com',
            'incococlave'    => 'Notific@cionPqrs2022',
            'incococlaveapi' => 'tofgejwboupwysyf',
            'incocopuerto'   => '587',
        ]);
    }
}