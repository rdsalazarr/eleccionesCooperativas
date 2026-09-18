<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class EleccionDelegadoController extends Controller
{
    public function index(Request $request)
	{
		try{
			$tiposIdentificaciones = DB::table('tipoidentificacion')->select('tipideid','tipidenombre')->orderBy('tipidenombre')->get();

			return response()->json(['success' => true, "tiposIdentificaciones" => $tiposIdentificaciones]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de la elección de delegados']);
		}
	}

    public function consultar(Request $request)
	{
		$request->validate(['tipoIdentificacion' => 'required',
                            'numeroDocumento'    => 'required|min:6|max:15',
                            'fechaExpedicion'    => 'required|date|date_format:Y-m-d',
                         ]);
		try{

			$asociado = DB::table('asociado')
                            ->select('asocid','agenid','asocnombrecompleto')
                            ->where('tipideid', $request->tipoIdentificacion)
                            ->where('asocnumerodocumento', $request->numeroDocumento)
                            ->where('asocfechaexpedicion', $request->fechaExpedicion)
                            ->where('asocactivo', true)
                            ->first();

            if($asociado){

                return response()->json(['success' => true, 'asociado' => $asociado ]);
            }else{
                return response()->json(['success' => false, 'message' =>  'Los datos ingresados no corresponden a un asociado apto para realizar dicho proceso, por favor comunique con la oficina']);
            }
		}catch(Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del asociado para las elecciones de delegado']);
		}
	}
    
}
