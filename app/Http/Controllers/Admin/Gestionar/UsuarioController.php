<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Models\Gestionar\Usuario\IntentosFallidos;
use App\Models\Gestionar\Usuario\UsuarioRol;
use App\Http\Controllers\Controller;
use Throwable, Auth, DB, URL, Log;
use Illuminate\Http\Request;
use App\Util\Notificar;
use App\Models\User;

class UsuarioController extends Controller
{
	public function index(Request $request)
	{ 
		try{
			$data = DB::table('usuario as u')
						->select('u.usuaid','u.usuadocumento','u.usuanombre','u.usuaapellidos','u.usuaemail','u.usuabloqueado','u.usuaactivo',
								'u.usuacambiarpassword','u.usuanick', 'u.agenid', 'a.agennombre',
								DB::raw("if(u.usuaactivo = 1,'Sí', 'No') as estado"),
								DB::raw("if(u.usuabloqueado = 1,'Sí', 'No') as usuarioBloqueado"),
								DB::raw("if(u.usuacambiarpassword = 1,'Sí', 'No') as cambiarPassword"))
						->join('agencia as a', 'a.agenid', '=', 'u.agenid')
						->orderBy('u.usuanombre')->orderBy('u.usuaapellidos')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información ']);
		}
	}

	public function datos(Request $request)
	{
		$request->validate(['codigo' => 'required','tipo' => 'required']);
		try{

			$agencias = DB::table('agencia')->select('agenid','agennombre')->orderBy('agennombre')->get();
			$roles    = DB::table('rol')->select('rolid','rolnombre')->where('rolactivo','1')->orderBy('rolnombre')->get();
			$usuariosRoles  = [];
			if($request->tipo === 'U'){
				$usuariosRoles = DB::table('usuariorol as ur')->select('r.rolid','r.rolnombre', 'ur.usurolid')
										->join('rol as r', 'r.rolid', '=', 'ur.usurolrolid')
										->where('ur.usurolusuaid', $request->codigo)->get();
			}
			return response()->json(['success' => true, 'agencias' => $agencias, 'roles' => $roles, 'usuariosRoles' => $usuariosRoles ]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información para la gestión del usuario']);
		}
	}

	public function salve(Request $request)
	{
        $usuaid  = $request->codigo;
        $usuario = ($usuaid != '000') ? User::findOrFail($usuaid) : new User();

		$request->validate([
			'tipo'            => 'required',
			'documento'       => 'required|string|min:6|max:15',
			'nombre'          => 'required|string|min:3|max:50',
            'apellido'        => 'required|string|min:3|max:50',
            'nickUsuario'     => 'required|string|min:4|max:20|unique:usuario,usuanick,'.$usuario->usuaid.',usuaid', 
            'correo'          => 'required|email|string|max:80|unique:usuario,usuaemail,'.$usuario->usuaid.',usuaid',
			'cambiarPassword' => 'required|numeric',
			'bloqueado'       => 'required|numeric',
            'estado'          => 'required|numeric',
			'roles'           => 'required|array|min:1'
        ]);

		DB::beginTransaction();
		try {

			$nombres                = mb_strtoupper($request->nombre,'UTF-8');
            $apellidos              = mb_strtoupper($request->apellido,'UTF-8');
			$nickUsuario            = $request->nickUsuario;
			$usuario->usuadocumento = $request->documento;
			$usuario->usuanombre    = $nombres;
			$usuario->usuaapellidos = $apellidos;
			$usuario->usuaemail     = $request->correo;
			$usuario->usuanick      = $request->nickUsuario;
			$usuario->usuaactivo    = $request->estado;
			$usuario->usuabloqueado = $request->bloqueado;
			($request->tipo === 'I' or $request->cambiarPassword === '1') ? $usuario->password = bcrypt($request->documento) : '';
			$usuario->save();

			if($request->cambiarPassword){
				$intentosFallidos = DB::table('intentosfallidos')->select('intfalid')->where('intfalusurio', $nickUsuario)->get();
				if($intentosFallidos){
					foreach($intentosFallidos as $intentoFallido){
						$intentosFallidosUser = IntentosFallidos::findOrFail($intentoFallido->intfalid);
						$intentosFallidosUser->delete();
					}
				}
			}

			foreach($request->roles as $dataRol){
				$identificador = $dataRol['identificador'];
				$rol           = $dataRol['rol'];
				$rolEstado     = $dataRol['estado'];
				if($rolEstado === 'I'){
					$usuarioRol               = new UsuarioRol();
					$usuarioRol->usurolusuaid = $usuario->usuaid;
					$usuarioRol->usurolrolid  = $rol;
					$usuarioRol->save();
				}else if($rolEstado === 'D'){
					$usuarioRol = UsuarioRol::findOrFail($identificador);
					$usuarioRol->delete();
				}else{//Omitir
				}
			}

			$mensajeCorreo = '';
			if ($request->tipo === 'I'){
				$nombreUsuario     = $nombres.' '. $apellidos;
				$email             = $request->correo;
				$contrasenaSistema = $request->documento;
				$urlSistema        = URL::to('/');
				$empresa           = DB::table('empresa')->select('emprcorreo','emprsigla')->where('emprid', 1)->first();
				$emailEmpresa 	   = $empresa->emprcorreo;
				$nombreEmpresa     = $empresa->emprsigla;
				$informacionCorreo = DB::table('informacionnotificacioncorreo')->where('innoconombre', 'notificarRegistroUsuario')->first();
				$buscar            = Array('nombreEmpresa','nombreUsuario','nickUsuario', 'contrasenaUsuario','urlSistema');
        		$remplazo          = Array($nombreEmpresa, $nombreUsuario, $nickUsuario, $contrasenaSistema, $urlSistema);
				$asunto            = str_replace($buscar, $remplazo, $informacionCorreo->innocoasunto);
				$msg               = str_replace($buscar, $remplazo, $informacionCorreo->innococontenido);
				$enviarcopia       = $informacionCorreo->innocoenviarcopia;
				$enviarpiepagina   = $informacionCorreo->innocoenviarpiepagina;
				$mensajeCorreo     = ', se ha enviado notificación al correo '.Notificar::correo([$email], $asunto, $msg, [], $emailEmpresa, $enviarcopia, $enviarpiepagina, $nombreEmpresa);
			}

            DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito'.$mensajeCorreo ]);
		} catch (Throwable $e){
			dd($e);
            DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de usuario']);
		}
	}

	public function destroy(Request $request)
	{
		$request->validate(['codigo' => 'required']);

		DB::beginTransaction();
		try {
			$usuario = User::findOrFail($request->codigo);
			$usuario->delete();
			DB::commit();
			return response()->json(['success' => true, 'message' => 'Registro eliminado con éxito']);
		} catch (Throwable $e){
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en la eliminación del usuario ']);
		}
	}
}