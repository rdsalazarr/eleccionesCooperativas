<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class EmpresaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       DB::table('empresa')->insert([
            'emprid'              => '1',
            'emprnit'             => '800.145.149-3',
            'emprnombre'          => 'COOPERATIVA ESPECIALIZADA DE AHORRO Y CRÉDITO',
            'emprsigla'           => 'COOPIGON',
            'emprlema'            => 'Servicios financieros a su alcance',
            'emprdireccion'       => 'Calle 3 No.2-60 Barrio la villa González, Cesar', 
            'emprciudad'          => 'Gonzalez - Cesar',
            'emprcorreo'          => 'coopigon2@yahoo.es',
            'emprtelefonofijo'    => '3158118152',
            'emprtelefonocelular' => '3158118153',
            'emprurl'             => 'www.coopigon.com',
            'emprlogo'            => '1587855129_logo-coopigon.png',
            'created_at'          => now(),
			'updated_at'          => now(),
        ]); 
    }
}
