<?php

namespace App\Http\Controllers\Admin;

use App\Models\Configurar\Menu\Funcionalidad;
use App\Http\Controllers\Controller;
use Throwable, DB, Auth, Log;
use Illuminate\Http\Request;
use App\Util\General;
use App\Models\User;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
	{
		return (auth()->user()->usuacambiarpassword) ? view('page.reset',['title' => 'Modificar credenciales de acceso al sistema']) :
														view('page.dashboard',['title' => 'Dashboard del sistema de elecciones de COOPIGON']);
	}

    public function reset()
	{ 
		return view('page.reset',['title' => 'Modificar credenciales de acceso al sistema']);
	}

	public function informacion(Request $request)
	{
		try{
			$nombreUsuario = mb_strtoupper(auth()->user()->usuanombre.' '.auth()->user()->usuaapellidos,'UTF-8');

			return response()->json(['success' => true, "nombreUsuario" => $nombreUsuario]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información ']);
		}
	}

    public function menu(Request $request)
	{
		try{
			
			$dataUsuario = ['nombre'    => Auth::user()->usuanombre,
							'apellidos' => Auth::user()->usuaapellidos
							];

			return response()->json(['success' => true, "data" => Funcionalidad::menus(), "dataUsuario" => $dataUsuario]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del menu del usuario ']);
		}
	}
}