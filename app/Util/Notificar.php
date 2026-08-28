<?php

namespace App\Util;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use DB, URL;

class Notificar
{
    public static function correo($correos = [], $asunto = '', $msg = '', $adjuntos = [], $correoDependencia = '', $enviarCopia = '', $enviarPiePagina = '', $nombreEmpresa = 'IMPLESOFT S.A.S.')
	{	
		$mail                = new PHPMailer(true);	
        $configuracioncorreo = DB::table('informacionconfiguracioncorreo')->select('incocohost','incocousuario','incococlaveapi','incocopuerto')->where('incocoid', 1)->first();
		$host                = $configuracioncorreo->incocohost;
		$usuario             = $configuracioncorreo->incocousuario;
		$password            = $configuracioncorreo->incococlaveapi;
		$puerto              = $configuracioncorreo->incocopuerto;

		try {
			$mail->SMTPDebug  = 0;
			$mail->isSMTP();
			$mail->SMTPAuth   = true; 
			$mail->charSet 	  = "UTF-8";
			$mail->Host       = $host;
			$mail->Username   = $usuario;
			$mail->Password   = $password; 
			$mail->SMTPSecure = 'SSL';
			$mail->Port       = $puerto;

			$mail->setFrom($usuario, utf8_decode('Notificación del sistema de Elecciones de '.$nombreEmpresa));

			foreach ($correos as $email) {
				$mail->addAddress($email);
			}

			if($enviarCopia == 1){//copia de la oculta
				$mail->addBCC($correoDependencia);
			}

			if (is_array($adjuntos) && count($adjuntos) > 0) {
				foreach ($adjuntos as $adjunto) {
					if (file_exists($adjunto)) {
						$mail->addAttachment($adjunto);
					}
				}
			}

			$piePagina = ($enviarPiePagina == 1) ? self::consultarPiePagina() : '';

			$mail->isHTML(true);
			$mail->Subject = utf8_decode($asunto);
			$mail->Body    = utf8_decode(self::htmlCorreo($msg, $piePagina, $nombreEmpresa));
			$mail->AltBody = $msg;
			$mail->send();
			$mail->ClearAttachments();
			$mail->ClearAllRecipients();

			return implode(",", $correos);

		}catch (Exception $e) {
			return "No se puedo enviar el correo. Error: ".$mail->ErrorInfo;
		}
	}

	public static function htmlCorreo($body, $piePagina = '', $nombreEmpresa = '')
	{	
		$esDevelopment    = env('APP_ENV') === 'local' || env('APP_ENV') === 'development';
		$avisoDevelopment = $esDevelopment ? self::obtenerAvisoDevelopment() : '';
		
		$html = <<<HTML
				<!DOCTYPE html>
				<html>
				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<style>
						body {
							font-family: Arial, sans-serif;
							margin: 0;
							padding: 0;
							background-color: #f5f5f5;
						}
						.contenedor-principal {
							max-width: 90%;
							margin: 0 auto;
							background-color: #ffffff;
							border: 1px solid #e4e4e4;
							border-radius: 10px;
							overflow: hidden;
							border-left: 4px solid #3489ba;
							box-shadow: 0 2px 4px rgba(0,0,0,0.1);
						}
						.encabezado {
							background: linear-gradient(135deg, #003A78 0%, #005BA3 100%);
							text-align: center;
							padding: 10px 10px;
							color: #ffffff;
							margin: 5px;
							border-radius: 10px;
						}
						.encabezado h1 {
							margin: 0;
							font-size: 24px;
							font-weight: bold;
							letter-spacing: 0.5px;
						}
						.contenido {
							padding: 30px 20px;
							color: #3c3838;
							line-height: 1.6;
							text-align: justify;
						}
						.contenido p {
							margin: 10px 0;
						}
						.aviso-development {
							background-color: #fff3cd;
							border-left: 4px solid #ffc107;
							padding: 15px;
							margin: 20px 0;
							border-radius: 10px;
							color: #856404;
							font-weight: 500;
						}
						.aviso-development strong {
							display: block;
							margin-bottom: 5px;
						}
						.pie-pagina {
							background-color: #f9f9f9;
							border-top: 1px solid #e4e4e4;
							padding: 15px 20px;
							font-size: 12px;
							color: #8c8c8c;
							text-align: justify;
						}
						.pie-pagina ol {
							margin: 10px 0;
							padding-left: 20px;
						}
						.pie-pagina li {
							margin: 5px 0;
							line-height: 1.5;
						}
						@media (max-width: 600px) {
							.contenedor-principal {
								border-radius: 0;
							}
							.contenido {
								padding: 20px 15px;
							}
							.encabezado h1 {
								font-size: 20px;
							}
						}
					</style>
				</head>
				<body>
					<div class="contenedor-principal">
						<div class="encabezado">
							<h1>Notificación del sistema de Elecciones de {$nombreEmpresa}</h1>
						</div>
						
						<div class="contenido">
							{$body}
							{$avisoDevelopment}
						</div>
						
						<div class="pie-pagina">
							{$piePagina}
						</div>
					</div>
				</body>
				</html>
				HTML;

		return $html;
	}

	private static function obtenerAvisoDevelopment()
	{
		return '<div class="aviso-development">
					<strong> Entorno de Desarrollo</strong>
					Estamos actualmente en la fase de desarrollo de un sistema de Eleecciones. 
					Si ha recibido este correo, le solicitamos gentilmente que lo ignore, ya que se trata únicamente 
					de una prueba de funcionamiento.
				</div>';
	}

	public static function consultarPiePagina()
	{
		$informacionCorreo = DB::table('informacionnotificacioncorreo')
								->select('innococontenido')
								->where('innocoid', 1)->first();

		return $informacionCorreo->innococontenido;
	}
}