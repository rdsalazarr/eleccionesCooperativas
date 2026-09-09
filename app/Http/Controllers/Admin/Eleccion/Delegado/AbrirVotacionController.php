<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Models\Eleccion\Delegado\EleccionDelegado;
use App\Services\VotacionDelegadoService;
use App\Http\Controllers\Controller;
use Throwable, DB, Log, Auth;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\Empresa;
use Carbon\Carbon;

class AbrirVotacionController extends Controller
{
    public function index()
	{
        try{

            $eleccion   = DB::table('elecciondelegado')
                                ->select('eledelid','eledeltitulo','eledelperiodo','eledelabrireleccion',
                                    'eledelcerrareleccion','eledelpublicareleccion')
                                ->where('eledelanio', date('Y'))->first();

            if (!$eleccion) {
                return response()->json([
                    'success' => true,
                    'data'    => [
                                    'id'                          => null,
                                    'titulo'                      => 'No hay gestiones de elecciones realizadas',
                                    'habilitarAbrirEleccion'      => false,
                                    'habilitarActaInicio'         => false,
                                    'habilitarCerrarEleccion'     => false,
                                    'habilitarActaCierre'         => false,
                                    'habilitarPublicarResultados' => false,
                                ],
                ]);
            }

            $abierta   = (bool) $eleccion->eledelabrireleccion;
            $cerrada   = (bool) $eleccion->eledelcerrareleccion;
            $publicada = (bool) $eleccion->eledelpublicareleccion;

            return response()->json([
                                'success' => true,
                                'data'    => [
                                                'id'                          => $eleccion->eledelid,
                                                'titulo'                      => 'Procesar '. mb_strtolower($eleccion->eledeltitulo, 'UTF-8').' '.$eleccion->eledelperiodo,
                                                'habilitarAbrirEleccion'      => !$abierta,
                                                'habilitarActaInicio'         => $abierta && !$cerrada,
                                                'habilitarCerrarEleccion'     => $abierta && !$cerrada,
                                                'habilitarActaCierre'         => $cerrada,
                                                'habilitarPublicarResultados' => $cerrada && !$publicada,
                                            ],
                            ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la informacion de la elección de delegados']);
		}
	}

    public function procesarEvento(Request $request)
    {
        $request->validate(['tipo' => 'required', 'codigo' => 'required']);

        DB::beginTransaction();
        try {

            $eleccionDelegado = EleccionDelegado::findOrFail($request->codigo);
            if($request->tipo == 'ABRIR'){
                $eleccionDelegado->eledelabrireleccion = true;
            }
            if($request->tipo == 'CERRAR'){
                $eleccionDelegado->eledelcerrareleccion = true;
            }
            if($request->tipo == 'PUBLICAR'){
                $eleccionDelegado->eledelpublicareleccion = true;
            }
            $eleccionDelegado->save();

            if($request->tipo == 'PUBLICAR'){
                $agencias = DB::table('agencia')->select('agenid', 'agennombre')->orderBy('agennombre')->get();
                foreach ($agencias as $agencia) {

                    $cantidadPrincipales = DB::table('elecciondelegadoagencia as edag')
                                                ->join('elecciondelegado as ed','ed.eledelid', '=','edag.eledelid' )
                                                ->where('edag.agenid', $agencia->agenid)
                                                ->where('ed.eledelanio', date('Y'))
                                                ->where('ed.eledelcerrareleccion', true)
                                                ->value('edag.eldeagnumerodeleprincipal');

                    $delegados = DB::table('elecciondelegadoaspirante as eda')
                                        ->select(
                                            'eda.agenid',
                                            'eda.eldeasid',
                                            'eda.eldeasdocumento',
                                            'eda.eldeascorreo',
                                            'eda.eldeasprimernombre',
                                            'eda.eldeassegundonombre',
                                            'eda.eldeasprimerapellido',
                                            'eda.eldeassegundoapellido',
                                            'eda.eldeasnumero',
                                            DB::raw('(SELECT COUNT(eldevoid)
                                                    FROM elecciondelegadovoto
                                                    WHERE eledelid = ed.eledelid
                                                    AND eldeasid = eda.eldeasid
                                                ) AS totalVotos') )
                                        ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                        ->where('eda.agenid', $agencia->agenid)
                                        ->where('ed.eledelanio', date('Y'))
                                        ->where('eda.eldeasactivo', true)
                                        ->where('eda.eldeasesvotoblanco', false)
                                        ->where('ed.eledelcerrareleccion', true)
                                        ->whereExists(function ($query) {
                                            $query->select(DB::raw(1))
                                                ->from('elecciondelegadovoto as edv')
                                                ->whereColumn('edv.eledelid', 'eda.eledelid')
                                                ->whereColumn('edv.eldeasid', 'eda.eldeasid');
                                        })
                                        ->orderByDesc('totalVotos')
                                        ->orderBy('eda.eldeasnumero')
                                        ->limit($cantidadPrincipales)
                                        ->get();

                    foreach ($delegados as $indice => $aspirante) {
                        DB::table('delegado')->insert([
                            'agenid'              => $aspirante->agenid,
                            'deledocumento'       => $aspirante->eldeasdocumento,
                            'deleprimernombre'    => $aspirante->eldeasprimernombre,
                            'delesegundonombre'   => $aspirante->eldeassegundonombre,
                            'deleprimerapellido'  => $aspirante->eldeasprimerapellido,
                            'delesegundoapellido' => $aspirante->eldeassegundoapellido,
                            'delenumero'          => str_pad($indice + 1, 2, '0', STR_PAD_LEFT),
                            'delecorreo'          => $aspirante->eldeascorreo,
                            'deleactivo'          => true,
                            'created_at'          => now(),
                            'updated_at'          => now(),
                        ]);
                    }
                }
            }

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito']);
        }catch(Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la informacion de la elección de delegados']);
		}
    }

    public function actaInicio(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaInicio('GENERAL');

            $dataPdf = GenerarPdf::actaInicio($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de inicio ']);
		}
	}

    public function actaCierre(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaCierre('GENERAL');

            $dataPdf = GenerarPdf::actaCierre($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de cierre ']);
		}
	}
}