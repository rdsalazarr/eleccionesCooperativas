<?php

namespace App\Util;

class General
{
    public static function ordenarArray($datos, $label = [], $nombres =[] , $segundo = [], $tercero = [])
	{
		$arreglo = [];
		foreach ($datos as $item) {
			foreach ($nombres as $nombre){
				$item[$nombre]=[];
			}

			foreach ($segundo as $item2) {
				if ($item[$label[0]] == $item2[$label[0]]) {
					array_push($item[$nombres[0]], $item2);
				}
			}

			foreach ($tercero as $item3) {
				if ($item[$label[1]] == $item3[$label[1]]) {
					array_push($item[$nombres[1]], $item3);
				}
			}
	
			array_push($arreglo, $item);
		}

		return $arreglo;
	}

	public static function optenerIP(){
		return (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
	}

	public static function quitarCaracteres($url){
		$url = strtolower($url);
		$find = array('á', 'é', 'í', 'ó', 'ú', 'ñ', '_');
		$repl = array('a', 'e', 'i', 'o', 'u', 'n', '-');
		$url = str_replace ($find, $repl, $url);
		$find = array(' ', '&', '\r\n', '\n', '+');
		$url = str_replace ($find, '-', $url);
		$find = array('/[^a-z0-9\-<>]/', '/[\-]+/', '/<[^>]*>/');
		$repl = array('', '-', '');
		$url = preg_replace ($find, $repl, $url);
		return $url;
	}

	public static function formatearFecha($fecha){
		$separarFecha = explode('-',$fecha);
		$anyo         = $separarFecha[0];
		$mes          = $separarFecha[1];
		$dia          = $separarFecha[2];
		$mesEnLetra   = self::obtenerMes($mes);
		return $dia." de ".$mesEnLetra." de ".$anyo; 
	}

	public static function formatearFechaHora($fechaFor){ //2015-08-09 09:45:08
		$separarfech = explode('-',$fechaFor);
		$anyo        = $separarfech[0];
		$mes         = $separarfech[1];
		$dia         = $separarfech[2];
		$dia         = substr($separarfech[2], 0, 2);
		$hora        = substr($separarfech[2], 3, 5);//no trae los segundos
		$mesEnLetra   =self::obtenerMes($mes);
		return $dia." de ".$mesEnLetra." de ".$anyo." a las ".$hora; 
	}

	public static function obtenerMes($mes){
		$meses = [
			'01' => 'enero',
			'02' => 'febrero',
			'03' => 'marzo',
			'04' => 'abril',
			'05' => 'mayo',
			'06' => 'junio',
			'07' => 'julio',
			'08' => 'agosto',
			'09' => 'septiembre',
			'10' => 'octubre',
			'11' => 'noviembre',
			'12' => 'diciembre',
		];
		return $meses[$mes] ?? '';
	}

    public static function validarContrasena($contrasena) {
		$success = false;
		$message = '';
		// Verifica la longitud de la contraseña
		if (strlen($contrasena) < 8 || strlen($contrasena) > 20) {		
			$message = 'Debe tener entre 8 y 20 caracteres de longitud';
			return array($success, $message );
		}

		// Verifica si hay al menos una letra mayúscula
		if (!preg_match('/[A-Z]/', $contrasena)) {
			$message = 'Debe incluir al menos una letra mayúscula';
			return array($success, $message );
		}

		// Verifica si hay al menos una letra minúscula
		if (!preg_match('/[a-z]/', $contrasena)) {
			$message = 'Debe incluir al menos una letra minúscula';
			return array($success, $message );
		}

		// Verifica si hay al menos un número
		if (!preg_match('/[0-9]/', $contrasena)) {
			$message = 'Debe contener al menos un número';
			return array($success, $message );
		}

		// Verifica si hay al menos un carácter especial
		if (!preg_match('/[\!\@\#\$\%\^\&\*\(\)\-\_\+\=\[\]\{\}\|\:\;\,\.\<\>\/\?]/', $contrasena)) {
			$message = 'Debe incluir al menos un carácter especial o el carácter no esta soportado';
			return array($success, $message );
		}

		// Si pasa todas las validaciones, la contraseña es válida
		$success = true;
		return array($success, $message );
	}
}