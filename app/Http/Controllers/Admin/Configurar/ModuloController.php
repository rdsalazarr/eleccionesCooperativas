<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Models\Configurar\Menu\Modulo;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class ModuloController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('modulo as m')
                            ->select('m.moduid','m.modunombre','m.moduicono','m.moduorden','m.moduactivo',
								DB::raw("if(m.moduactivo = 1 ,'Sí', 'No') as estado"),
                                DB::raw('(SELECT COUNT(funcid) AS funcid FROM funcionalidad WHERE moduid = m.moduid) AS totalMenu'))
                            ->orderBy('m.moduorden')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los módulos']);
		}
	}

	public function salve(Request $request)
	{
	    $request->validate([
		    'codigo' => 'required',
            'nombre' => 'required|string|min:3|max:30',
            'icono'  => 'required|string|min:4|max:30', 
            'orden'  => 'required|numeric',
            'estado' => 'required'
        ]);

		try {
			$id = $request->codigo;	
			$modulo             = ($id != '000') ? Modulo::findOrFail($id) : new Modulo();
			$modulo->modunombre = $request->nombre;
			$modulo->moduicono  = $request->icono;
			$modulo->moduorden  = $request->orden;
			$modulo->moduactivo = $request->estado;
			$modulo->save();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);

		$funcionalidad = DB::table('funcionalidad')->select('moduid')->where('moduid', $request->codigo)->first();
		if($funcionalidad){
			return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con una funcionalidad del sistema']);
		}else{
			try {
				$modulo = Modulo::findOrFail($request->codigo);
				$modulo->delete();
				return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
			} catch (Throwable $e){
				Log::error($e->getMessage());
				return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro ']);
			}
		}
	}
}