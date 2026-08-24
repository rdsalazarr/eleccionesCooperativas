<?php

namespace App\Util;

class ProcesadorImagen
{
	public static function optimizarDimensiones($archivo, $ancho, $altura){

        $datos = getimagesize($archivo);

        ini_set('memory_limit', '-1');
        if ($datos[2] == 1) {
            $img = @imagecreatefromgif($archivo);
        }
        if ($datos[2] == 2) {
            $img = @imagecreatefromjpeg($archivo);
        }
        if ($datos[2] == 3) {
            $img = @imagecreatefrompng($archivo);
        }
        if ($datos[2] == 18) {
            $img = @imagecreatefromwebp($archivo);
        }

        $thumb = imagecreatetruecolor($ancho, $altura);

        // Configura el manejo de la transparencia para imágenes PNG
        if ($datos[2] == 3) {
            imagealphablending($thumb, false);
            imagesavealpha($thumb, true);
            $transparentindex = imagecolorallocatealpha($thumb, 0, 0, 0, 127);
            imagefill($thumb, 0, 0, $transparentindex);
        }

        imagecopyresampled($thumb, $img, 0, 0, 0, 0, $ancho, $altura, $datos[0], $datos[1]);

        // miniatura en disco
        if ($datos[2] == 1) {
            imagegif($thumb, $archivo);
        }

        if ($datos[2] == 2) {
            imagejpeg($thumb, $archivo, 75); // 100 es la calidad
        }

        if ($datos[2] == 3) {
            imagepng($thumb, $archivo, 9); // 0 significa sin compresión
        }

        imagedestroy($thumb);
	}
}