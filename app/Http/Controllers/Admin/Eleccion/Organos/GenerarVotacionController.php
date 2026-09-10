<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Gestionar\OrganoEleccionTipoOrgano;
use App\Models\Eleccion\Organos\Participante;
use App\Services\VotacionDelegadoService;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use Throwable, DB, Log;
use App\Util\Empresa;
use Carbon\Carbon;

class GenerarVotacionController extends Controller
{
    public function index()
	{
        try{

            $anioActual = date('Y');
    	    $titulo 	= 'No existen elecciones disponibles'; 
            $organoEleccion = DB::table('organoeleccion')->select('orgeletitulo')->where('orgeleanio', $anioActual)->where('orgeleactivo', true)->first();
            if($organoEleccion){
                $titulo = 'Generar elecciones para '.$organoEleccion->orgeletitulo;
            }

            $data = DB::table('organoelecciontipoorgano as oeto')
                            ->select('oeto.oreltoid','oeto.orgeleid','oeto.tiporgid', 'to.tiporgnombre', 'oe.orgeletitulo','oeto.oreltofechahorainicio', 'oeto.oreltofechahoracierre',
                                DB::raw('(SELECT count(orelpaid) 
                                    FROM organoeleccionparticipante WHERE tiporgid = oeto.tiporgid
                                    and orgeleid = oeto.orgeleid and orelpaesvotoblanco = false) AS totalInscrito'),
                                DB::raw('CASE
                                        WHEN oeto.oreltofechahorainicio IS NULL
                                        THEN true
                                        ELSE false
                                    END AS habilitarAbrirVotacion'), 
                                DB::raw('CASE
                                        WHEN oeto.oreltofechahoracierre IS NOT NULL
                                        THEN false
                                        ELSE true
                                    END AS habilitarCerrarVotacion'),
                                DB::raw('CASE
                                        WHEN oeto.oreltofechahoracierre IS NOT NULL
                                        THEN true
                                        ELSE false
                                    END AS habilitarImpresionVotacion'))
                            ->join('tipoorgano as to', 'to.tiporgid', '=', 'oeto.tiporgid')
                            ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')
                            ->where('oe.orgeleanio', $anioActual)
                            ->where('oe.orgeleactivo', true)
                            ->where('to.tiporgactivo', true)
                            ->get();

			return response()->json(['success' => true, 'data' => $data, 'titulo' => $titulo]);
		}catch(Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los organos de control activos']);
		}
	}

    public function imprimirLista(Request $request)
	{
        $request->validate(['codigo' => 'required|numeric']);

        try {

            $empresa        = Empresa::informacion();
            $tipoOrgano     = DB::table('tipoorgano')->select('tiporgnombre')->where('tiporgid', $request->codigo)->first();
            $nombreTpOrgano = $tipoOrgano->tiporgnombre;
            $titulo         = mb_strtoupper('LISTA DE ASPIRANTE INSCRITOS PARA EL '.$tipoOrgano->tiporgnombre.' '.date('Y') ,'UTF-8');

            $participantes = DB::table('organoeleccionparticipante as oep')
                                ->select('oep.orelpaid','oep.deleid','oep.orelpaordenparticipacion', 'd.deledocumento',
                                        DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"))
                                ->join('delegado as d', 'd.deleid', '=', 'oep.deleid')
                                ->where('oep.tiporgid', $request->codigo)
                                ->whereIn('oep.orgeleid', function($query) {
                                    $query->select('orgeleid')->from('organoeleccion')
                                            ->where('orgeleanio', date('Y'))
                                            ->where('orgeleactivo', true);
                                    })
                                ->orderBy('oep.orelpaordenparticipacion')
                                ->get();

            $data = [
                'nombreTpOrgano' => $nombreTpOrgano,
                'participantes'  => $participantes,
                'titulo'         => $titulo
            ];

            $dataPdf = GenerarPdf::listaAspiranteTipoOrganos($data, $empresa, 'S'); 

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF ']);
		}
    }

    public function abrir(Request $request)
    {
        $request->validate(['codigo' => 'required']);

        DB::beginTransaction();
        try {

            $tipoEleccion  = DB::table('organoelecciontipoorgano')->select('tiporgid','orgeleid')->where('oreltoid', $request->codigo)->first();

            $organoEleccionTipoOrgano                        = OrganoEleccionTipoOrgano::findOrFail($request->codigo);
            $organoEleccionTipoOrgano->oreltofechahorainicio = Carbon::now();
            $organoEleccionTipoOrgano->save();

            $organoEleccionParticipante                           = new Participante();
            $organoEleccionParticipante->tiporgid                 = $tipoEleccion->tiporgid;
            $organoEleccionParticipante->orgeleid 	              = $tipoEleccion->orgeleid;
            $organoEleccionParticipante->deleid 	              = 1; //para registrar voto en blanco
            $organoEleccionParticipante->orelpaordenparticipacion = 100;
            $organoEleccionParticipante->orelpaesvotoblanco       = true;
            $organoEleccionParticipante->save();

            DB::commit();
          	return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito']);
		} catch (Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al abrir las elecciones del tipo de órgano ']);
		}
    }

    public function cerrar(Request $request)
    {
        $request->validate(['codigo' => 'required']);
        DB::beginTransaction();
        try {

            $organoEleccionTipoOrgano                        = OrganoEleccionTipoOrgano::findOrFail($request->codigo);
            $organoEleccionTipoOrgano->oreltofechahoracierre = Carbon::now();
            $organoEleccionTipoOrgano->save();

            DB::commit();
          	return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al cerrar las elecciones del tipo de órgano ']);
		}
    }

    public function actaApertura(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaApertura('GENERAL');

            $dataPdf = GenerarPdf::actaApertura($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de apertura ']);
		}
	}

    public function actaEscrutinio(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaEscrutinio('GENERAL');

            $dataPdf = GenerarPdf::actaEscrutinio($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de escrutinio ']);
		}
	}

    public function listaResultado(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->listaResultado('GENERAL');

            $dataPdf = GenerarPdf::listaResultado($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de lista de resultados ']);
		}
	}    

    public function actaResultado(Request $request, VotacionDelegadoService $service)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            $data    = $service->actaResultado('GENERAL');

            $dataPdf = GenerarPdf::actaResultado($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de resultados ']);
		}
	}
}