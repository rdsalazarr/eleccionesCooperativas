<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Http\Controllers\Controller;
use Throwable, DB, Log, File, URL;
use App\Models\Gestionar\Asociado;
use Illuminate\Http\Request;
use App\Util\General;

class AsociadoController extends Controller
{
    public function index(Request $request)
	{
		try{
			$data = DB::table('asociado as a')
						->select('a.asocid', 'a.tipideid','a.agenid','a.asocnumerodocumento','a.asocnombrecompleto',
                            'a.asocfechaingreso','a.asocgenero','a.asocfechanacimiento','a.asoctelefono','a.asocemail',
                            'a.asocdescripcion','a.asoccelular','a.asocfechaexpedicion','a.asocactivo', 'ag.agennombre as agencia',
                              DB::raw("CONCAT(IFNULL(a.asoccelular,''),' ',IFNULL(a.asoctelefono,'')) as telefonos"),
                            DB::raw("CONCAT(ti.tipidesigla,' - ', ti.tipidenombre ) as tipoIdentificacion"), 
                            DB::raw("if(a.asocactivo = 1,'Sí', 'No') as estado"))
                         ->join('tipoidentificacion as ti', 'ti.tipideid', '=', 'a.tipideid')
                        ->join('agencia as ag', 'ag.agenid', '=', 'a.agenid')
						->orderBy('a.asocnombrecompleto')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los asociados']);
		}
	}

    public function datos(Request $request)
	{
		$request->validate(['codigo' => 'required','tipo' => 'required']);
		try{

			$tiposIdentificaciones = DB::table('tipoidentificacion')->select('tipideid','tipidenombre')->orderBy('tipidenombre')->get();
            $agencias              = DB::table('agencia')->select('agenid','agennombre')->orderBy('agennombre')->get();

			return response()->json(['success' => true, 'tiposIdentificaciones' => $tiposIdentificaciones, 'agencias' => $agencias ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para la gestión del usuario']);
		}
	}

    public function salve(Request $request)
	{
        $id       = $request->codigo;
        $asociado = ($id != '000') ? Asociado::findOrFail($id) : new Asociado();

        $request->validate([
            'tipoIdentificacion' => 'required', 
            'documento'          => 'required|string|min:6|max:15|unique:asociado,asocnumerodocumento,'.$asociado->asocid.',asocid',
            'nombre'             => 'required|string|min:4|max:100',
            'fechaNacimiento'    => 'required|date|date_format:Y-m-d',
            'fechaExpedicion'    => 'required|date|date_format:Y-m-d',
            'fechaIngreso'       => 'required|date|date_format:Y-m-d',
            'telefono'           => 'nullable|string|min:4|max:20',
            'celular'            => 'nullable|string|min:4|max:20',
            'correo'             => 'required|email|max:80',
            'agencia'            => 'required',
            'genero'            => 'required',
            'estado'             => 'required'
        ]); 

		try {

            $asociado->tipideid            = $request->tipoIdentificacion;
            $asociado->agenid              = $request->agencia;
            $asociado->asocnumerodocumento = $request->documento;
            $asociado->asocnombrecompleto  = mb_strtoupper($request->nombre,'UTF-8');
            $asociado->asocfechanacimiento = $request->fechaNacimiento;
            $asociado->asocfechaingreso    = $request->fechaIngreso;
            $asociado->asocfechaexpedicion = $request->fechaExpedicion;
            $asociado->asoctelefono        = $request->telefono;
            $asociado->asocemail           = $request->correo;
            $asociado->asoccelular 	       = $request->celular;
            $asociado->asocgenero 	       = $request->genero;
            $asociado->asocactivo 	       = $request->estado;
			$asociado->save();

			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
  			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro del asociado ']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);
        $eleccionDelegadoProceso = DB::table('elecciondelegadoproceso')->select('asocid')->where('asocid', $request->codigo)->first();
		if($eleccionDelegadoProceso){
			return response()->json(['success' => false, 'message'=> 'Este registro no se puede eliminar, porque está relacionado con un proceso de elección de delegado']);
		}else{
            try {
                $asociado = Asociado::findOrFail($request->codigo);
                $asociado->delete();
                return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
            } catch (Throwable $e){
                Log::error($e->getMessage());
                return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del registro del asociado ']);
            }
        }
	}
}