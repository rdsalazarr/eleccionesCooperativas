<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Gestionar\OrganoEleccionTipoOrgano;
use App\Models\Eleccion\Organos\Participante;
use App\Services\VotacionDelegadoService;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\General;
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

    public function actaApertura(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa      = Empresa::informacion();
            $siglaEmpresa = $empresa->emprsigla;

            $tipoOrgano = DB::table('tipoorgano as to')
                            ->select('oe.orgeleid','oe.orgelelugar', 'oe.orgeletitulo','to.tiporgnombre','oeto.oreltofechahorainicio')
                            ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid') 
                            ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')  
                            ->where('oeto.oreltoid', $request->codigo)
                            ->first();

            $jurados = DB::table('organoeleccionjurado as oej')
                                ->select('d.deledocumento as documento','oej.oreljuesjurado',
                                    DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                    DB::raw("if(oej.oreljuesjurado = 1,'Jurado', 'Testigo') as tipoPersona"))
                                ->join('delegado as d', 'd.deleid', '=', 'oej.deleid') 
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oej.orgeleid')
                                ->where('oe.orgeleid', $tipoOrgano->orgeleid)
                                ->orderByDesc('oej.oreljuesjurado')
                                ->get();

            $acta = DB::table('acta')->select('actatitulo','actacontenido')->where('actaid', 1)->first(); 

            $tituloPdf      = str_replace('anio', date("Y"), $acta->actatitulo);
            $lugarEvento    = $tipoOrgano->orgelelugar;
            $tipoEleccion   = $tipoOrgano->tiporgnombre;
            $tituloEleccion = $tipoOrgano->orgeletitulo;
            $horaInicio     = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio);
            $fechanicio     = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio, false);

            //Obtengo los jurados y testigos
            $nombreJurados  = '';
            $nombreTestigos = '';
            foreach ($jurados as $jurado) { 
                if($jurado->oreljuesjurado){
                    $nombreJurados .= $jurado->nombreCompleto.', ' ;
                }else{
                    $nombreTestigos .= $jurado->nombreCompleto.', ' ;
                }
            }

            $nombreJurados  = substr($nombreJurados, 0, -2);
            $nombreTestigos = substr($nombreTestigos, 0, -2); 
            $buscar         = Array('horaInicio','lugarEvento','tipoEleccion','siglaEmpresa','tituloEleccion','nombreJurados','nombreTestigos');
            $remplazo       = Array($horaInicio, $lugarEvento, $tipoEleccion, $siglaEmpresa, $tituloEleccion, $nombreJurados, $nombreTestigos); 
            $contenido      = str_replace($buscar, $remplazo, $acta->actacontenido);

            $data = [
                    'tipoEleccion' => mb_strtoupper($tipoEleccion,'UTF-8'),
                    'fechanicio'   => $fechanicio,
                    'contenido'    => $contenido,
                    'tituloPdf'    => $tituloPdf,
                    'jurados'      => $jurados
                ];

            $dataPdf = GenerarPdf::actaApertura($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de apertura ']);
		}
	}

    public function listaResultado(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();

            $tipoOrgano = DB::table('tipoorgano as to')
                                ->select('oeto.tiporgid', 'oeto.orgeleid', 'to.tiporgnombre','to.tiporgtotalprincipales','to.tiporgtotalsuplente')
                                ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid')
                                ->where('oeto.oreltoid', $request->codigo)
                                ->first();

            $botosBlanco = DB::table('organoeleccionparticipante as oep') 
                                    ->select(DB::raw('(SELECT count(orelpvid)
                                                        FROM organoeleccionparticipantevoto 
                                                        WHERE orelpaid = oep.orelpaid
                                                        ) AS totalVotos'))
                                    ->where('oep.tiporgid', $tipoOrgano->tiporgid)
                                    ->where('oep.orgeleid', $tipoOrgano->orgeleid)
                                    ->where('oep.orelpaesvotoblanco', true)
                                    ->orderByDesc('totalVotos')
                                    ->first();

            $participantes = DB::table('delegado as d') 
                                ->select('d.deledocumento as documento','oep.orelpaordenparticipacion',
                                        DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                        DB::raw('(SELECT count(orelpvid)
                                                    FROM organoeleccionparticipantevoto 
                                                    WHERE orelpaid = oep.orelpaid
                                                    ) AS totalVotos'))
                                ->join('organoeleccionparticipante as oep', 'oep.deleid', '=', 'd.deleid')
                                ->where('oep.tiporgid', $tipoOrgano->tiporgid)
                                ->where('oep.orgeleid', $tipoOrgano->orgeleid)
                                ->where('oep.orelpaesvotoblanco', false)
                                ->orderByDesc('totalVotos')
                                ->orderBy('oep.orelpaordenparticipacion')
                                ->get();

            $tipoEleccion     = $tipoOrgano->tiporgnombre;
            $tituloPdf        = 'Lista_resultado_'.str_replace(' ', '_',  mb_strtolower($tipoEleccion,'UTF-8'));
            $tituloPdf        = str_replace('ó', 'o', $tituloPdf);
            $totalPrincipal   = $tipoOrgano->tiporgtotalprincipales;
            $totalSuplente    = $tipoOrgano->tiporgtotalsuplente;
            $totalVotosBlanco = $botosBlanco->totalVotos;

            $data = [
                    'tipoEleccion'     => mb_strtoupper($tipoEleccion,'UTF-8'),
                    'totalVotosBlanco' => $totalVotosBlanco,
                    'totalPrincipal'   => $totalPrincipal,
                    'participantes'    => $participantes,
                    'totalSuplente'    => $totalSuplente,
                    'tituloPdf'        => $tituloPdf,
                ];

            $dataPdf = GenerarPdf::listaResultado($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de lista de resultados ']);
		}
	}

    public function actaEscrutinio(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa = Empresa::informacion();
            
            $tipoOrgano = DB::table('tipoorgano as to')
                        ->select('oeto.tiporgid', 'oeto.orgeleid','to.tiporgnombre','oe.orgelelugar','oe.orgeletitulo','oeto.oreltofechahorainicio','oeto.oreltofechahoracierre',
                                DB::raw('(SELECT count(deleid) FROM delegado WHERE deleactivo = true ) AS totalDelegados'),
                                DB::raw('(SELECT count(orelprid)
                                                    FROM organoeleccionparticipanteproceso
                                                    WHERE tiporgid = to.tiporgid
                                                    AND orgeleid   = oe.orgeleid
                                        ) AS votosMarcados'),
                               DB::raw('(SELECT count(orelpvid)
                                                    FROM organoeleccionparticipantevoto 
                                                    INNER JOIN organoeleccionparticipante USING(orelpaid)
                                                    WHERE tiporgid = to.tiporgid
                                                    AND orgeleid   = oe.orgeleid
                                                    AND orelpaesvotoblanco = 1
                                        ) AS votosBlancos'))
                        ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid')
                        ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')
                        ->where('oeto.oreltoid', $request->codigo)
                        ->first();

            $jurados = DB::table('organoeleccionjurado as oej')
                                ->select('d.deledocumento as documento','oej.oreljuesjurado',
                                    DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                    DB::raw("if(oej.oreljuesjurado = 1,'Jurado', 'Testigo') as tipo"))
                                ->join('delegado as d', 'd.deleid', '=', 'oej.deleid') 
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oej.orgeleid')
                                ->where('oe.orgeleid', $tipoOrgano->orgeleid)
                                ->orderByDesc('oej.oreljuesjurado')
                                ->get();

            $acta = DB::table('acta')->where('actaid', 2)->first();

            $tipoEleccion          = mb_strtoupper($tipoOrgano->tiporgnombre,'UTF-8');
            $totalDelegadosHabiles = $tipoOrgano->totalDelegados;
            $totalVotosBlancos     = $tipoOrgano->votosBlancos;
            $totalVotosMarcados    = $tipoOrgano->votosMarcados;
            $totalVotosNoMarcados  = $totalDelegadosHabiles - $totalVotosMarcados;
            $totalVotos            = $totalVotosMarcados + ($totalDelegadosHabiles - $totalVotosMarcados);

            if($totalDelegadosHabiles < $totalVotosMarcados){
                $totalVotosMarcados   = $totalDelegadosHabiles;
                $totalVotosNoMarcados = 0;
            }

            $lugarEvento    = $tipoOrgano->orgelelugar;
            $tituloEleccion = $tipoOrgano->orgeletitulo;
            $buscar         = Array('tipoEleccion ','anio');
            $remplazo       = Array($tipoEleccion, date("Y"));
            $titlePdf       = str_replace( $buscar, $remplazo, $acta->actatitulo);
            $horaCierre     = General::formatearFechaHora($tipoOrgano->oreltofechahoracierre);
            $fechaEleccion  = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio, false);
            $tituloPdf      = 'Acta_escrutinio_'.str_replace(' ', '_',  mb_strtolower($tipoEleccion,'UTF-8'));
            $tituloPdf      = str_replace('ó', 'o', $tituloPdf);

            //Obtengo los jurados y testigos
            $nombreJurados = '';
            $nombreTestigos = '';
            foreach ($jurados as $jurado) { 
                if($jurado->oreljuesjurado){
                    $nombreJurados .= $jurado->nombreCompleto.', ' ;
                }else{
                    $nombreTestigos .= $jurado->nombreCompleto.', ' ;
                }
            }

            $nombreJurados  = substr($nombreJurados, 0, -2);
            $nombreTestigos = substr($nombreTestigos, 0, -2); 
            $buscar         = Array('horaCierre','lugarEvento','tipoEleccion','tituloEleccion','nombreJurados','nombreTestigos');
            $remplazo       = Array($horaCierre, $lugarEvento, $tipoEleccion, $tituloEleccion, $nombreJurados, $nombreTestigos);
            $contenido      = str_replace($buscar, $remplazo, $acta->actacontenido);

            $data = [
                'tipoEleccion'          => mb_strtoupper($tipoEleccion,'UTF-8'),
                'totalDelegadosHabiles' => $totalDelegadosHabiles,
                'totalVotosNoMarcados'  => $totalVotosNoMarcados,
                'totalVotosMarcados'    => $totalVotosMarcados,
                'totalVotosBlancos'     => $totalVotosBlancos,
                'fechaEleccion'         => $fechaEleccion,
                'totalVotos'            => $totalVotos,
                'contenido'             => $contenido,
                'tituloPdf'             => $tituloPdf,
                'jurados'               => $jurados,
            ];

            $dataPdf = GenerarPdf::actaEscrutinio($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de escrutinio ']);
		}
	}

    public function actaResultado(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $empresa   = Empresa::informacion();

            $tipoOrgano = DB::table('tipoorgano as to')
                                ->select('oeto.tiporgid','oeto.orgeleid', 'to.tiporgnombre','oe.orgelelugar', 'oe.orgeletitulo', 'oe.orgeleperiodo', 
                                    'oeto.oreltofechahorainicio','oeto.oreltofechahoracierre','to.tiporgtotalprincipales', 'to.tiporgtotalsuplente')
                                ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid') 
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')
                                ->where('oeto.oreltoid', $request->codigo)
                                ->first();

            $numeroRegistros = $tipoOrgano->tiporgtotalprincipales + $tipoOrgano->tiporgtotalsuplente;

            $participantes = DB::table('delegado as d') 
                                    ->select('d.deledocumento as documento','a.asocfechaexpedicion as fechaExpedicion', 'oep.orelpaesvotoblanco',
                                        DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                        DB::raw('(SELECT count(orelpvid)
                                                        FROM organoeleccionparticipantevoto 
                                                        WHERE orelpaid = oep.orelpaid
                                                ) AS totalVotos'))
                                    ->join('organoeleccionparticipante as oep', 'oep.deleid', '=', 'd.deleid')
                                    ->join('asociado as a', 'a.asocnumerodocumento', '=', 'd.deledocumento')
                                    ->where('oep.tiporgid', $tipoOrgano->tiporgid)
                                    ->where('oep.orgeleid', $tipoOrgano->orgeleid)
                                    ->where('oep.orelpaesvotoblanco', false)
                                    ->orderByDesc('totalVotos')
                                    ->orderBy('oep.orelpaordenparticipacion')
                                    ->take($numeroRegistros)
                                    ->get();

            $jurados = DB::table('organoeleccionjurado as oej')
                                ->select('d.deledocumento as documento','oej.oreljuesjurado',
                                    DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"),
                                    DB::raw("if(oej.oreljuesjurado = 1,'Jurado', 'Testigo') as tipo"))
                                ->join('delegado as d', 'd.deleid', '=', 'oej.deleid') 
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oej.orgeleid')  
                                ->where('oe.orgeleid', $tipoOrgano->orgeleid)
                                ->orderByDesc('oej.oreljuesjurado')
                                ->get();

            $acta = DB::table('acta')->select('actatitulo','actacontenido')->where('actaid', 3)->first(); 

            $totalPrincipal = $tipoOrgano->tiporgtotalprincipales;
            $totalSuplente  = $tipoOrgano->tiporgtotalsuplente;
            $lugarEvento    = $tipoOrgano->orgelelugar;
            $tipoEleccion   = $tipoOrgano->tiporgnombre;
            $tituloEleccion = $tipoOrgano->orgeletitulo;
            $periodo        = $tipoOrgano->orgeleperiodo;
            $buscar         = Array('tipoEleccion ','anio');
            $remplazo       = Array(mb_strtoupper($tipoEleccion,'UTF-8'), date("Y"));
            $titlePdf       = str_replace( $buscar, $remplazo, $acta->actatitulo);
            $horaCierre     = General::formatearFechaHora($tipoOrgano->oreltofechahoracierre);
            $fechaEleccion  = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio, false);
            $buscar         = Array('horaCierre','lugarEvento','tipoEleccion','tituloEleccion');
            $remplazo       = Array($horaCierre, $lugarEvento, $tipoEleccion, $tituloEleccion);
            $contenido      = str_replace($buscar, $remplazo, $acta->actacontenido);
            $tituloPdf      = 'Acta_resultado_'.str_replace(' ', '_',  mb_strtolower($tipoEleccion,'UTF-8'));
            $tituloPdf      = str_replace('ó', 'o', $tituloPdf);

            $data = [
                'tipoEleccion'   => mb_strtoupper($tipoEleccion,'UTF-8'),
                'totalPrincipal' => $totalPrincipal,
                'tituloEleccion' => $tituloEleccion,
                'participantes'  => $participantes,
                'totalSuplente'  => $totalSuplente,
                'fechaEleccion'  => $fechaEleccion,
                'contenido'      => $contenido,
                'tituloPdf'      => $tituloPdf,
                'periodo'        => $periodo,
                'jurados'        => $jurados,
            ];

            $dataPdf = GenerarPdf::actaResultado($data, $empresa, 'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de acta de resultados ']);
		}
	}
}