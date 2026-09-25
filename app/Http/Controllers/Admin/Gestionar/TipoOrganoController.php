<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Models\Gestionar\TipoOrgano;
use App\Http\Controllers\Controller;
use Throwable, DB, Log, File, URL;
use App\Util\ProcesadorImagen;
use Illuminate\Http\Request;
use App\Util\General;

class TipoOrganoController extends Controller
{
    public function index(Request $request)
	{
		try{
			$data = DB::table('tipoorgano')
						->select('tiporgid','tiporgnombre','tiporgvotosporpersona','tiporgtotalprincipales','tiporgtotalsuplente', 'tiporglogo', 'tiporgactivo',
                            DB::raw("if(tiporgactivo = 1,'Sí', 'No') as estado"),
                            DB::raw("CASE 
                                        WHEN tiporglogo IS NOT NULL AND tiporglogo <> ''
                                        THEN CONCAT('" . URL::to('/') . "/archivos/images/tipoOrganose/', tiporglogo)
                                        ELSE NULL
                                    END AS rutaLogo"))
						->orderBy('tiporgid')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los tipos de órganos ']);
		}
	}

    public function salve(Request $request)
	{
        $request->validate([
            'nombre'         => 'required|string|min:4|max:50',
            'votosPersona'   => 'required|numeric',
            'totalPrincipal' => 'required|numeric',
            'totalSuplente'  => 'required|numeric',
            'logo'           => 'nullable|mimes:jpg,png,jpeg,JPG.PNG|max:1000',
            'estado'         => 'required'
        ]); 

        DB::beginTransaction();
		try {

            $id         = $request->codigo;	
			$tipoOrgano = ($id != '000') ? TipoOrgano::findOrFail($id) : new TipoOrgano();

            if($request->hasFile('logo')){
                $rutaCarpeta    = public_path().'/archivos/images/tipoOrganos/';
                $carpetaServe   = (is_dir($rutaCarpeta)) ? $rutaCarpeta : File::makeDirectory($rutaCarpeta, $mode = 0775, true, true);
                $file           = $request->file('logo');
                $nombreOriginal = $file->getclientOriginalName();
                $filename       = pathinfo($nombreOriginal, PATHINFO_FILENAME);
                $extension      = pathinfo($nombreOriginal, PATHINFO_EXTENSION);
                $nombreLogoBD   = (10 * mt_rand(1, 100)).'_'.General::quitarCaracteres($filename).'.'.$extension;
                $file->move($rutaCarpeta, $nombreLogoBD);
                ProcesadorImagen::optimizarDimensiones($rutaCarpeta.'/'.$nombreLogoBD, 250, 170);
            }else{
                $nombreLogoBD = $tipoOrgano->tiporglogo;
            }

            $tipoOrgano->tiporgnombre           = $request->nombre;	
            $tipoOrgano->tiporgvotosporpersona  = $request->votosPersona;
            $tipoOrgano->tiporgtotalprincipales = $request->totalPrincipal;
            $tipoOrgano->tiporgtotalsuplente    = $request->totalSuplente;
            $tipoOrgano->tiporglogo             = $nombreLogoBD;
            $tipoOrgano->tiporgactivo           = $request->estado;
			$tipoOrgano->save();

            if ((int) $request->estado === 1) {
                TipoOrgano::where('tiporgid', '!=', $request->codigo)->update(['tiporgactivo' => 0]);
            }

            DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de los tipos de órganos ']);
		}
	}
    
    public function cambiarEstado(Request $request)
	{
		$request->validate(['codigo' => 'required', 'estado' => 'required']);
        DB::beginTransaction();
        try {

            if ((int) $request->estado === 1) {
                TipoOrgano::where('tiporgid', '!=', $request->codigo)->update(['tiporgactivo' => 0]);
            }

            $tipoOrgano               = TipoOrgano::findOrFail($request->codigo);
            $tipoOrgano->tiporgactivo = $request->estado;
			$tipoOrgano->save();

            DB::commit();
    		return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en actualizar el tipo de órgano ']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);
        $organoEleccion = DB::table('organoeleccion')->select('orgeleid')->where('orgeleid', $request->codigo)->first();
		if($organoEleccion){
			return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con un órgano de elección']);
		}else{
            try {
                $tipoOrgano = TipoOrgano::findOrFail($request->codigo);
                $tipoOrgano->delete();
                return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
            } catch (Throwable $e){
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro del acta ']);
            }
        }
	}
}