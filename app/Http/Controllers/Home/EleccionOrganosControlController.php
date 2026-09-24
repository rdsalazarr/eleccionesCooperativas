<?php

namespace App\Http\Controllers\Home;

use App\Models\Eleccion\Organos\ParticipanteProceso;
use App\Models\Eleccion\Organos\ParticipanteVoto;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log, URL;
use Carbon\Carbon;

class EleccionOrganosControlController extends Controller
{
    public function index(Request $request)
	{
		try{
			$tiposOrganos     = DB::table('tipoorgano')->select('tiporgid','tiporgnombre')->orderBy('tiporgid')->get();
            $organoEleccion = DB::table('organoeleccion')->select('orgeleperiodo')//->where('orgeleactivo', true)
                                                            ->first();
            $periodo = ($organoEleccion) ? $organoEleccion->orgeleperiodo : '';


			return response()->json(['success' => true, "tiposOrganos" => $tiposOrganos, "periodo" => $periodo]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los tipos de organos']);
		}
	}

    public function consultar(Request $request)
	{
		$request->validate(['token'           => 'required',
                            'numeroDocumento' => 'required|min:6|max:15'
                         ]);
		try{

			$delegado = DB::table('delegado as d')
                            ->select('d.deleid','d.deledocumento',
                                DB::raw("CASE 
                                            WHEN eda.eldeasimagen IS NOT NULL AND eda.eldeasimagen <> ''
                                            THEN CONCAT('" . URL::to('/') . "/archivos/images/aspirante/', eda.eldeasimagen)
                                            ELSE NULL
                                        END AS rutaFoto"),
                                DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido ) as nombreCompleto"))	
                            ->join('elecciondelegadoaspirante as eda', 'eda.eldeasdocumento', '=', 'd.deledocumento')
                            ->where('d.deledocumento', $request->numeroDocumento)
                            ->where('d.deleactivo', true)
                            ->first();
            if(!$delegado){
                return response()->json(['success' => false, 'message' =>'El delegado no existe o no se encuentra habilitado para realizar este proceso']);
            }

            $token = DB::table('token')->select('tokeid')->where('toketoken', $request->token)->first();
            if(!$token){
                return response()->json(['success' => false, 'message' =>'El token ingresado no existe en nuestra base de datos']);
            }

            $tipoOrgano = DB::table('tipoorgano as to')
							->select('ete.orgeleid','to.tiporgid','to.tiporgnombre','to.tiporgvotosporpersona')
							->join('organoelecciontipoorgano as ete', 'ete.tiporgid', '=', 'to.tiporgid')
							->whereIn('ete.orgeleid', function($query){
									$query->select('orgeleid')->from('organoeleccion')
										->where('orgeleactivo', true);
									})
							->where('to.tiporgactivo', true)
							->where('ete.oreltofechahorainicio', '!=', null)
							->where('ete.oreltofechahoracierre', null)
							->first();
            if(!$tipoOrgano){
                return response()->json(['success' => false, 'message' =>'No existe ningún tipo de órgano disponible para realizar este proceso']);
            }

            $tipoOrganoToken = DB::table('organoeleccionparticipanteproceso')
                                        ->select('orelprtoken')
                                        ->where('orelprtoken', $request->token)
                                        ->where('tiporgid', $tipoOrgano->tiporgid)
                                        ->where('orgeleid', $tipoOrgano->orgeleid)
                                        ->first();
            if($tipoOrganoToken){
                return response()->json(['success' => false, 'message' =>'Usted ya realizó el proceso para este tipo de órgano']);
            }

            $aspirantes = DB::table('delegado as d')
								->select('d.deleid', 'd.deledocumento', 'oep.orelpaid',
                                    DB::raw("CASE 
                                            WHEN eda.eldeasimagen IS NOT NULL AND eda.eldeasimagen <> ''
                                            THEN CONCAT('" . URL::to('/') . "/archivos/images/aspirante/', eda.eldeasimagen)
                                            ELSE NULL
                                        END AS rutaFoto"),
                                    DB::raw("CONCAT(LPAD(oep.orelpaordenparticipacion,  2, 0)) as orelpaordenparticipacion"),
									DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido ) as nombreCompleto"))
                                ->join('organoeleccionparticipante as oep', 'oep.deleid', '=', 'd.deleid')
                                ->join('elecciondelegadoaspirante as eda', 'eda.eldeasdocumento', '=', 'd.deledocumento')
								->where('oep.tiporgid', $tipoOrgano->tiporgid)
                                ->where('oep.orgeleid', $tipoOrgano->orgeleid)
								->orderBy('oep.orelpaordenparticipacion')
								->get();

            $idVotoBlanco = DB::table('organoeleccionparticipante')
                                        ->where('orelpaesvotoblanco', true)
                                        ->where('tiporgid', $tipoOrgano->tiporgid)
                                        ->where('orgeleid', $tipoOrgano->orgeleid)
                                        ->value('orelpaid');

            return response()->json(['success' => true, 'delegado' => $delegado, 'aspirantes' => $aspirantes, 'tipoOrgano' => $tipoOrgano, 'idVotoBlanco' => $idVotoBlanco]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del delegado para las elecciones de órganos']);
		}
	}

    public function registrar(Request $request)
	{
		$request->validate(['token' => 'required', 'candidatos' => 'required|array|min:1']);

        DB::beginTransaction();
        try {

            $tipoOrgano = DB::table('tipoorgano as to')
                                ->select('ete.orgeleid','to.tiporgid','to.tiporgnombre','to.tiporgvotosporpersona')
                                ->join('organoelecciontipoorgano as ete', 'ete.tiporgid', '=', 'to.tiporgid')
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'ete.orgeleid')
                                ->where('to.tiporgactivo', true)
                                ->where('oe.orgeleactivo', true)
                                ->whereNotNull('ete.oreltofechahorainicio')
                                ->whereNull('ete.oreltofechahoracierre')
                                ->first();
            if(!$tipoOrgano){
                return response()->json(['success' => false, 'message' =>'No existe ningún tipo de órgano disponible para realizar este proceso']);
            }

            $tipoOrganoToken = DB::table('organoeleccionparticipanteproceso')
                                        ->select('orelprtoken')
                                        ->where('orelprtoken', $request->token)
                                        ->where('tiporgid', $tipoOrgano->tiporgid)
                                        ->where('orgeleid', $tipoOrgano->orgeleid)
                                        ->first();
            if($tipoOrganoToken){
                return response()->json(['success' => false, 'message' =>'Usted ya realizó el proceso para este tipo de órgano']);
            }

            $eleccionParticipanteProceso              = new ParticipanteProceso();
			$eleccionParticipanteProceso->tiporgid    = $tipoOrgano->tiporgid;
			$eleccionParticipanteProceso->orgeleid    = $tipoOrgano->orgeleid;
			$eleccionParticipanteProceso->orelprtoken = $request->token;
			$eleccionParticipanteProceso->save();

			foreach($request->candidatos as $orelpaid) {
                $eleccionParticipanteVoto              = new ParticipanteVoto();
                $eleccionParticipanteVoto->orelpaid    = $orelpaid;
                $eleccionParticipanteVoto->orelpvfecha = Carbon::now();
                $eleccionParticipanteVoto->save();
			}

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito']);
        }catch(Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de la votación del órgano seleccionado ']);
		}
	}
}