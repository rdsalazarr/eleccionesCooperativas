<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class OrganoEleccionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('organoeleccion')->insert([
            'orgeleanio'    => '2026',
            'orgeletitulo'  => 'XXXVII Asamblea General de Delegados',
            'orgelelugar'   => 'Auditorio de COOPIGON',
            'orgeleperiodo' => '2027-2030',
            'created_at'    => now(),
			'updated_at'    => now(),
        ]);
    }
}