<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Models\Eleccion\Delegado\EleccionDelegado;
use App\Models\Eleccion\Delegado\AgenciaJurado;
use App\Models\Eleccion\Delegado\Agencia;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Throwable, DB, Log, auth;

class GestionController extends Controller
{
    public function index()
	{
        try{
		    $data = DB::table('elecciondelegado')
                        ->select('eledelid','eledelanio','eledeltitulo','eledelperiodo','eledelhorainicio','eledelhoracierre',
                            DB::raw("if(eledelabrireleccion = 1,'Sí', 'No') as abrirEleccion"),
                            DB::raw("if(eledelcerrareleccion = 1,'Sí', 'No') as cerrarEleccion"),
                            DB::raw("if(eledelpublicareleccion = 1,'Sí', 'No') as publicaEleccion"))
                        ->orderByDesc('eledelanio')
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

			$agencias          = DB::table('agencia')->select('agenid','agennombre')->orderBy('agennombre')->get();
            $delegadosAgencias = [];
			if($request->tipo === 'U'){
				$delegadosAgencias = DB::table('elecciondelegadoagencia as eda')
                                        ->select('eda.eldeagid','eda.agenid', 'eda.eldeaglugar','eda.eldeagnumerodeleprincipal',
                                                'eda.eldeagnumerodelesuplente','a.agennombre')
										->join('agencia as a', 'a.agenid', '=', 'eda.agenid')
										->where('eda.eledelid', $request->codigo)->get();
			}

            if($request->tipo === 'A'){	
                $delegadosAgencias = DB::table('elecciondelegadoagencia as eda')
                                            ->select('eda.eldeagid','eda.agenid','eda.eldeaglugar','eda.eldeagnumerodeleprincipal',
                                                        'eda.eldeagnumerodelesuplente','a.agennombre')
                                            ->selectRaw("GROUP_CONCAT(
                                                            DISTINCT edaj.eldeajnombre
                                                            ORDER BY edaj.eldeajnombre
                                                            SEPARATOR ', '
                                                        ) AS jurados ")
                                            ->join('agencia as a', 'a.agenid', '=', 'eda.agenid')
                                            ->leftJoin('elecciondelegadoagenciajurado as edaj','edaj.eldeagid','=', 'eda.eldeagid' )
                                            ->where('eda.eledelid', $request->codigo)
                                            ->groupBy('eda.eldeagid', 'eda.agenid','eda.eldeaglugar', 'eda.eldeagnumerodeleprincipal',
                                                        'eda.eldeagnumerodelesuplente','a.agennombre')
                                            ->get();
			}

			return response()->json(['success' => true, 'agencias' => $agencias, 'delegadosAgencias' => $delegadosAgencias ]);
		}catch(Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para la gestión de la elección de delegados']);
		}
	}

    public function salve(Request $request)
	{
        $request->validate([
				'codigo'     => 'required',
				'titulo'     => 'required|string|min:10|max:150',
                'periodo'    => 'required|max:20',
                'horaInicio' => 'required|string|min:5|max:10',
                'horaCierre' => 'required|string|min:5|max:10',
				'agencias'   => 'required|array|min:1',
            ]);

        DB::beginTransaction();
        try {

            $anio             = date('Y');

            $anio = 2025;
            $id               = $request->codigo;
			$eleccionDelegado = ($id != '000') ? EleccionDelegado::findOrFail($id) : new EleccionDelegado();

            if ($id == '000' && EleccionDelegado::where('eledelanio', $anio)->exists()) {
				return response()->json(['success' => false,'message' => "Ya existe un gestión de elección de delegado registrado para el año {$anio}."], 422);
			}

            if($request->tipo === 'I'){$eleccionDelegado->eledelanio =  $anio;}
			$eleccionDelegado->eledeltitulo     = $request->titulo;
			$eleccionDelegado->eledelperiodo    = $request->periodo;
			$eleccionDelegado->eledelhorainicio = $request->horaInicio;
			$eleccionDelegado->eledelhoracierre = $request->horaCierre;
			$eleccionDelegado->save();
            $eledelid = $eleccionDelegado->eledelid;

            foreach($request->agencias as $dataAgencia){
				$identificador  = $dataAgencia['identificador'];
                $totalPrincipal = $dataAgencia['totalPrincipal'];
                $totalSuplente  = $dataAgencia['totalSuplente'];
				$agencia        = $dataAgencia['agencia'];
                $lugar          = $dataAgencia['lugar'];
				$agenciaEstado  = $dataAgencia['estado'];
				if($agenciaEstado === 'I'){
					$eleccionDelegadoAgencia                            = new Agencia();
					$eleccionDelegadoAgencia->eledelid                  = $eledelid;
					$eleccionDelegadoAgencia->agenid                    = $agencia;
                    $eleccionDelegadoAgencia->eldeaglugar               = $lugar;
                    $eleccionDelegadoAgencia->eldeagnumerodeleprincipal = $totalPrincipal;
                    $eleccionDelegadoAgencia->eldeagnumerodelesuplente  = $totalSuplente;
					$eleccionDelegadoAgencia->save();
				}else if($agenciaEstado === 'D'){
					$eleccionDelegadoAgencia = Agencia::findOrFail($identificador);
					$eleccionDelegadoAgencia->delete();
				}else{//Omitir
				}
			}

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            dd($e);
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de la gestion de la elección de delegado']);
		}
	}

    public function juradosAsignados(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try{ 	

			$juradosAgencias = DB::table('elecciondelegadoagenciajurado as edaj')
                                ->select('edaj.eldeajid','edaj.eldeajdocumento','edaj.eldeajnombre', 'edaj.eldeajcargo','a.agennombre')
                                ->join('elecciondelegadoagencia as eda', 'eda.eldeagid', '=', 'edaj.eldeagid')
                                ->join('agencia as a', 'a.agenid', '=', 'eda.agenid')
                                ->where('edaj.eldeagid', $request->codigo)
                                ->get();

			return response()->json(['success' => true, 'juradosAgencias' => $juradosAgencias ]);
		}catch(Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los jurado de la agencia para la elección de delegados']);
		}
	}

    public function asignarJurados(Request $request)
	{
        $request->validate([
				'codigo'  => 'required',
				'jurados' => 'required|array|min:1',
            ]);

        DB::beginTransaction();
        try {

            foreach($request->jurados as $dataJurados){
				$identificador  = $dataJurados['identificador'];
                $documento      = $dataJurados['documento'];
                $nombre         = $dataJurados['nombre'];
				$cargo          = $dataJurados['cargo'];
				$juradosEstado  = $dataJurados['estado'];
				if($juradosEstado === 'I'){
					$agenciaJurado                  = new AgenciaJurado();
					$agenciaJurado->eldeagid        = $request->codigo;
					$agenciaJurado->eldeajdocumento = $documento;
                    $agenciaJurado->eldeajnombre    = $nombre;
                    $agenciaJurado->eldeajcargo     = $cargo;
					$agenciaJurado->save();
				}else if($juradosEstado === 'D'){
					$agenciaJurado = AgenciaJurado::findOrFail($identificador);
					$agenciaJurado->delete();
				}else{//Omitir
				}
			}

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            dd($e);
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro delos jurados para la elección de delegado']);
		}
	}

    public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);

        $agenciaJurado = DB::table('elecciondelegadoagenciajurado as edaj')
                                    ->select('edaj.eldeajid')
                                    ->join('elecciondelegadoagencia as eda', 'eda.eldeagid', '=', 'edaj.eldeagid')
                                    ->where('eda.eledelid', $request->codigo)
                                    ->first();
        if($agenciaJurado){
            return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con los jurados para la elección de delegados']);
        }else{
            DB::beginTransaction();
            try {
                $eleccionDelegado = EleccionDelegado::findOrFail($request->codigo);
                $eleccionDelegado->delete();
                DB::commit();
                return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
            } catch (Throwable $e){
                DB::rollback();
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación de la gestión de la elección de delegado ']);
            }
        }
	}
}