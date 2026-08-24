<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Auth, DB;

class PreloadSecurityMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {        
        $ruta     = $request->path(); 
        $consulta = DB::table('funcionalidad')
                        ->select('funcid')
                        ->join('rolfuncionalidad','rolfunfuncid','=','funcid')
                        ->join('usuariorol','usurolrolid','=','rolfunrolid')
                        ->where('usurolrolid', Auth::id());

            if(Auth::id() != 1)
                $consulta = $consulta->where('funcactiva', 1);

            $funcionalidad =  $consulta->where('funcruta', $ruta)->get();

        if (!$funcionalidad){
            return response()->view('errors.401', ['title' => 'Acceso no autorizado'], 401);
        }

        return $next($request);
    }
}
