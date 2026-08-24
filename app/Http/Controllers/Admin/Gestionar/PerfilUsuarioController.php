<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Models\Gestionar\Usuario\HistorialContrasena;
use App\Http\Requests\PersonaRequest;
use App\Http\Controllers\Controller;
use Throwable, Auth, DB, Log;
use Illuminate\Http\Request;
use App\Util\General;
use App\Models\User;

class PerfilUsuarioController extends Controller
{
    public function index()
	{
		try {
			$dataUsuario = ['nombreCompleto' => Auth::user()->name.' '.Auth::user()->apellidos,
							'usuanick'       => Auth::user()->email
							];
			return response()->json(['success' => true,  "dataUsuario" => $dataUsuario]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información del usuario ']);
		}
	}

    public function perfil()
	{
		 try {
			$data = DB::table('usuario')
	   					->select('usuadocumento','usuanombre','usuaapellidos', 'usuaemail','usuanick')	
		    			->where('usuaid', Auth::id())
						->first(); 

        	return response()->json(['success' => true, "data" => $data ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de la persona ']);
		}
	}

	public function updatePerfil(Request $request)
	{
	    $usuario = User::findOrFail(Auth::id());

		$request->validate([
			'documento'   => 'required|string|min:6|max:15',
			'nombre'      => 'required|string|min:3|max:50',
            'apellido'    => 'required|string|min:3|max:50',
            'nickUsuario' => 'required|string|min:4|max:20|unique:usuario,usuanick,'.$usuario->usuaid.',usuaid',
            'correo'      => 'required|email|string|max:80|unique:usuario,usuaemail,'.$usuario->usuaid.',usuaid',
        ]);

		try {

			$nombres                = mb_strtoupper($request->nombre,'UTF-8');
            $apellidos              = mb_strtoupper($request->apellido,'UTF-8');
			$nickUsuario            = $request->nickUsuario;
			$usuario->usuadocumento = $request->documento;
			$usuario->usuanombre    = $nombres;
			$usuario->usuaapellidos = $apellidos;
		    $usuario->usuaemail     = $request->correo;
			$usuario->usuanick      = $request->nickUsuario;
			$usuario->save();

			return response()->json(['success' => true,'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e) {
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrió un error en el registro al tratar de actualizar el perfil']);
		}
	}

	public function updatePassword(Request $request)
	{
		$request->validate([
			'password'    => 'required|string|min:6',
			'repPassword' => 'required|confirmed',
			'repPassword' => 'required|same:password'
		]);

		list($success, $message) = General::validarContrasena($request->password);
		if(!$success){
			return response()->json(['success' => false, 'message'=> $message]);
		}

		//Verifico que la contraseña no la halla utilizado el usuario
		$historialContrasenas = DB::table('historialcontrasena')->select('hisconid','hisconpassword')->where('usuaid', Auth::id())->get();
		foreach($historialContrasenas as $historialContrasena){
			if (password_verify($request->password, $historialContrasena->hisconpassword)) {
				return response()->json(['success' => false, 'message'=> 'Lo siento, pero esta contraseña ya ha sido utilizada en el pasado. Por favor, elige una contraseña diferente']);
			}
		}

		DB::beginTransaction();
		try {
			$historialContrasena                 = new HistorialContrasena();
			$historialContrasena->usuaid         = Auth::id();
			$historialContrasena->hisconpassword = bcrypt($request->password);
			$historialContrasena->save();

			$usuario                      = User::findOrFail(Auth::id());
			$usuario->password            = bcrypt($request->password);
			$usuario->usuacambiarpassword = false;

			DB::commit();
			return response()->json(['success' => true, 'message' => 'Contraseña modificada con éxito por favor cierra sesión y vuelve a ingresar al sistema']);
		} catch (Throwable $e){	
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al tratar de actualizar la contraseña']); 
		}
	}
}