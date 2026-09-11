<?php

namespace App\Http\Controllers\Security;

use DB, PDF, Auth, URL, Artisan, TCPDF;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\FileManager;
use App\Util\GenerarPdf;
use App\Util\General;
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

        GenerarPdf::listaAspiranteDelegado($data, $empresa, 'I'); */

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

       /* $id = 3;

        $tipoOrgano = DB::table('tipoorgano as to')
                        ->select('oe.orgeleid','oe.orgelelugar', 'oe.orgeletitulo','to.tiporgnombre','oeto.oreltofechahorainicio')
                        ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid') 
                        ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')  
                        ->where('oeto.oreltoid', $id)
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

        $buscar    = Array('horaInicio','lugarEvento','tipoEleccion','siglaEmpresa','tituloEleccion','nombreJurados','nombreTestigos');
        $remplazo  = Array($horaInicio, $lugarEvento, $tipoEleccion, $siglaEmpresa, $tituloEleccion, $nombreJurados, $nombreTestigos); 
        $contenido = str_replace($buscar, $remplazo, $acta->actacontenido);

        $data = [
                'tipoEleccion' => mb_strtoupper($tipoEleccion,'UTF-8'),
                'fechanicio'   => $fechanicio,
                'contenido'    => $contenido,
                'tituloPdf'    => $tituloPdf,
                'jurados'      => $jurados
            ];
        GenerarPdf::actaApertura($data, $empresa, 'I');*/



        $id = 3;
/*
       $tipoOrgano = DB::table('tipoorgano as to')
                        ->select('oeto.tiporgid', 'oeto.orgeleid', 'to.tiporgnombre','to.tiporgtotalprincipales','to.tiporgtotalsuplente')
                        ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid')
                        ->where('oeto.oreltoid', $id)
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
                'participantes'    => $participantes,
                'totalPrincipal'   => $totalPrincipal,
                'totalSuplente'    => $totalSuplente,
                'tituloPdf'        => $tituloPdf,
            ];

        GenerarPdf::listaResultado($data, $empresa, 'I');*/

        /*$tipoOrgano = DB::table('tipoorgano as to')
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
                        ->where('oeto.oreltoid', $id)
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
        $horaCierre     = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio); //oreltofechahoracierre
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

        GenerarPdf::actaEscrutinio($data, $empresa, 'I');*/


        /* Schema::create('tipoorgano', function (Blueprint $table) {
            $table->tinyIncrements('tiporgid')->comment('Identificador de la tabla tipo de órgano');
            $table->string('tiporgnombre', 50)->comment('Nombre del tipo de órgano');
            $table->tinyInteger('tiporgvotosporpersona')->comment('Número de votos por persona para el tipo de órgano');
            $table->tinyInteger('tiporgtotalprincipales')->comment('Total de persona principales para el tipo de órgano');
            $table->tinyInteger('tiporgtotalsuplente')->comment('Total de persona suplente para el tipo de órgano');
            $table->string('tiporglogo', 100)->nullable()->comment('ruta del logo del tipo de órgano');
            $table->boolean('tiporgactivo')->default(true)->comment('Determina si el tipo de órgano se encuentra activo');
            $table->timestamps();
        });

        Schema::create('organoeleccion', function (Blueprint $table) {
            $table->smallIncrements('orgeleid')->comment('Identificador de la tabla órgano de elección');
            $table->year('orgeleanio')->unique('uk_organoeleccion')->comment('Año en el cual se presenta la órgano de elección');
            $table->string('orgeletitulo',150)->comment('Título de órgano de elección');
            $table->string('orgelelugar',100)->comment('Lugar en el cual se lleva a cabo la órgano de elección');
            $table->string('orgeleperiodo',20)->comment('Perido en el cual esta activa la órgano de elección');
            $table->boolean('orgeleactivo')->default(true)->comment('Determina si el órgano de elección esta activo');
            $table->timestamps();
        });

        Schema::create('organoelecciontipoorgano', function (Blueprint $table) {
            $table->increments('oreltoid')->comment('Identificador de la tabla organo elección tipo órgano');
            $table->unsignedTinyInteger('tiporgid')->comment('Identificador del tipo de órgano de elección');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador del órgano de elección');
            $table->datetime('oreltofechahorainicio')->nullable()->comment('Fecha y hora en la cual se da incio a la elección del tipo de órgano');
            $table->datetime('oreltofechahoracierre')->nullable()->comment('Fecha y hora en la cual se cierra a la elección del tipo de órgano');
            $table->timestamps();

            $table->foreign('tiporgid', 'fk_oreltotiporg')->references('tiporgid')->on('tipoorgano')->onUpdate('cascade');
            $table->foreign('orgeleid', 'fk_oreltoorgele')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade');
        });

                Schema::create('organoeleccionparticipante', function (Blueprint $table) {
            $table->increments('orelpaid')->comment('Identificador de la tabla organo eleccion participante');
            $table->unsignedTinyInteger('tiporgid')->comment('Identificador del tipo de elección');
            $table->unsignedSmallInteger('orgeleid')->comment('Identificador de la elección');
            $table->unsignedSmallInteger('deleid')->comment('Identificador del delegado');
            $table->tinyInteger('orelpaordenparticipacion')->comment('Orden de participación del delegado');
            $table->boolean('orelpaesvotoblanco')->default(false)->comment('Determina si es para el voto en blanco');
            $table->timestamps();

            $table->foreign('tiporgid', 'fk_orelpatiporg')->references('tiporgid')->on('tipoorgano')->onUpdate('cascade');
            $table->foreign('orgeleid', 'fk_orelpaelec')->references('orgeleid')->on('organoeleccion')->onUpdate('cascade'); 
            $table->foreign('deleid', 'fk_orelpadele')->references('deleid')->on('delegado')->onUpdate('cascade');
        });*/


        $tipoOrgano = DB::table('tipoorgano as to')
                        ->select('oeto.tiporgid','oeto.orgeleid', 'to.tiporgnombre','oe.orgelelugar', 'oe.orgeletitulo', 'oe.orgeleperiodo', 
                               'oeto.oreltofechahorainicio','oeto.oreltofechahoracierre','to.tiporgtotalprincipales', 'to.tiporgtotalsuplente')
                        ->join('organoelecciontipoorgano as oeto', 'oeto.tiporgid', '=', 'to.tiporgid') 
                        ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oeto.orgeleid')
                        ->where('oeto.oreltoid', $id)
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
        
        $acta = DB::table('acta')->where('actaid', 3)->first(); 
  
        $totalPrincipal = $tipoOrgano->tiporgtotalprincipales;
        $totalSuplente  = $tipoOrgano->tiporgtotalsuplente;
        $lugarEvento    = $tipoOrgano->orgelelugar;
        $tipoEleccion   = $tipoOrgano->tiporgnombre;
        $tituloEleccion = $tipoOrgano->orgeletitulo;
        $periodo        = $tipoOrgano->orgeleperiodo;
        $buscar         = Array('tipoEleccion ','anio');
        $remplazo       = Array(mb_strtoupper($tipoEleccion,'UTF-8'), date("Y")); 
        $titlePdf       = str_replace( $buscar, $remplazo, $acta->actatitulo);
        $horaCierre     = General::formatearFechaHora($tipoOrgano->oreltofechahorainicio); //oreltofechahoracierre
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

        GenerarPdf::actaResultado($data, $empresa, 'I');
	}
}