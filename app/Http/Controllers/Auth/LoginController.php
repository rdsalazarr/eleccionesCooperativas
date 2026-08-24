<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Validation\ValidationException;
use App\Models\Gestionar\Usuario\IntentosFallidos;
use App\Models\Gestionar\Usuario\IngresoSistema;
use App\Http\Controllers\Controller;
use DB, Auth, RateLimiter, Log;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;

class LoginController extends Controller
{
    protected function maxAttempts()
    {
        return 5; // Máximo número de intentos permitidos
    }

    protected function decayMinutes()
    {
        return 15; // Tiempo de bloqueo en minutos
    }

    public function login(Request $request)
    {
        $request->validate([
            'usuario'  => 'required|string',
            'password' => 'required|string|min:6',
        ]);
        
        $usuarioNick = mb_strtoupper($request->usuario, 'UTF-8');
                        $this->ensureIsNotRateLimited($request); //Registro del intento fallido 

        if (Auth::attempt(['usuanick' => $usuarioNick, 'password' => $request->password])) {
            $user = Auth::user();

            if (!$user || $user->usuabloqueado || !$user->usuaactivo) {
                return response()->json(['success' => false, 'message' => 'Estas credenciales no coinciden con nuestros registros.'], 422);
            }

            RateLimiter::clear($this->throttleKey($request));

            try {
                $ingresosistema                         = new IngresoSistema();
                $ingresosistema->usuaid                 = Auth::id();
                $ingresosistema->ingsisipacceso         = $request->ip();
                $ingresosistema->ingsisfechahoraingreso = Carbon::now();
                $ingresosistema->save();
            } catch (\Throwable $e) {
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message' => 'Error al conectar la base de datos ' ], 500);
            }

            // Eliminar los intentos fallidos
            IntentosFallidos::where('intfalusurio', $usuarioNick)->delete();

            $ruta = (Auth::user()->usuacambiarpassword) ? '/reset' : '/dashboard';

            return response()->json(['success' => true, 'message' => 'Usuario autenticado', 'ruta' => $ruta]); 
        }

        // Registrar el intento fallido aunque el usuario no exista
        $intentosfallidos                 = new IntentosFallidos();
        $intentosfallidos->intfalusurio   = $usuarioNick;
        $intentosfallidos->intfalipacceso = $request->ip();
        $intentosfallidos->intfalfecha    = Carbon::now();
        $intentosfallidos->save();

        // Obtener el número de intentos fallidos del usuario
        $intentosFallidosUser = DB::table('intentosfallidos as intf')
                            ->select('intf.intfalid', 'u.usuaid', DB::raw('COUNT(intf.intfalid) as numeroIntentos'))
                            ->join('usuario as u', 'u.usuanick', '=', 'intf.intfalusurio')
                            ->where('intf.intfalusurio', $usuarioNick)
                            ->groupBy('intf.intfalid', 'u.usuaid')
                            ->orderByDesc('intf.intfalfecha')
                            ->first();

        // Bloquear al usuario si excede el número de intentos permitidos
        if ($intentosFallidosUser && $intentosFallidosUser->numeroIntentos >= $this->maxAttempts()) {
            $usuario                = User::findOrFail($intentosFallidosUser->usuaid);
            $usuario->usuabloqueado = true;
            $usuario->save();
        }

        // Incrementar el contador de intentos fallidos
        RateLimiter::hit($this->throttleKey($request), $this->decayMinutes() * 60);

        // Devolver respuesta de intento fallido
        return $this->sendFailedLoginResponse($request);
    }

    public function logout(Request $request)
    {
        $usuario = IngresoSistema::where('ingsisfechahorasalida', null)
                                ->where('usuaid', Auth::id())
                                ->latest('ingsisid')
                                ->first();
        // Registrar la fecha de salida
        if ($usuario) {
            $usuario->ingsisfechahorasalida = Carbon::now();
            $usuario->save();
        }

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }

    protected function ensureIsNotRateLimited(Request $request)
    {      
        if (RateLimiter::tooManyAttempts($this->throttleKey($request), $this->maxAttempts())) {
        throw ValidationException::withMessages([
            'usuario' => ['Has intentado iniciar sesión demasiadas veces. Inténtalo de nuevo en '.$this->decayMinutes().' minutos.'],
        ])->status(429);
        }
    }

    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            'usuario' => ['Estas credenciales no coinciden con nuestros registros o el usuario puede estar bloqueado.'],
        ]);
    }

    protected function throttleKey(Request $request)
    {
        return strtolower($request->input('usuario')) . '|' . $request->ip();
    }
}