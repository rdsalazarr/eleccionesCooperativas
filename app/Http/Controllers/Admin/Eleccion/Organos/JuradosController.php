<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Eleccion\Organos\Jurado;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;
use App\Util\Empresa;
use Carbon\Carbon;

class JuradosController extends Controller
{
    public function index()
	{
        try{
            $titulo  = 'No existen ningún órgano de elección activo';
            $id      = '';
            $jurados = DB::table('organoeleccionjurado as oej')
                            ->select('oej.oreljuid','oej.orgeleid','d.deledocumento','oej.oreljuesjurado','oej.deleid',
                                DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                DB::raw("if(oej.oreljuesjurado = 1,'Jurado', 'Testigo') as tipoJurado"))
                            ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oej.orgeleid')
                            ->join('delegado as d', 'd.deleid', '=', 'oej.deleid')
                            ->where('oe.orgeleactivo', true)
                            ->orderBy('oej.oreljuid')->get();

            $organoEleccion = DB::table('organoeleccion')->select('orgeleid','orgeletitulo')->where('orgeleactivo', true)->first();
            if($organoEleccion){
                $titulo = 'Gestionar jurados para '.$organoEleccion->orgeletitulo;
                $id     = $organoEleccion->orgeleid;
            }

		    $delegados = DB::table('delegado')
                                ->select('deleid','deledocumento',
                                    DB::raw("CONCAT_WS(' ', deleprimernombre, delesegundonombre, deleprimerapellido, delesegundoapellido) as nombreCompleto"))
                                ->where('deleactivo', true)
                                ->where('deleid', '<>', 1)
                                ->get();

			return response()->json(['success' => true, 'id' => $id, 'titulo' => $titulo, 'jurados' => $jurados, 'delegados' => $delegados]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los delegados']);
		}
	}

    public function salve(Request $request)
	{
	    $request->validate(['codigo' => 'required', 'juradosAsignados' => 'required|array|min:1' ]);

        DB::beginTransaction();
		try {

            foreach($request->juradosAsignados as $dataJurado){

                $identificador = $dataJurado['identificador'];
                $delegadoId    = $dataJurado['delegadoId'];
                $tipo          = $dataJurado['tipo'];
                $estadoActual  = $dataJurado['estado'];

                if($estadoActual == 'D'){//Elimina
                    Jurado::findOrFail($identificador)->delete();
                }elseif($estadoActual == 'I'){
                    $jurado                 = new Jurado();
                    $jurado->orgeleid       = $request->codigo;
                    $jurado->deleid         = $delegadoId;
                    $jurado->oreljuesjurado = $tipo;
                    $jurado->save();
                }if($estadoActual == 'U'){
                    $jurado                = Jurado::findOrFail($identificador);
                    $jurado->deleid         = $delegadoId;
                    $jurado->oreljuesjurado = $tipo;
                    $jurado->save();
                }
            }

            DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de jurado para la elección ']);
		}
	}
}