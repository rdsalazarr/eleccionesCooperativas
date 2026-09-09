<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Eleccion\Delegado\Delegado;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use Throwable, DB, Log;
use App\Util\Empresa;
use Carbon\Carbon;

class DelegadosController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('delegado as d')
                        ->select('d.deleid','d.agenid','d.deledocumento','d.deleprimernombre','d.delesegundonombre','d.deleprimerapellido',
                            'd.delesegundoapellido','d.delenumero','d.delecorreo','d.deletelefono','d.deleactivo','a.agennombre',
                            DB::raw("if(d.deleactivo = 1,'Sí', 'No') as estado"),
                            DB::raw("CONCAT_WS(' ', d.deleprimernombre, d.delesegundonombre ) as nombres"),
                            DB::raw("CONCAT_WS(' ', d.deleprimerapellido, d.delesegundoapellido) as apellidos"))
                        ->join('agencia as a', 'a.agenid', '=', 'd.agenid')
                        ->orderBy('d.agenid')
                        ->orderBy('d.delenumero')
                        ->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los delegados']);
		}
	}

    public function datos(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try{

			$agencias = DB::table('agencia')->select('agenid','agennombre')->orderBy('agennombre')->get();

			return response()->json(['success' => true, 'agencias' => $agencias ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para el registro del delegado']);
		}
	}

    public function salve(Request $request)
	{
	    $id       = $request->codigo;
        $delegado = ($id != '000') ? Delegado::findOrFail($id) : new Delegado();

	    $request->validate([
			'documento'       => 'required|string|min:6|max:15|unique:delegado,deledocumento,'.$delegado->deleid.',deleid',
            'agencia'         => 'required|numeric',
            'primerNombre'    => 'required|string|min:3|max:40',
            'segundoNombre'   => 'nullable|string|max:40',
            'primerApellido'  => 'required|string|min:3|max:40',
            'segundoApellido' => 'nullable|string|max:40',
            'numeroDelegado'  => 'required|numeric',
            'correo'          => 'required|string|email|max:80',
            'telefono'        => 'nullable|string|max:20',
            'estado'          => 'required|numeric'
        ]);

		try {
			$id = $request->codigo;	
			$delegado                      = ($id != '000') ? Delegado::findOrFail($id) : new Delegado();
            $delegado->agenid              = $request->agencia;
            $delegado->deledocumento       = $request->documento;
            $delegado->deleprimernombre    = mb_strtoupper($request->primerNombre,'UTF-8');
            $delegado->delesegundonombre   = mb_strtoupper($request->segundoNombre,'UTF-8');
            $delegado->deleprimerapellido  = mb_strtoupper($request->primerApellido,'UTF-8');
            $delegado->delesegundoapellido = mb_strtoupper($request->segundoApellido,'UTF-8');
            $delegado->delenumero          = $request->numeroDelegado;
            $delegado->delecorreo          = $request->correo;
            $delegado->deletelefono        = $request->telefono;
            $delegado->deleactivo          = $request->estado;
			$delegado->save();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}

    public function imprimirLista(Request $request)
	{
        try {

            $empresa  = Empresa::informacion();
            $agencias = DB::table('agencia')->select('agenid', 'agennombre')->orderBy('agennombre')->get();
            foreach ($agencias as $agencia) {
                $agencia->delegados = DB::table('delegado')
                            ->select('deledocumento as documento','delenumero as numeroInscripcion',
                                     DB::raw("CONCAT_WS(' ', deleprimernombre, delesegundonombre, deleprimerapellido, delesegundoapellido) as nombreCompleto"))
                                    ->where('deleactivo', true)
                                    ->where('agenid', $agencia->agenid)->get();
            }

            $dataPdf = GenerarPdf::listaDelegadoActivos($agencias, $empresa, 'S'); 

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF ']);
		}
    }
}