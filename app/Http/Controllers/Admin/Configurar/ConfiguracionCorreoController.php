<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Models\Configurar\ConfiguracionCorreo;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class ConfiguracionCorreoController extends Controller
{
	public function index()
	{
        try {
			$data = DB::table('informacionconfiguracioncorreo')
							->select('incocoid','incocohost','incocousuario','incococlave','incococlaveapi','incocopuerto')->get();
			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información ']);
		}
    }

    public function salve(Request $request)
	{ 
		$request->validate([
                'host'     => 'required|string|min:4|max:50',
                'usuario'  => 'required|string|min:4|max:80',
                'clave'    => 'required|string|min:6|max:20',
                'claveApi' => 'required|string|min:6|max:20',
                'puerto'   => 'required|string|min:1|max:4',
			]);

		try {
            $configuracionCorreo                 = ConfiguracionCorreo::findOrFail($request->codigo);
            $configuracionCorreo->incocohost     = $request->host;
            $configuracionCorreo->incocousuario  = $request->usuario;
            $configuracionCorreo->incococlave    = $request->clave;
            $configuracionCorreo->incococlaveapi = $request->claveApi;
            $configuracionCorreo->incocopuerto   = $request->puerto;
            $configuracionCorreo->save();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}
}