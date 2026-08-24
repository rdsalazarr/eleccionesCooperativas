<?php

namespace App\Models;

use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Gestionar\Usuario\HistorialContrasena;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use App\Models\Gestionar\Usuario\IngresoSistema;
use App\Models\Gestionar\Usuario\UsuarioRol;
use Illuminate\Notifications\Notifiable;

#[Fillable(['agenid','usuadocumento','usuanombre','usuaapellidos','usuanick','usuaemail',
            'usuaalias','password','usuacambiarpassword','usuabloqueado','usuaactivo'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table      = 'usuario';
    protected $primaryKey = 'usuaid';

    public function ingresoSistema()
    {
        return $this->hasMany(IngresoSistema::class, 'usuaid', 'usuaid');
    } 

    public function usuarioRol()
    {
        return $this->hasMany(UsuarioRol::class, 'usurolusuaid', 'usuaid');
    } 

    public function historialContrasena()
    {
        return $this->hasMany(HistorialContrasena::class, 'usuaid', 'usuaid');
    } 

    protected static function booted()
    {
        static::deleting(function ($usuario) {
            $usuario->usuarioRol()->delete();
            $usuario->ingresoSistema()->delete();
            $usuario->historialContrasena()->delete();
        });
    }

    protected function casts(): array
    {
        return [
            'password'            => 'hashed',
            'usuacambiarpassword' => 'boolean',
            'usuabloqueado'       => 'boolean',
            'usuaactivo'          => 'boolean',
        ];
    }
}