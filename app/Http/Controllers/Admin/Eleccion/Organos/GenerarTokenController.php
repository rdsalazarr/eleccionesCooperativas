<?php

namespace App\Http\Controllers\Admin\Eleccion\Organos;

use App\Models\Eleccion\Organos\Token;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use Throwable, DB, Log;

class GenerarTokenController extends Controller
{
    public function salve(Request $request)
    {
        DB::beginTransaction();
        try {

            $delegados      = DB::table('delegado')->where('deleactivo', true)->get();
            $cantidadTokens = $delegados->count();

            if ($cantidadTokens === 0) {
                return response()->json(['success' => false, 'message' => 'No existen delegados disponibles para generar tokens.' ]);
            }

            // Limpiar los tokens anteriores
            DB::table('token')->delete();

            // Generar tokens únicos
            $tokens = range(100, 999);
            shuffle($tokens);

            $tokens = array_slice($tokens, 0, $cantidadTokens);
            $ahora  = now();

            $registros = array_map(function ($token) use ($ahora) {
                return [
                    'toketoken'  => $token,
                    'created_at' => $ahora,
                    'updated_at' => $ahora,
                ];
            }, $tokens);

            DB::table('token')->insert($registros);

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Tokens generados con éxito. Se han generados '.$cantidadTokens.' tokens.']);
        } catch (Throwable $e) {
            DB::rollBack();
            Log::error($e->getMessage());
            return response()->json(['success' => false,'message' => 'Ocurrió un error al generar los tokens.']);
        }
    }

    public function showPdf(Request $request)
	{
        try {

            $tokens  = DB::table('token')->select('toketoken')->get();
            $dataPdf = GenerarPdf::generarToken($tokens,  'S');

			return response()->json(['success' => true, "data" => $dataPdf]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al generar el PDF de los tokens generado ']);
		}
    }
}