<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Eleccion\Organos\Participante;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use Throwable, DB, Log;
use App\Util\Empresa;
use Carbon\Carbon;

class RegistrarAspiranteController extends Controller
{
    public function index()
	{
        try{

            $data = DB::table('organoelecciontipoorgano as oeto')
                            ->select('oeto.orgeleid','oeto.tiporgid', 'to.tiporgnombre', 'oe.orgeletitulo')
                            ->join('tipoorgano as to', 'to.tiporgid', '=', 'oeto.tiporgid')
                            ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')
                            ->where('oe.orgeleactivo', true)
                            ->get();

			return response()->json(['success' => true, 'data' => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los organos de control activos']);
		}
	}

    public function datos(Request $request)
	{
        $request->validate([
            'tipoOrgano'     => 'required|numeric', 
            'organoEleccion' => 'required|numeric'
        ]);

        try{

		    $delegados = DB::table('delegado')
                                ->select('deleid','deledocumento',
                                    DB::raw("CONCAT_WS(' ', deleprimernombre, delesegundonombre, deleprimerapellido, delesegundoapellido) as nombreCompleto"))
                                ->where('deleactivo', true)
                                ->where('deleid', '<>', 1)
                                ->get();

            $delegadosParticipantes = DB::table('organoeleccionparticipante as oep')
                                            ->select('oep.orelpaid','oep.deleid','oep.orelpaordenparticipacion', 'd.deledocumento',
                                                    DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre, d.deleprimerapellido, d.delesegundoapellido) as nombreCompleto"))
                                            ->join('delegado as d', 'd.deleid', '=', 'oep.deleid')
                                            ->where('oep.tiporgid', $request->tipoOrgano)
                                            ->where('oep.orgeleid', $request->organoEleccion)
                                            ->orderBy('oep.orelpaordenparticipacion')
                                            ->get();

			return response()->json(['success' => true, 'delegados' => $delegados, 'delegadosParticipantes' => $delegadosParticipantes]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de la asignación de delegados al órgano de control']);
		}
	}

    public function salve(Request $request)
	{
        $request->validate([
            'tipoOrgano'     => 'required|numeric', 
            'organoEleccion' => 'required|numeric',
            'delegadosParticipantes' => 'required|array|min:1'
        ]);

         DB::beginTransaction();
		try {

            foreach($request->delegadosParticipantes as $dataParticipante){

                $identificador = $dataParticipante['identificador'];
                $delegadoId    = $dataParticipante['delegadoId'];
                $orden         = $dataParticipante['orden'];
                $estadoActual  = $dataParticipante['estado'];

                if($estadoActual == 'D'){//Elimina
                    Participante::findOrFail($identificador)->delete();
                }elseif($estadoActual == 'I'){
                    $participante                           = new Participante();
                    $participante->tiporgid                 = $request->tipoOrgano;
                    $participante->orgeleid                 = $request->organoEleccion;
                    $participante->deleid                   = $delegadoId;
                    $participante->orelpaordenparticipacion = $orden;
                    $participante->save();
                }if($estadoActual == 'U'){
                    $participante                           = Participante::findOrFail($identificador);
                    $participante->deleid                   = $delegadoId;
                    $participante->orelpaordenparticipacion = $orden;
                    $participante->save();
                }
            }

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		}catch(Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de los participantes para el tipo de órgano']);
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
}