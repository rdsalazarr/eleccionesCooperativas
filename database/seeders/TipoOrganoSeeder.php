<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class TipoOrganoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('tipoorgano')->insert([
            'tiporgid'               => '1',
            'tiporgnombre'           => 'Consejo de Administración',
            'tiporgvotosporpersona'  => '5',
            'tiporgtotalprincipales' => '3',
            'tiporgtotalsuplente'    => '3',
            'tiporglogo'             => '1588782205_consejo_admon.jpg',
            'created_at'             => now(),
			'updated_at'             => now(),
        ]); 

        DB::table('tipoorgano')->insert([
            'tiporgid'               => '2',
            'tiporgnombre'           => 'Junta de Vigilancia',
            'tiporgvotosporpersona'  => '3',
            'tiporgtotalprincipales' => '3',
            'tiporgtotalsuplente'    => '3',
            'tiporglogo'             => '1588782226_junta-vigilancia.png',
            'created_at'             => now(),
			'updated_at'             => now(),
        ]); 

        DB::table('tipoorgano')->insert([
            'tiporgid'               => '3',
            'tiporgnombre'           => 'Comité de Apelación',
            'tiporgvotosporpersona'  => '3',
            'tiporgtotalprincipales' => '3',
            'tiporgtotalsuplente'    => '3',
            'tiporglogo'             => '1588782217_comite-apelacion.jpg',
            'created_at'             => now(),
			'updated_at'             => now(),
        ]); 
    }
}