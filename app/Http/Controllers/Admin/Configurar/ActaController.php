<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Http\Controllers\Controller;
use App\Models\Configurar\Acta;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class ActaController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('acta')->select('actaid','actatitulo','actacontenido')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de las actas']);
		}
	}

	public function salve(Request $request)
	{
	    $request->validate([
		    'codigo'    => 'required',
            'titulo'    => 'required|string|min:4|max:190',
            'contenido' => 'required|string|min:4|max:3950'
        ]);

		try {
			$id = $request->codigo;	
			$acta                = ($id != '000') ? Acta::findOrFail($id) : new Acta();
			$acta->actatitulo    = $request->titulo;
            $acta->actacontenido = $request->contenido;
			$acta->save();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);
        try {
            $acta = Acta::findOrFail($request->codigo);
            $acta->delete();
            return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
        } catch (Throwable $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro del acta ']);
        }
	}
}