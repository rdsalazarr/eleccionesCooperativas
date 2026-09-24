<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;
use Carbon\Carbon;

class FrondController extends Controller
{
    public function index()
	{
        return view('page.home', ['title' => 'Inicio - Sistema de elecciones de COOPIGON']);
    }

    public function admin()
	{
        return view('page.admin', ['title' => 'Iniciar sesión en el sistema de elecciones de COOPIGON']);
    }

    public function informacion()
	{
		try{ 

            $organoActivo = DB::table('organoelecciontipoorgano as ete')
                                ->join('tipoorgano as to', 'to.tiporgid', '=', 'ete.tiporgid')
                                ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'ete.orgeleid')
                                ->where('oe.orgeleactivo', true)
                                ->where('to.tiporgactivo', true)
                                ->whereNotNull('ete.oreltofechahorainicio')
                                ->whereNull('ete.oreltofechahoracierre')
                                ->exists();

            $resultadosPublicados = DB::table('elecciondelegado')
                                        ->where('eledelpublicareleccion', true)
                                        ->whereDate('eledelfechafinalpublicacion', '>=', now())
                                        ->exists();

            $delegadosAbiertos = DB::table('elecciondelegado')
                                        ->where('eledelabrireleccion', true)
                                        ->where('eledelpublicareleccion', false)
                                        ->exists();

            $data = [
                    'habilitarOrganoEleccion'        => $organoActivo,
                    'habilitarPublicacionResultados' => $resultadosPublicados,
                    'habilitarEleccionesDelegados'   => $delegadosAbiertos,
                    'habilitarInicioSesion'          => !$organoActivo
                                                        && !$resultadosPublicados
                                                        && !$delegadosAbiertos,
                ];

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información general de elecciones']);
		}
	}
}