<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Models\Configurar\Menu\RolFuncionalidad;
use App\Http\Controllers\Controller;
use App\Models\Configurar\Menu\Rol;
use Illuminate\Http\Request;
use Throwable, DB, Log;
use Carbon\Carbon;

class RolController extends Controller
{
    public function index()
	{
        try{
            $data = DB::table('rol')
						->select('rolid', 'rolnombre', 'rolactivo',
								DB::raw("if(rolactivo = 1 ,'Sí', 'No') as estado"))
						->orderBy('rolnombre')->get();
			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los roles ']);
		}
	}

    public function funcionalidades(Request $request)
	{
        try{
            $data = DB::table('funcionalidad as f')
                            ->select('f.funcid',DB::raw("CONCAT(f.funcnombre,'-', m.modunombre) as titulo"))
                            ->join('modulo as m', 'm.moduid', '=', 'f.moduid')
                            ->where('f.funcactiva', true)
                            ->orderBy('m.modunombre')
                            ->orderBy('f.funcnombre')->get();

            $marcados = DB::table('rolfuncionalidad')->select('rolfunfuncid as funcid')->where('rolfunrolid', $request->codigo)->get(); 
        	return response()->json(['success' => true, "data" => $data, "marcados" => $marcados]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información ']);
		}
	}

	public function salve(Request $request)
	{
        $request->validate([
				'codigo'          => 'required',
				'nombre'          => 'required|string|min:4|max:80',
				'estado'          => 'required',
				'funcionalidades' => 'required|array|min:1',
            ]);

        DB::beginTransaction();
        try {
			$fechaHoraActual = Carbon::now();
			if($request->tipo === 'I'){
				$idRol = DB::table('rol')
						->insertGetId(['rolnombre' => $request->nombre,
								'rolactivo'  => $request->estado,
								'created_at' => $fechaHoraActual,
								'updated_at' => $fechaHoraActual]);
			}else{
				$idRol          = $request->codigo;
				$rol            = Rol::findOrFail($idRol);
				$rol->rolnombre = $request->nombre; 
	            $rol->rolactivo = $request->estado;
	            $rol->save(); 
			}

			//Elimino las funcionalides asignada
			if($request->tipo === 'U'){
				$rolfuncionalidad = DB::table('rolfuncionalidad')->select('rolfunid')
											->where('rolfunrolid', $request->codigo)->get();
				foreach ($rolfuncionalidad as $funcionalidad)
            	{
					$rolfuncionalidad = RolFuncionalidad::findOrFail($funcionalidad->rolfunid);
					$rolfuncionalidad->delete();
				}
			}

            //Almaceno las funcionalidades
            foreach ($request->funcionalidades as $funcionalidad)
            {
                $rolfuncionalidad               = new RolFuncionalidad();
                $rolfuncionalidad->rolfunrolid  = $idRol;
                $rolfuncionalidad->rolfunfuncid = $funcionalidad['funcid'];
                $rolfuncionalidad->save();
            }
            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro ']);
		}
	}
	
	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);

        DB::beginTransaction();
        try {
			$rol = Rol::findOrFail($request->codigo);
			if ($rol->has('funcionalidades')){ 
				foreach ($rol->funcionalidades as $idFuncionalidad){
					$rol->funcionalidades()->delete($idFuncionalidad);
				} 
			}
			$rol->delete();
            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
        } catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
            return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro ']);
        }
	}
}
