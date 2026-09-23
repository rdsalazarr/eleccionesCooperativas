<?php

namespace App\Services;

use Throwable, DB, Auth, URL;

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
            $idActa    = ($agencia->agenid == 1) ? 1 : 2;
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
            $idActa    = ($agencia->agenid == 1) ? 3 : 4;
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

    public function resultadosEleccionDelegados($consecutivo = '')
    {
        $eleccionDelegado = DB::table('elecciondelegado')
                                    ->select('eledelid', 'eledeltitulo', 'eledelperiodo')
                                    ->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }

        $eledelid       = $eleccionDelegado->eledelid;
        $titulo         = $eleccionDelegado->eledeltitulo;
        $periodo        = $eleccionDelegado->eledelperiodo;
        $complemento    = (!empty($consecutivo)) ? 'Boletín número '. $consecutivo.' de ' : '';
        $tituloEleccion =  $complemento.mb_strtolower($titulo,'UTF-8').' '.$periodo;

        $agencias = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                            ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                            ->where('eda.eledelid', $eledelid)
                            ->orderBy('a.agennombre')
                            ->get();

        foreach ($agencias as $agencia) {
            $agencia->titulo           = $tituloEleccion;
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

    public function resultadosPublicosEleccionDelegados()
    {      
        $eleccionDelegado = DB::table('elecciondelegado')
                                    ->select('eledelid', 'eledeltitulo', 'eledelperiodo')
                                    ->where('eledelanio', date('Y'))->first();
        if (!$eleccionDelegado) {
            return null;
        }

        $eleccionId = $eleccionDelegado->eledelid;
        $titulo     = $eleccionDelegado->eledeltitulo;
        $periodo    = $eleccionDelegado->eledelperiodo;

        $estadisticas = DB::table('asociado as a')
                            ->select(
                                DB::raw('COUNT(DISTINCT a.asocid) AS totalAsociadosHabiles'),
                                DB::raw('(
                                    SELECT COUNT(DISTINCT edv.eldevoid)
                                    FROM elecciondelegadovoto edv
                                    INNER JOIN elecciondelegadoaspirante eda
                                        ON edv.eldeasid = eda.eldeasid
                                    WHERE eda.eledelid = ' . $eleccionId . '
                                ) AS totalVotosRealizados'),
                                DB::raw('(
                                    SELECT COUNT(DISTINCT edv.eldevoid)
                                    FROM elecciondelegadovoto edv
                                    INNER JOIN elecciondelegadoaspirante eda
                                        ON edv.eldeasid = eda.eldeasid
                                    WHERE eda.eledelid = ' . $eleccionId . '
                                    AND eda.eldeasesvotoblanco = 1
                                ) AS totalVotosBlanco'))
                            ->where('a.asocactivo', true)
                            ->first();

        $agencias = DB::table('agencia as a')->select('a.agenid', 'a.agennombre', 'eda.eldeagid')
                        ->join('elecciondelegadoagencia as eda', 'eda.agenid', '=', 'a.agenid')
                        ->where('eda.eledelid', $eleccionId)
                        ->orderBy('a.agennombre')
                        ->get();
        foreach ($agencias as $agencia) {
            $agencia->candidatos       = $this->datosVotacionDelegados($agencia->agenid, $eleccionId);
            $agencia->totalVotosBlanco = $this->datosVotosBlancos($agencia->agenid, $eleccionId);
        }

        return [
                'totalVotosRealizados'  => $estadisticas->totalVotosRealizados - $estadisticas->totalVotosBlanco,
                'totalAsociadosHabiles' => $estadisticas->totalAsociadosHabiles,
                'totalVotosRegistrados' => $estadisticas->totalVotosRealizados,
                'totalVotosBlanco'      => $estadisticas->totalVotosBlanco,
                'agencias'              => $agencias,
                'periodo'               => $periodo,
                'titulo'                => $titulo,
            ];
    }
    
    public function datosVotacionDelegados($agenid, $eledelid)
    {
        return DB::table('elecciondelegadoaspirante as eda')
                    ->select('edag.eldeagnumerodeleprincipal','edag.eldeagnumerodelesuplente',
                        DB::raw("CONCAT(LPAD(eda.eldeasnumero,  2, 0)) as eldeasnumero"),
                        DB::raw("CONCAT(ti.tipidesigla,' - ', eda.eldeasdocumento ) as tipoIdentificacion"),
                        DB::raw("CASE 
                                    WHEN eldeasimagen IS NOT NULL AND eldeasimagen <> ''
                                    THEN CONCAT('" . URL::to('/') . "/archivos/images/aspirante/', eldeasimagen)
                                    ELSE NULL
                                END AS rutaFoto"),
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
                    ->where('eda.agenid', $agenid)
                    ->where('eda.eledelid', $eledelid)
                    ->where('eda.eldeasesvotoblanco', true)
                    ->orderByDesc('totalVotos')
                    ->first();
    }
}