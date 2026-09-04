<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Models\Eleccion\Delegado\Aspirante;
use Throwable, DB, Log, Auth, URL, File;
use App\Http\Controllers\Controller;
use App\Util\ProcesadorImagen;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\Notificar;
use App\Util\General;
use App\Util\Empresa;
use Carbon\Carbon;

class RegistrarAspiranteController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('elecciondelegadoaspirante as eda')
                        ->select('eda.eldeasid','eda.eldeascorreo','eda.eldeastelefono','eda.eldeasfechahora','eda.eldeasactivo', 'eda.tipideid',
                            'eda.eldeasprimernombre', 'eda.eldeassegundonombre', 'eda.eldeasprimerapellido', 'eda.eldeassegundoapellido', 'eda.eldeasdocumento',
                            DB::raw("CONCAT(LPAD(eda.eldeasnumero,  2, 0)) as eldeasnumero"),
                            DB::raw("if(eda.eldeasactivo = 1,'Sí', 'No') as estado"),
                            DB::raw("CONCAT(ti.tipidesigla,' - ', eda.eldeasdocumento ) as tipoIdentificacion"),
                            DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre ) as nombres"),
                            DB::raw("CONCAT_WS(' ', eda.eldeasprimerapellido, eda.eldeassegundoapellido) as apellidos"),
                             DB::raw("CONCAT('".URL::to('/')."/archivos/images/aspirante/', eldeasimagen ) as rutaFoto"))
                        ->join('tipoidentificacion as ti', 'ti.tipideid', '=', 'eda.tipideid')
                        ->where('eda.agenid', auth()->user()->agenid)
                        ->whereIn('eda.eledelid', function($query) {
                                    $query->select('eledelid')->from('elecciondelegado')
                                            ->where('eledelanio', date('Y'));
                                    })
                        ->where('eda.eldeasesvotoblanco', false) 
                        ->orderByDesc('eda.eldeasnumero')
                        ->orderBy('nombres')->orderBy('apellidos')
                        ->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la lista de los aspirante a delegados']);
		}
	}

    public function datos(Request $request)
	{
		$request->validate(['codigo' => 'required','tipo' => 'required']);
		try{

			$tipoIdentificaciones = DB::table('tipoidentificacion')->select('tipideid','tipidenombre')->orderBy('tipidenombre')->get();

			return response()->json(['success' => true, 'tipoIdentificaciones' => $tipoIdentificaciones ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para la inscripción del aspirante']);
		}
	}

    public function salve(Request $request)
	{
	    $request->validate([
		    'codigo'             => 'required',
            'tipoIdentificacion' => 'required|numeric',
			'documento'          => 'required|string|min:6|max:15',
            'primerNombre'       => 'required|string|min:3|max:50',
            'segundoNombre'      => 'nullable|string|min:3|max:50',
            'primerApellido'     => 'required|string|min:3|max:50',
            'segundoApellido'    => 'nullable|string|min:3|max:50',
            'correo'             => 'required|string|email|max:80',
            'telefono'           => 'nullable|string|min:6|max:20',
            'estado'             => 'required',
            'foto'               => 'nullable|mimes:png,jpg,PNG,JPG|max:1000'
        ]);

        DB::beginTransaction();
		try {

			$id = $request->codigo;	
			$eleccionDelegadoAspirante = ($id != '000') ? Aspirante::findOrFail($id) : new Aspirante();

            if($request->hasFile('foto')){
                $rutaCarpeta    = public_path().'/archivos/images/aspirante/';
                $carpetaServe   = (is_dir($rutaCarpeta)) ? $rutaCarpeta : File::makeDirectory($rutaCarpeta, $mode = 0775, true, true);
                $file           = $request->file('foto');
                $nombreOriginal = $file->getclientOriginalName();
                $filename       = pathinfo($nombreOriginal, PATHINFO_FILENAME);
                $extension      = pathinfo($nombreOriginal, PATHINFO_EXTENSION);
                $nombreImagenBD = $request->documento.'_'.General::quitarCaracteres($filename).'.'.$extension;
                $file->move($rutaCarpeta, $nombreImagenBD);
                ProcesadorImagen::optimizarDimensiones($rutaCarpeta.'/'.$nombreImagenBD, 250, 180);
            }else{
                $nombreImagenBD = $eleccionDelegadoAspirante->eldeasimagen;
            }

            if($request->tipo === 'I'){
                $agenciaId          = auth()->user()->agenid;
                $eleccionDelegado   = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first(); 
                $eleccionDelegadoId = $eleccionDelegado->eledelid;
                $tituloEleccion     = $eleccionDelegado->eledeltitulo.' '.$eleccionDelegado->eledelperiodo;
                $consecutivo        = str_pad(Aspirante::obtenerConsecutivo($eleccionDelegadoId, $agenciaId), 2, '0', STR_PAD_LEFT);
                $eleccionDelegadoAspirante->eldeasnumero    = $consecutivo;
                $eleccionDelegadoAspirante->eledelid        = $eleccionDelegadoId;
                $eleccionDelegadoAspirante->agenid          = $agenciaId;
                $eleccionDelegadoAspirante->eldeasfechahora = Carbon::now();
            }

            $correoAspirante = $request->correo;
            $primerNombre    = mb_strtoupper($request->primerNombre,'UTF-8');
            $segundoNombre   = mb_strtoupper($request->segundoNombre,'UTF-8');
            $primerApellido  = mb_strtoupper($request->primerApellido,'UTF-8');
            $segundoApellido = mb_strtoupper($request->segundoApellido,'UTF-8');
            $nombreAsociado  = $primerNombre.' '.$segundoNombre.' '.$primerApellido.' '.$segundoApellido;

			$eleccionDelegadoAspirante->tipideid              = $request->tipoIdentificacion;
            $eleccionDelegadoAspirante->eldeasdocumento       = $request->documento;
            $eleccionDelegadoAspirante->eldeasprimernombre    = $primerNombre;
            $eleccionDelegadoAspirante->eldeassegundonombre   = $segundoNombre;
            $eleccionDelegadoAspirante->eldeasprimerapellido  = $primerApellido;
            $eleccionDelegadoAspirante->eldeassegundoapellido = $segundoApellido;
            $eleccionDelegadoAspirante->eldeascorreo          = $request->correo;
            $eleccionDelegadoAspirante->eldeastelefono        = $request->telefono;
            $eleccionDelegadoAspirante->eldeasimagen          = $nombreImagenBD;
            $eleccionDelegadoAspirante->eldeasactivo          = $request->estado;
			$eleccionDelegadoAspirante->save();

            $mensajeCorreo = '';
			if ($request->tipo === 'I'){
                $empresa       = Empresa::informacion();
                $emailEmpresa  = $empresa->emprcorreo;
                $siglaEmpresa  = $empresa->emprsigla;	

                $eleccionDelegadoAgencia = DB::table('elecciondelegadoagencia as eda')
                                                ->select('eda.eldeaglugar', 'a.agennombre')
                                                ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                                ->join('agencia as a', 'a.agenid', '=', 'eda.agenid')
                                                ->where('eda.eledelid', $eleccionDelegadoId)
                                                ->where('a.agenid', auth()->user()->agenid)
                                                ->first();

                $nombreAgencia     = $eleccionDelegadoAgencia->agennombre;
                $lugarVotacion     = $eleccionDelegadoAgencia->eldeaglugar;

				$informacionCorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificarRegistroAspiranteDelegado')->first();
                $buscar            = Array("nombreAsociado","numeroAsignado", "tituloEleccion", "nombreAgencia", "lugarVotacion", "nombreEmpresa");
                $remplazo          = Array($nombreAsociado, $consecutivo, $tituloEleccion, $nombreAgencia, $lugarVotacion, $siglaEmpresa);
				$asunto            = str_replace($buscar, $remplazo, $informacionCorreo->innocoasunto);
				$msg               = str_replace($buscar, $remplazo, $informacionCorreo->innococontenido);
				$enviarcopia       = $informacionCorreo->innocoenviarcopia;
				$enviarpiepagina   = $informacionCorreo->innocoenviarpiepagina;

                $data = [
                        'numeroInscripcion' => $consecutivo,
                        'tituloEleccion'    => $asunto,
                        'contenido'         => $msg,
                    ];

                $adjuntos       = [];
                $pdfBase64      = GenerarPdf::inscripcionDelegado($data, $empresa, 'S');
                $rutaTemporal   = sys_get_temp_dir() .DIRECTORY_SEPARATOR.'\Inscripcion_delegado_'.$consecutivo.'.pdf';
                file_put_contents($rutaTemporal, base64_decode($pdfBase64));
                $adjuntos[]     = $rutaTemporal;

				$mensajeCorreo = ', se ha enviado notificación al correo '.Notificar::correo([$correoAspirante], $asunto, $msg, $adjuntos, $emailEmpresa, $enviarcopia, $enviarpiepagina, $siglaEmpresa);
			}

            DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito '.$mensajeCorreo ]);
		} catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}

    public function showPdf(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $eleccionDelegado = DB::table('elecciondelegadoaspirante as eda')
                                ->select('eda.eldeasid', 'ed.eledeltitulo', 'ed.eledelperiodo','edg.eldeaglugar', 'a.agennombre',
                                    DB::raw("CONCAT(LPAD(eda.eldeasnumero,  2, 0)) as eldeasnumero"),
                                    DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre, eda.eldeasprimerapellido, eda.eldeassegundoapellido ) as nombreCompleto"))
                                ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                ->join('elecciondelegadoagencia as edg', 'edg.eledelid', '=', 'eda.eledelid')
                                ->join('agencia as a', 'a.agenid', '=', 'edg.agenid')
                                ->where('eda.eldeasid', $request->codigo)
                                ->first();

            $empresa           = Empresa::informacion();
            $emailEmpresa      = $empresa->emprcorreo;
            $nombreEmpresa     = $empresa->emprnombre;
            $siglaEmpresa      = $empresa->emprsigla;
            $tituloEleccion    = $eleccionDelegado->eledeltitulo.' '.$eleccionDelegado->eledelperiodo;
            $nombreAgencia     = $eleccionDelegado->agennombre;
            $lugarVotacion     = $eleccionDelegado->eldeaglugar;
            $nombreAsociado    = $eleccionDelegado->nombreCompleto;
            $consecutivo       = $eleccionDelegado->eldeasnumero;

            $informacionCorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificarRegistroAspiranteDelegado')->first();
            $buscar            = Array("nombreAsociado","numeroAsignado", "tituloEleccion", "nombreAgencia", "lugarVotacion", "nombreEmpresa");
            $remplazo          = Array($nombreAsociado, $consecutivo, $tituloEleccion, $nombreAgencia, $lugarVotacion, $siglaEmpresa);
            $asunto            = str_replace($buscar, $remplazo, $informacionCorreo->innocoasunto);
            $msg               = str_replace($buscar, $remplazo, $informacionCorreo->innococontenido);
            $enviarcopia       = $informacionCorreo->innocoenviarcopia;
            $enviarpiepagina   = $informacionCorreo->innocoenviarpiepagina;

            $data = [
                    'numeroInscripcion' => $consecutivo,
                    'tituloEleccion'    => $asunto,
                    'contenido'         => $msg,
                ];

            $dataPdf = GenerarPdf::inscripcionDelegado($data, $empresa, 'S');    

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF ']);
		}
	}

    public function imprimirLista(Request $request)
	{
        try {

            $empresa = Empresa::informacion();

            $eleccionDelegado = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first();
            if (!$eleccionDelegado) {
                return null;
            }
            $titulo  = $eleccionDelegado->eledeltitulo;
            $periodo = $eleccionDelegado->eledelperiodo;

            $agencias = DB::table('agencia')->select('agenid', 'agennombre')->orderBy('agennombre')->get();

            foreach ($agencias as $agencia) {
                $agencia->aspirantes = DB::table('elecciondelegadoaspirante as eda')
                                    ->select(
                                        DB::raw("LPAD(eda.eldeasnumero, 2, '0') as eldeasnumero"),
                                        DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre, eda.eldeasprimerapellido, eda.eldeassegundoapellido ) as nombreCompleto") )
                                    ->where('eda.agenid', $agencia->agenid)
                                    ->where('eda.eledelid', $eleccionDelegado->eledelid)
                                    ->where('eda.eldeasactivo', true)
                                    ->where('eda.eldeasesvotoblanco', false)
                                    ->orderBy('eda.eldeasnumero')
                                    ->get();
            }

            $data = [
                    'tituloEleccion' => 'Aspirantes a '.mb_strtolower($titulo,'UTF-8').' '.mb_strtolower($periodo,'UTF-8'),
                    'agencias'       => $agencias
                ];

            $dataPdf = GenerarPdf::listaDelegado($data, $empresa, 'S');    

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF ']);
		}

    }

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);

        $eleccionDelegadoVoto = DB::table('elecciondelegadovoto')->select('eledelid')->where('eledelid', $request->codigo)->first();
        if($eleccionDelegadoVoto){
            return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con un voto de la elección de delegado ']);
        }else{
            try {
                $eleccionDelegadoAspirante = Aspirante::findOrFail($request->codigo);
                $eleccionDelegadoAspirante->delete();
                return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
            } catch (Throwable $e){
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del delegado ']);
            }
        }
	}
}