<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Services\VotacionDelegadoService;
use App\Http\Controllers\Controller;
use Throwable, DB, Log, Auth;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\Empresa;
use Carbon\Carbon;

class ImprimirActasVotacionController extends Controller
{
    public function index()
	{
        try{

            $eleccion   = DB::table('elecciondelegado')
                                ->select('eledelid','eledeltitulo','eledelperiodo','eledelabrireleccion','eledelcerrareleccion')
                                ->where('eledelanio', date('Y'))->first();

            if (!$eleccion) {
                return response()->json([
                    'success' => true,
                    'data'    => [
                                    'id'                  => null,
                                    'titulo'              => 'No hay gestiones de elecciones realizadas',
                                    'habilitarActaInicio' => false,
                                    'habilitarActaCierre' => false,
                                ],
                ]);
            }

            $abierta   = (bool) $eleccion->eledelabrireleccion;
            $cerrada   = (bool) $eleccion->eledelcerrareleccion;

            return response()->json([
                                'success' => true,
                                'data'    => [
                                                'id'                  => $eleccion->eledelid,
                                                'titulo'              => 'Imprimir actas de '. mb_strtolower($eleccion->eledeltitulo, 'UTF-8').' '.$eleccion->eledelperiodo,
                                                'habilitarActaInicio' => $abierta && !$cerrada,
                                                'habilitarActaCierre' => $cerrada,
                                            ],
                            ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la informacion de la elección de delegados']);
		}
	}

    public function actaInicio(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaInicio('INDIVIDUAL');

            $dataPdf = GenerarPdf::actaInicio($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta individual de inicio ']);
		}
	}

    public function actaCierre(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaCierre('INDIVIDUAL');

            $dataPdf = GenerarPdf::actaCierre($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta individual de cierre ']);
		}
	}
}