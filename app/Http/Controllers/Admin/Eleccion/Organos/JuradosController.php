<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Eleccion\Organos\Jurado;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log;
use App\Util\Empresa;
use Carbon\Carbon;

class JuradosController extends Controller
{
    public function index()
	{
        try{
            $titulo  = 'No existen ningún órgano de elección activo';
            $id      = '';
            $jurados = DB::table('organoeleccionjurado as oej')
                            ->select('oej.oreljuid','oej.orgeleid','d.deledocumento','oej.oreljuesjurado',
                                DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre ) as nombres"),
                                DB::raw("CONCAT_WS(' ', d.deleprimerapellido, d.delesegundoapellido) as apellidos"),
                                DB::raw("if(oej.oreljuesjurado = 1,'Jurado', 'Testigo') as tipoJurado"))
                            ->join('organoeleccion as oe', 'oe.orgeleid', '=', 'oej.orgeleid')
                            ->join('delegado as d', 'd.deleid', '=', 'oej.deleid')
                            ->where('oe.orgeleactivo', true)
                            ->orderBy('nombres')->get();

            $organoEleccion = DB::table('organoeleccion')->select('orgeleid','orgeletitulo')->where('orgeleactivo', true)->first();
            if($organoEleccion){
                $titulo = 'Gestionar jurados para '.$organoEleccion->orgeletitulo;
                $id     = $organoEleccion->orgeleid;
            }

		    $delegados = DB::table('delegado')
                                ->select('deleid','deledocumento',
                                    DB::raw("CONCAT_WS(' ', deleprimernombre, delesegundonombre) as nombres"),
                                    DB::raw("CONCAT_WS(' ', deleprimerapellido, delesegundoapellido) as apellidos"))
                                ->where('deleactivo', true)
                                ->where('deleid', '<>', 1)
                                ->get();

			return response()->json(['success' => true, 'id' => $id, 'titulo' => $titulo, 'jurados' => $jurados, 'delegados' => $delegados]);
		}catch(Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los delegados']);
		}
	}

}