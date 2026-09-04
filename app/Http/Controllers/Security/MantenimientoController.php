<?php

namespace App\Http\Controllers\Security;

use DB, PDF, Auth, URL, Artisan, TCPDF;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\FileManager;
use App\Util\GenerarPdf;
use App\Util\Generales;
use App\Util\Notificar;
use App\Util\Empresa;
use Carbon\Carbon;

class MantenimientoController extends Controller
{   
    public function clear()
    {
        Artisan::call('view:clear');
        Artisan::call('config:clear');
        Artisan::call('cache:clear');
        Artisan::call('route:clear');
        Artisan::call('view:cache'); 
        Artisan::call('config:cache');
       // Artisan::call('route:cache');
        //Artisan::call('event:cache');
       // Artisan::call('optimize');    
        return "Datos eliminados";
    } 

    public function down()
    {
        Artisan::call('down --secret="DEMOSIGEDAC2026"');
        return response()->view('errors.503',['title' =>'Creando modo mantenimiento']);
    }

    public function up()
    {   
        Artisan::call('up');
        return response()->view('errors.upMantenimiento',['title' =>'Subiendo el modo mantenimiento']);
    }

    public function email(){
        $fechaHoraActual    = Carbon::now();
        $email             = 'rdsalazarr@ufpso.edu.co';
        $nombreUsuario     = 'RAMON DAVID SALAZAR RINCON';
        $siglaEmpresa      = 'IMPLESOFT';
        $nombreEmpresa     = "IMPLESOFT S.A.S.";  
        $usuarioSistema    = "RSALAZR";
        $contrasenaSistema = '123456789'; 
        $urlSistema        =  URL::to('/');
        $emailEmpresa      = '';
        $nombreGerente     = 'PEDRO HERNANDEZ'; 
        /*$informacioncorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificarRegistroUsuario')->first();
        $buscar            = Array('nombreUsuario','siglaEmpresa','nombreEmpresa','usuarioSistema', 'contrasenaSistema','urlSistema','nombreGerente');
        $remplazo          = Array($nombreUsuario, $siglaEmpresa, $nombreEmpresa, $usuarioSistema, $contrasenaSistema, $urlSistema, $nombreGerente);*/

        $numeroDocumental = 'DOC-2024-0001';
        $nombreJefe       = 'JUAN PEREZ';
        $tipoclasificaciondocumental   = 'CONTRATO DE PRESTACION DE SERVICIOS';
        $fechaDocumento   = '2024-06-15'; 

        $informacioncorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificacionEnvioVerificacionDocumento')->first();
        $buscar            = Array('numeroDocumental','nombreJefe',' tipoclasificaciondocumental','fechaDocumento', 'nombreUsuario','nombreEmpresa','nombreDependencia','tokenAcceso');
        $remplazo          = Array($numeroDocumental, $nombreJefe, $tipoclasificaciondocumental, $fechaDocumento, $nombreGerente, $nombreEmpresa, 'desarrollo','abc4875');


        $asunto          = str_replace($buscar,$remplazo,$informacioncorreo->innocoasunto);
        $msg             = str_replace($buscar,$remplazo,$informacioncorreo->innococontenido); 
        $enviarcopia     = $informacioncorreo->innocoenviarcopia;
        $enviarpiepagina = $informacioncorreo->innocoenviarpiepagina;
        $enviarcopia     = 0;
        $enviarpiepagina = 1;

        $mensajeCorreo = ', '.Notificar::correo([$email], $asunto, $msg, [], $emailEmpresa, $enviarcopia, $enviarpiepagina, 'IMPLESOFT S.A.S.');

        dd($mensajeCorreo);
    }
   
    public function Pdf()
    { 
        $empresa       = Empresa::informacion();
        $emailEmpresa  = $empresa->emprcorreo;
        $nombreEmpresa = $empresa->emprnombre;
        $siglaEmpresa  = $empresa->emprsigla;

       /* $eleccionDelegado = DB::table('elecciondelegadoaspirante as eda')
                            ->select('eda.eldeasid', 'ed.eledeltitulo', 'ed.eledelperiodo','edg.eldeaglugar', 'a.agennombre',
                                DB::raw("CONCAT(LPAD(eda.eldeasnumero,  2, 0)) as eldeasnumero"),
                                DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre, eda.eldeasprimerapellido, eda.eldeassegundoapellido ) as nombreCompleto"))
                            ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                            ->join('elecciondelegadoagencia as edg', 'edg.eledelid', '=', 'eda.eledelid')
                            ->join('agencia as a', 'a.agenid', '=', 'edg.agenid')
                            ->where('eda.eldeasid', 7)
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

        GenerarPdf::inscripcionDelegado($data, $empresa, 'I'); */
        
        

        /*$eleccionDelegado = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }
        $titulo  = $eleccionDelegado->eledeltitulo;
        $periodo = $eleccionDelegado->eledelperiodo;

        $agencias = DB::table('agencia as a')->select('a.agenid', 'a.agennombre')->orderBy('a.agennombre')->get();

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

        GenerarPdf::listaDelegado($data, $empresa, 'I'); */

/*
        $eleccionDelegado = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }
        $eledelid        = $eleccionDelegado->eledelid;
        $titulo         = $eleccionDelegado->eledeltitulo;
        $periodo        = $eleccionDelegado->eledelperiodo;
        $tituloEleccion = mb_strtolower($titulo,'UTF-8').' '.$periodo; 

        $agencias = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                            ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                            ->where('eda.eledelid', $eledelid)
                            ->orderBy('a.agennombre')->get();

        foreach ($agencias as $agencia) {
            $idActa    = ($agencia->agenid == 1) ? 4 : 5;
            $acta      =  DB::table('acta')->where('actaid', $idActa)->first(); 
            $titulo    = 'No hay acta gestionada para esta agencia';
            $contenido = 'No hay contenido gestionado para el acta de esta agencia';
            if($acta){
                $titulo    =  $acta->actatitulo;
                $contenido =  $acta->actacontenido;
            }

            $agencia->titulo    = $titulo;
            $agencia->contenido = $contenido;
            $agencia->jurados   = DB::table('elecciondelegadoagenciajurado')
                                    ->select('eldeajdocumento', 'eldeajnombre', 'eldeajcargo')
                                    ->where('eldeagid', $agencia->eldeagid)->get();
        }

        $data = [
                'tituloEleccion' => $tituloEleccion,
                'agencias'       => $agencias
            ];

        GenerarPdf::actaInicio($data, $empresa, 'I'); */


        /*$eleccionDelegado = DB::table('elecciondelegado')->select('eledelid', 'eledeltitulo', 'eledelperiodo')->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }
        $eledelid        = $eleccionDelegado->eledelid;
        $titulo         = $eleccionDelegado->eledeltitulo;
        $periodo        = $eleccionDelegado->eledelperiodo;
        $tituloEleccion = mb_strtolower($titulo,'UTF-8').' '.$periodo; 

        $agencias = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                            ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                            ->where('eda.eledelid', $eledelid)
                            ->orderBy('a.agennombre')->get();

        foreach ($agencias as $agencia) {
            $idActa    = ($agencia->agenid == 1) ? 6 : 7;
            $acta      =  DB::table('acta')->where('actaid', $idActa)->first(); 
            $titulo    = 'No hay acta gestionada para esta agencia';
            $contenido = 'No hay contenido gestionado para el acta de esta agencia';
            if($acta){
                $titulo    =  $acta->actatitulo;
                $contenido =  $acta->actacontenido;
            }

            $agencia->titulo     = $titulo;
            $agencia->contenido  = $contenido;
            $agencia->aspirantes = DB::table('elecciondelegadoaspirante as eda')
                                    ->select('edag.eldeagnumerodeleprincipal','edag.eldeagnumerodelesuplente',
                                        DB::raw("CONCAT(ti.tipidesigla,' - ', eda.eldeasdocumento ) as tipoIdentificacion"),
                                        DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre, eda.eldeasprimerapellido, eda.eldeassegundoapellido ) as nombreCompleto"),
                                        DB::raw('(SELECT count(eldevoid) as voto 
                                                    FROM elecciondelegadovoto 
                                                    WHERE eledelid = ed.eledelid and eldeasid = eda.eldeasid
                                                    ) AS totalVotos')
                                                )
                                        ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                        ->join('tipoidentificacion as ti', 'ti.tipideid', '=', 'eda.tipideid')
                                        ->join('elecciondelegadoagencia as edag', function($join)
                                        {
                                            $join->on('edag.agenid',  '=', 'eda.agenid');
                                            $join->on('edag.eledelid', '=', 'eda.eledelid'); 
                                        })
                                        ->where('eda.agenid', $agencia->agenid)
                                        ->where('eda.eledelid', $eledelid)
                                        ->where('eda.eldeasactivo', true)
                                        ->where('eda.eldeasesvotoblanco', false)
                                        ->where('ed.eledelcerrareleccion', true)
                                        ->orderByDesc('totalVotos')
                                        ->orderBy('eda.eldeasnumero')
                                        ->get();

            $agencia->totalVotosBlanco = DB::table('elecciondelegadoaspirante as eda')
                                        ->select(DB::raw('(SELECT count(eldevoid) as voto 
                                                    FROM elecciondelegadovoto 
                                                    WHERE eledelid = ed.eledelid and eldeasid = eda.eldeasid
                                                    ) AS totalVotos')
                                                )
                                        ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                        ->where('eda.agenid', $agencia->agenid)
                                        ->where('eda.eledelid', $eledelid)
                                        ->where('eda.eldeasesvotoblanco', true)
                                        ->orderByDesc('totalVotos')
                                        ->first();

            $agencia->jurados   = DB::table('elecciondelegadoagenciajurado')
                                    ->select('eldeajdocumento', 'eldeajnombre', 'eldeajcargo')
                                    ->where('eldeagid', $agencia->eldeagid)->get();
        }

        $data = [
                'tituloEleccion' => $tituloEleccion,
                'agencias'       => $agencias
            ];

         GenerarPdf::actaCierre($data, $empresa, 'I'); */

         /* $table->smallIncrements('deleid')->comment('Identificador de la tabla delegado');
            $table->string('deledocumento', 15)->unique('uk_delegado')->comment('Documento del delegado');
            $table->string('deleprimernombre', 50)->comment('Primer nombre del delegado');
            $table->string('delesegundonombre', 50)->nullable()->comment('Segundo nombre del delegado');
            $table->string('deleprimerapellido', 50)->comment('Primer apellido del delegado');
            $table->string('delesegundoapellido', 50)->nullable()->comment('Segundo apellido del delegado');
            $table->tinyInteger('delenumero')->comment('Número en el orden el cual fue asignado como delegado');
            $table->string('delecorreo', 80)->unique('uk_delegado1')->nullable()->comment('Correo del delegado');
            $table->string('deletelefono', 20)->nullable()->comment('Teléfono del delegado');*/
      
         
	}
}