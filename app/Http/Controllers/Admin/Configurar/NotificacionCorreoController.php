<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Models\Configurar\NotificacionCorreo;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class NotificacionCorreoController extends Controller
{
	public function index()
	{
        try { 
            $data = DB::table('informacionnotificacioncorreo')
                    ->select('innocoid','innoconombre','innocoasunto','innococontenido','innocoenviarpiepagina','innocoenviarcopia',
                    DB::raw("if(innocoenviarpiepagina = 1 ,'Sí', 'No') as enviarPiePagina"),
                    DB::raw("if(innocoenviarcopia = 1 ,'Sí', 'No') as enviarCopia"))
					->get();

        	return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información ']);
		}
    }

    public function salve(Request $request)
	{ 
        $id                 = $request->codigo;
        $notificacionCorreo = ($id != '000') ? NotificacionCorreo::findOrFail($id) : new NotificacionCorreo();

		$request->validate([
                'nombre'     => 'required|string|min:6|max:50|unique:informacionnotificacioncorreo,innocoid,'.$notificacionCorreo->innocoid.',innocoid',
                'asunto'     => 'required|string|min:4|max:120',
                'contenido'  => 'required|string',
                'piePagina'  => 'required',
                'copia'      => 'required'
			]);

		try {
            $notificacionCorreo->innoconombre          = $request->nombre;
            $notificacionCorreo->innocoasunto          = $request->asunto;
            $notificacionCorreo->innococontenido       = $request->contenido;
            $notificacionCorreo->innocoenviarpiepagina = $request->piePagina;
            $notificacionCorreo->innocoenviarcopia     = $request->copia;
            $notificacionCorreo->save();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro']);
		}
	}

    public function destroy(Request $request)
	{
        $request->validate(['codigo' => 'required']);

		try {
			$notificacionCorreo = NotificacionCorreo::findOrFail($request->codigo);
			$notificacionCorreo->delete();
			return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro']);
		}
	} 
}