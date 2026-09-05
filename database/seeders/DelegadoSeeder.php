<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class DelegadoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('delegado')->insert([
            'deleid'              => '1',
            'deledocumento'       => '123456789',
            'deleprimernombre'    => 'VOTO',
            'delesegundonombre'   => null,
            'deleprimerapellido'  => 'BLANCO',
            'delesegundoapellido' => null,
            'delefechaexpedicion' => '2026-10-01',
            'delenumero'          => 99,
            'delecorreo'          => null,
            'deletelefono'        => null,
            'deleactivo'          => false,
            'created_at'          => now(),
			'updated_at'          => now(),
        ]);
    }
}