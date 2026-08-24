<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class TipoIdentificacion extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('tipoidentificacion')->insert([
            'tipideid'     => '1',
            'tipidesigla'  => 'TI',
            'tipidenombre' => 'Tarjeta de identidad'
        ]);

        DB::table('tipoidentificacion')->insert([
            'tipideid'     => '2',
            'tipidesigla'  => 'CC',
            'tipidenombre' => 'Cédula de ciudadanía'
        ]);

        DB::table('tipoidentificacion')->insert([
            'tipideid'     => '3',
            'tipidesigla'  => 'RC',
            'tipidenombre' => 'Registro civil'
        ]);

        DB::table('tipoidentificacion')->insert([
            'tipideid'     => '4',
            'tipidesigla'  => 'NIT',
            'tipidenombre' => 'Número de identificación tributaria'
        ]);
    }
}