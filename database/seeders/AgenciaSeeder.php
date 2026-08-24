<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class AgenciaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('agencia')->insert(
            ['agenid' => '1', 'agennombre' => 'Gonzalez'],
            ['agenid' => '2', 'agennombre' => 'Villa Caro'] 
        );
    }
}