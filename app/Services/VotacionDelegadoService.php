<?php

namespace App\Services;

use Throwable, DB, Auth;

class VotacionDelegadoService
{
    public function actaInicio($tipo)
    {
        $eleccionDelegado = DB::table('elecciondelegado')
                                    ->select('eledelid', 'eledeltitulo', 'eledelperiodo')
                                    ->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }

        $eledelid        = $eleccionDelegado->eledelid;
        $titulo         = $eleccionDelegado->eledeltitulo;
        $periodo        = $eleccionDelegado->eledelperiodo;
        $tituloEleccion = mb_strtolower($titulo,'UTF-8').' '.$periodo;

        $consulta = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                            ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                            ->where('eda.eledelid', $eledelid);

                            if($tipo !== 'GENERAL') {
                                $consulta->where('a.agenid', auth()->user()->agenid);
                            } 

                    $agencias = $consulta->orderBy('a.agennombre')->get();

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

        return [
                'tituloEleccion' => $tituloEleccion,
                'agencias'       => $agencias
             ];
    }

    public function actaCierre($tipo)
    {
        $eleccionDelegado = DB::table('elecciondelegado')
                                ->select('eledelid', 'eledeltitulo', 'eledelperiodo')
                                ->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }

        $eledelid        = $eleccionDelegado->eledelid;
        $titulo         = $eleccionDelegado->eledeltitulo;
        $periodo        = $eleccionDelegado->eledelperiodo;
        $tituloEleccion = mb_strtolower($titulo,'UTF-8').' '.$periodo; 

        $consulta = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                            ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                            ->where('eda.eledelid', $eledelid);

                            if($tipo !== 'GENERAL') {
                                $consulta->where('a.agenid', auth()->user()->agenid);
                            }

                $agencias = $consulta->orderBy('a.agennombre')->get();

        foreach ($agencias as $agencia) {
            $idActa    = ($agencia->agenid == 1) ? 6 : 7;
            $acta      =  DB::table('acta')->where('actaid', $idActa)->first(); 
            $titulo    = 'No hay acta gestionada para esta agencia';
            $contenido = 'No hay contenido gestionado para el acta de esta agencia';
            if($acta){
                $titulo    =  $acta->actatitulo;
                $contenido =  $acta->actacontenido;
            }

            $agencia->titulo           = $titulo;
            $agencia->contenido        = $contenido;
            $agencia->aspirantes       = $this->datosVotacionDelegados($agencia->agenid, $eledelid);
            $agencia->totalVotosBlanco = $this->datosVotosBlancos($agencia->agenid, $eledelid);
            $agencia->jurados          = DB::table('elecciondelegadoagenciajurado')
                                                ->select('eldeajdocumento', 'eldeajnombre', 'eldeajcargo')
                                                ->where('eldeagid', $agencia->eldeagid)->get();
        }
        
        return [
                'tituloEleccion' => $tituloEleccion,
                'agencias'       => $agencias
            ];
    }

    public function resultadosEleccionDelegados($consecutivo)
    {
        $eleccionDelegado = DB::table('elecciondelegado')
                                    ->select('eledelid', 'eledeltitulo', 'eledelperiodo')
                                    ->where('eledelanio', date('Y'))->first();
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
                            ->orderBy('a.agennombre')
                            ->get();

        foreach ($agencias as $agencia) {
            $agencia->titulo           = $titulo;
            $agencia->contenido        = $contenido;
            $agencia->aspirantes       = $this->datosVotacionDelegados($agencia->agenid, $eledelid);
            $agencia->totalVotosBlanco = $this->datosVotosBlancos($agencia->agenid, $eledelid);
        }

        return [
                'tituloEleccion'     => $tituloEleccion,
                'consecutivo'        => $consecutivo,
                'eleccionDelegadoId' => $eledelid,
                'agencias'           => $agencias,
            ];
    }

    public function datosVotacionDelegados($agenid, $eledelid)
    {
        return DB::table('elecciondelegadoaspirante as eda')
                                    ->select('edag.eldeagnumerodeleprincipal','edag.eldeagnumerodelesuplente',
                                        DB::raw("CONCAT(ti.tipidesigla,' - ', eda.eldeasdocumento ) as tipoIdentificacion"),
                                        DB::raw("CONCAT_WS(' ', eda.eldeasprimernombre, eda.eldeassegundonombre, eda.eldeasprimerapellido, eda.eldeassegundoapellido ) as nombreCompleto"),
                                        DB::raw('(SELECT count(eldevoid) as voto 
                                                    FROM elecciondelegadovoto 
                                                    WHERE eledelid = ed.eledelid and eldeasid = eda.eldeasid
                                                    ) AS totalVotos'))
                                    ->join('elecciondelegado as ed', 'ed.eledelid', '=', 'eda.eledelid')
                                    ->join('tipoidentificacion as ti', 'ti.tipideid', '=', 'eda.tipideid')
                                    ->join('elecciondelegadoagencia as edag', function($join)
                                            {
                                                $join->on('edag.agenid',  '=', 'eda.agenid');
                                                $join->on('edag.eledelid', '=', 'eda.eledelid'); 
                                            })
                                    ->where('eda.agenid', $agenid)
                                    ->where('eda.eledelid', $eledelid)
                                    ->where('eda.eldeasactivo', true)
                                    ->where('eda.eldeasesvotoblanco', false)
                                    ->where('ed.eledelcerrareleccion', true)
                                    ->orderByDesc('totalVotos')
                                    ->orderBy('eda.eldeasnumero')
                                    ->get();
    }

    public function datosVotosBlancos($agenid, $eledelid)
    {
        return  DB::table('elecciondelegadoaspirante as eda')
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
    }
}