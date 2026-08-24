<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(AgenciaSeeder::class);
        $this->call(UsuarioSeeder::class);
        $this->call(EmpresaSeeder::class);
        $this->call(DelegadoSeeder::class);
        $this->call(TipoOrganoSeeder::class);
        $this->call(TipoIdentificacion::class);
        $this->call(OrganoEleccionSeeder::class);
        $this->call(ConfiguracionCorreoSeeder::class);
    }
}
