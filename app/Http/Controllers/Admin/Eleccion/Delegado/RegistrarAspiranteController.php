<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Models\Eleccion\Delegado\Aspirante;
use App\Http\Controllers\Controller;
use App\Util\ProcesadorImagen;
use Throwable, DB, Log, auth;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\General;
use App\Util\Empresa;

class RegistrarAspiranteController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('elecciondelegadoaspirante as eda')
                        ->select('eda.eldeasid','eda.eldeascorreo','eda.eldeastelefono','eda.eldeasfechahora','eda.eldeasactivo',
                            DB::raw("CONCAT(LPAD(eda.eldeasnumero,  2, 0)) as eldeasnumero"),
                            DB::raw("CONCAT(ti.tipidesigla,' - ', eda.eldeasdocumento ) as tipoIdentificacion"),
                            DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre ) as nombres"),
                            DB::raw("CONCAT_WS(' ', eda.eldeasprimerapellido, eda.eldeassegundoapellido) as apellidos"))
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
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de las actas']);
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
            'foto'               => 'nullable|mimes:png,jpg,PNG,JPG|max:2000'
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
                $file->move($rutaCarpeta, $nombreFotoBD);
                ProcesadorImagen::optimizarDimensiones($rutaCarpeta.'/'.$nombreFotoBD, 250, 170);
            }else{
                $nombreImagenBD = $eleccionDelegadoAspirante->eldeasimagen;
            }

            if($request->tipo === 'I'){
                $eleccionDelegado   = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first(); 
                $eleccionDelegadoId = $eleccionDelegado->eledelid;
                $tituloEleccion     = $eleccionDelegado->eledeltitulo.' '.$eleccionDelegado->eledelperiodo;
                $consecutivo        = Aspirante::obtenerConsecutivo($elecciondelegado->eledelid, auth()->user()->agenid);
                $eleccionDelegadoAspirante->eldeasnumero    = str_pad($consecutivo, 2, '0', STR_PAD_LEFT);
                $eleccionDelegadoAspirante->eledelid        = $eleccionDelegadoId;
                $eleccionDelegadoAspirante->agenid          = auth()->user()->agenid;
                $eleccionDelegadoAspirante->eldeasfechahora = Carbon::now();
            }

            $correoAspirante = $request->correo;
            $primerNombre    = mb_strtoupper($request->primerNombre,'UTF-8');
            $segundoNombre   = mb_strtoupper($request->primernombre,'UTF-8');
            $primerApellido  = mb_strtoupper($request->primernombre,'UTF-8');
            $segundoApellido = mb_strtoupper($request->primernombre,'UTF-8');
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
                $empresa           = Empresa::informacion();
                $emailEmpresa 	   = $empresa->emprcorreo;
				$nombreEmpresa     = $empresa->emprsigla;

                $eleccionDelegadoAgencia = DB::table('elecciondelegadoagencia as eda')
                                                ->select('eda.eldeaglugar', 'a.agennombre')
                                                ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                                ->join('agencia as a', 'a.agenid', '=', 'eda.agenid')
                                                ->where('eledelid', $eleccionDelegadoId)
                                                ->where('agenid', auth()->user()->agenid)
                                                ->first();

                $nombreAgencia     = $eleccionDelegadoAgencia->agennombre;
                $lugarVotacion     = $eleccionDelegadoAgencia->eldeaglugar;

				$informacionCorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificarRegistroAspiranteDelegado')->first();
                $buscar            = Array("nombreAsociado","numeroAsignado", "tituloEleccion", "nombreAgencia", "lugarVotacion");
                $remplazo          = Array($nombreAsociado, $consecutivo, $tituloEleccion, $nombreAgencia, $lugarVotacion);
				$asunto            = str_replace($buscar, $remplazo, $informacionCorreo->innocoasunto);
				$msg               = str_replace($buscar, $remplazo, $informacionCorreo->innococontenido);
				$enviarcopia       = $informacionCorreo->innocoenviarcopia;
				$enviarpiepagina   = $informacionCorreo->innocoenviarpiepagina;

                $data = [
                        'numeroInscripcion' => $consecutivo,
                        'tituloEleccion'    => $asunto,
                        'contenido'         => $msg,
                    ];

                $rutaPdf[]     = GenerarPdf::inscripcionDelegado($data, $empresa, 'S');
				$mensajeCorreo = ', se ha enviado notificación al correo '.Notificar::correo([$correoAspirante], $asunto, $msg, $rutaPdf, $emailEmpresa, $enviarcopia, $enviarpiepagina, $nombreEmpresa);
			}

            DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito '.$mensajeCorreo ]);
		} catch (Throwable $e){
            dd($e);
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
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