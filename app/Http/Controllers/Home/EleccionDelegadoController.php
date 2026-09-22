<?php

namespace App\Http\Controllers\Home;

use Illuminate\Contracts\Encryption\DecryptException;
use App\Services\VotacionDelegadoService;
use App\Models\Eleccion\Delegado\Proceso;
use App\Models\Eleccion\Delegado\Voto;
use Illuminate\Support\Facades\Crypt;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log, URL;
use App\Util\GenerarPdf;
use App\Util\Empresa;
use Carbon\Carbon;

class EleccionDelegadoController extends Controller
{
    public function index(Request $request)
	{
		try{
			$tiposIdentificaciones = DB::table('tipoidentificacion')->select('tipideid','tipidenombre')->orderBy('tipidenombre')->get();
            $eleccionDelegado      = DB::table('elecciondelegado')->select('eledeltitulo','eledelperiodo')->where('eledelanio', date('Y'))->first();	

			return response()->json(['success' => true, "tiposIdentificaciones" => $tiposIdentificaciones, "eleccionDelegado" => $eleccionDelegado]);
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

                $eleccionDelegado = DB::table('elecciondelegado')
                                        ->select('eledelid','eledeltitulo','eledelperiodo','eledelcerrareleccion')
                                        ->where('eledelanio', date('Y'))
                                        ->first();	

                if($eleccionDelegado->eledelcerrareleccion){
                    return response()->json(['success' => false, 'message' =>  'Las elecciones de delegado ya fueron cerradas']);
                }

                $eleccionDelegadoProceso = DB::table('elecciondelegadoproceso')->select('asocid', DB::raw("CONCAT(eldeprfecha, ' a las ', eldeprhora) as fechaHora"))
											->where('eledelid', $eleccionDelegado->eledelid)
											->where('asocid', $asociado->asocid)
											->first();

                if($eleccionDelegadoProceso){
                    $fechaHora = $eleccionDelegadoProceso->fechaHora;
                    return response()->json(['success' => false, 'message' => 'Usted ya realizó el proceso de votación el '.$fechaHora]);
                }

                $aspirantes = DB::table('elecciondelegadoaspirante')
                                        ->select('eldeasid','eldeasimagen','eldeasdocumento',
                                            DB::raw("CONCAT(LPAD(eldeasnumero,  2, 0)) as eldeasnumero"),
                                            DB::raw("CONCAT('".URL::to('/')."/archivos/images/aspirante/', eldeasimagen ) as rutaFoto"),
                                            DB::raw("CONCAT_WS(' ', eldeasprimernombre, eldeassegundonombre, eldeasprimerapellido, eldeassegundoapellido ) as nombreCompleto"))
                                        ->where('agenid', $asociado->agenid)
                                        ->where('eldeasesvotoblanco', false)
                                        ->where('eldeasactivo', true)
                                        ->orderBy('eldeasnumero')
                                        ->get();

                $asociadoId   = Crypt::encrypt($asociado->asocid);
                $eleccionId   = Crypt::encrypt($eleccionDelegado->eledelid);
                $idVotoBlanco = $asociado->agenid; //Se ha registrado el aspirante igual al idendificador de la agencia

                return response()->json(['success' => true, 'asociado' => $asociado, 'aspirantes' => $aspirantes, 'asociadoId' => $asociadoId, 'eleccionId' => $eleccionId, 'idVotoBlanco' => $idVotoBlanco ]);
            }else{
                return response()->json(['success' => false, 'message' =>  'Los datos ingresados no corresponden a un asociado apto para realizar dicho proceso, por favor comunique con la oficina']);
            }
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del asociado para las elecciones de delegado']);
		}
	}

    public function registrar(Request $request)
	{
		$request->validate(['asociadoId' => 'required',
                            'candidato'  => 'required',
                            'eleccionId' => 'required'
                        ]);

		try {
	    	$eleccionId = Crypt::decrypt($request->eleccionId); 
			$asociadoId	= Crypt::decrypt($request->asociadoId);
		} catch (DecryptException $e) {
            return response()->json(['success' => false, 'message' => 'Ocurrio un error interno al tratar de obtener la información']);
		}

		$eleccionDelegadoProceso = DB::table('elecciondelegadoproceso')->select('asocid', DB::raw("CONCAT(eldeprfecha, ' ', eldeprhora) as fechaHora"))
										->where('eledelid', $eleccionId)
										->where('asocid', $asociadoId)
										->first();

		if($eleccionDelegadoProceso){
			$fechaHora = $eleccionDelegadoProceso->fechaHora;
			return response()->json(['success' => false, 'message' => 'Usted ya realizo el proceso de votación a las '.$fechaHora]);
		}

		$eleccionDelegado = DB::table('elecciondelegado')
									->select('eledelid','eledelcerrareleccion')
									->where('eledelanio', date('Y'))->first();

		if($eleccionDelegado->eledelcerrareleccion){
			return response()->json(['success' => false, 'message' =>  'Las elecciones de delegado ya fueron cerradas']);
		}

		$aspirante = DB::table('elecciondelegadoaspirante')
                        ->select('eldeasid','eldeasimagen',
                            DB::raw("CONCAT(LPAD(eldeasnumero,  2, 0)) as eldeasnumero"),
                            DB::raw("CONCAT('".URL::to('/')."/archivos/images/aspirante/', eldeasimagen ) as rutaFoto"),
                            DB::raw("CONCAT_WS(' ', eldeasprimernombre, eldeassegundonombre, eldeasprimerapellido, eldeassegundoapellido ) as nombreCompleto"))
                        ->where('eldeasid', $request->candidato)->first();	

		DB::beginTransaction();
        try {
			$fechaHoraActual = Carbon::now();
		    $fechaActual     = $fechaHoraActual->format('Y-m-d');
			$horaActual      = $fechaHoraActual->format('h:m:s');

			$eleccionDelegadoProceso              = new Proceso();
			$eleccionDelegadoProceso->eledelid    = $eleccionDelegado->eledelid;
			$eleccionDelegadoProceso->asocid      = $asociadoId;
			$eleccionDelegadoProceso->eldeprfecha = $fechaActual;
			$eleccionDelegadoProceso->eldeprhora  = $horaActual;
			$eleccionDelegadoProceso->save();

			$eleccionDelegadoVoto           = new Voto();
			$eleccionDelegadoVoto->eledelid = $eleccionDelegado->eledelid;
			$eleccionDelegadoVoto->eldeasid = $request->candidato;
			$eleccionDelegadoVoto->save();

			DB::commit();
            return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito', 'aspirante' => $aspirante]);
        }catch(Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de la votación de delegados ']);
		}
	}

	public function resultados(Request $request, VotacionDelegadoService $service)
	{
		try {

			$data = $service->resultadosPublicosEleccionDelegados();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los resultado de la elección de delegados']);
		}
	}

	public function imprimir(Request $request, VotacionDelegadoService $service)
	{
		try {
		    $empresa = Empresa::informacion();
            $data    = $service->resultadosEleccionDelegados();
            $dataPdf = GenerarPdf::resultadosEleccionDelegados($data, $empresa);
   
			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de los resultados ']);
		}
	}
}