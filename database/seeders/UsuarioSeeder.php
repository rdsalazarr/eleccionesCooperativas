<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class UsuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('usuario')->insert([
            'agenid'        => '1',
            'usuadocumento' => '1978917',
        	'usuanombre'    => 'RAMÓN DAVID',
            'usuaapellidos' => 'SALAZAR RINCÓN',
            'usuaemail'     => 'radasa10@hotmail.com',
            'usuanick'      => 'RSALAZAR',
        	'password'      => bcrypt('123456'),
            'usuacambiarpassword' => '0',
            'usuaactivo'          => '1',
            'created_at'          => now(),
            'updated_at'          => now(),
        ]);
    }
}
