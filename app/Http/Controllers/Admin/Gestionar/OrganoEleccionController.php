<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Models\Gestionar\OrganoEleccionTipoOrgano;
use App\Models\Gestionar\OrganoEleccion;
use App\Http\Controllers\Controller;
use Throwable, Auth, DB, Log;
use Illuminate\Http\Request;

class OrganoEleccionController extends Controller
{
    public function index(Request $request)
	{ 
		try{
			$data = DB::table('organoeleccion')
						->select('orgeleid','orgeleanio','orgeletitulo','orgelelugar','orgeleperiodo', 'orgeleactivo',
						 DB::raw("if(orgeleactivo = 1,'Sí', 'No') as estado"))
						->orderByDesc('orgeleanio')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los órganos de elección ']);
		}
	}

	public function datos(Request $request)
	{
		$request->validate(['codigo' => 'required','tipo' => 'required']);
		try{
	
			$tipoOrganos = DB::table('tipoorgano')->select('tiporgid','tiporgnombre')->where('tiporgactivo','1')->orderBy('tiporgnombre')->get();
			$tipoOrganosElecciones  = [];
			if($request->tipo === 'U'){
				$tipoOrganosElecciones = DB::table('organoelecciontipoorgano as oeto')->select('oeto.oreltoid','to.tiporgnombre', 'oeto.tiporgid')
										->join('tipoorgano as to', 'to.tiporgid', '=', 'oeto.tiporgid')
										->where('oeto.orgeleid', $request->codigo)->get();
			}

			return response()->json(['success' => true, 'tipoOrganos' => $tipoOrganos, 'tipoOrganosElecciones' => $tipoOrganosElecciones ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para la gestión del usuario']);
		}
	}

	public function salve(Request $request)
	{
        $request->validate([
            'titulo'       => 'required|string|min:10|max:150',
			'lugar'        => 'required|string|min:10|max:100',
			'periodo'      => 'required|max:20',
			'estado'       => 'required',
			'tiposOrganos' => 'required|array|min:1'
        ]); 

		DB::beginTransaction();
		try {

		    $anio           = date('Y');
            $id             = $request->codigo;	
			$organoEleccion = ($id != '000') ? OrganoEleccion::findOrFail($id) : new OrganoEleccion();

			if ($id == '000' && OrganoEleccion::where('orgeleanio', $anio)->exists()) {
				return response()->json(['success' => false,'message' => "Ya existe un órgano de elección registrado para el año {$anio}."], 422);
			}

			$organoEleccion->orgeleanio    = $anio;
            $organoEleccion->orgeletitulo  = $request->titulo;
            $organoEleccion->orgelelugar   = $request->lugar;
            $organoEleccion->orgeleperiodo = $request->periodo;
            $organoEleccion->orgeleactivo  = $request->estado;
			$organoEleccion->save();

			foreach($request->tiposOrganos as $dataTipoOrgano){
				$identificador    = $dataTipoOrgano['identificador'];
				$tipoOrganoId     = $dataTipoOrgano['tipoOrgano'];
				$tipoOrganoEstado = $dataTipoOrgano['estado'];
				if($tipoOrganoEstado === 'I'){
					$organoEleccionTipoOrgano           = new OrganoEleccionTipoOrgano();
					$organoEleccionTipoOrgano->tiporgid = $tipoOrganoId;
					$organoEleccionTipoOrgano->orgeleid = $organoEleccion->orgeleid;
					$organoEleccionTipoOrgano->save();
				}else if($tipoOrganoEstado === 'D'){
					$organoEleccionTipoOrgano = OrganoEleccionTipoOrgano::findOrFail($identificador);
					$organoEleccionTipoOrgano->delete();
				}else{//Omitir
				}
			}

		 	DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito' ]);
		} catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de los órganos de elección']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);
        $organoEleccionParticipanteProceso = DB::table('organoeleccionparticipanteproceso')->select('orgeleid')->where('orgeleid', $request->codigo)->first();
		if($organoEleccionParticipanteProceso){
			return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con un participante para el proceso órgano de elección']);
		}else{
            try {
                $organoEleccion = OrganoEleccion::findOrFail($request->codigo);
                $organoEleccion->delete();
                return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
            } catch (Throwable $e){
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro del acta ']);
            }
        }
	}
}