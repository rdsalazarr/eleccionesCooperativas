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
														view('page.dashboard',['title' => 'Dashboard del sistema de PQRSDF']);
	}

    public function reset()
	{ 
		return view('page.reset',['title' => 'Modificar credenciales de acceso al sistema']);
	}

    public function menu(Request $request)
	{
		try{
			return response()->json(['success' => true, "data" => Funcionalidad::menus()]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del menu del usuario ']);
		}
	}
}