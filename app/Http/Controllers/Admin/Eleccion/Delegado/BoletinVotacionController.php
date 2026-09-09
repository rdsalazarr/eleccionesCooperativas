<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Services\VotacionDelegadoService;
use App\Models\Eleccion\Delegado\Boletin;
use App\Http\Controllers\Controller;
use Throwable, DB, Log, Auth;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\Empresa;
use Carbon\Carbon;

class BoletinVotacionController extends Controller
{
    public function index()
    {
        try {

            $eleccion = DB::table('elecciondelegado')
                                ->select('eledelid','eledeltitulo','eledelperiodo','eledelabrireleccion','eledelcerrareleccion')
                                ->where('eledelanio', date('Y'))->first();

            $titulo         = 'No hay gestiones de elecciones realizadas';
            $habilitarBoton = false;
            $ocultarBoton   = false;
            $informes       = [];
            if ($eleccion) {
                $contenidoEleccion = mb_strtolower($eleccion->eledeltitulo, 'UTF-8').' '.$eleccion->eledelperiodo;
                $titulo            = 'Generar boletín de '. $contenidoEleccion;
                if($eleccion->eledelcerrareleccion){
                   $titulo       = 'No es posible generar boletín para '. $contenidoEleccion;
                   $ocultarBoton = true;
                }
                $habilitarBoton = (bool) $eleccion->eledelabrireleccion && !(bool) $eleccion->eledelcerrareleccion;

                $informes = DB::table('elecciondelegadoboletin as edb')
                                ->select('edb.eldeboid','edb.eldebofechahora','edb.eldebototalvotos',
                                    DB::raw("CONCAT(LPAD(edb.eldebonumeroboletin,  2, 0)) as numeroBoletin"),
                                    DB::raw("CONCAT_WS(' ', u.usuanombre, u.usuaapellidos) as usuario"))
                                ->join('usuario as u', 'u.usuaid', '=', 'edb.usuaid')
                                ->where('edb.eledelid', $eleccion->eledelid)
                                ->orderByDesc('edb.eldeboid')
                                ->get();
            }

            return response()->json(['success' => true, 'data' => $informes, 'titulo' => $titulo, 'habilitarBoton' => $habilitarBoton, 'ocultarBoton' => $ocultarBoton]);
        } catch (Throwable $e) {
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'message' => 'Error al obtener la lista de informes de la votación de delegados']);
        }
    }

    public function salve(Request $request, VotacionDelegadoService $service)
	{
        DB::beginTransaction();
        try {

            $eleccionDelegado   = DB::table('elecciondelegado')->select('eledelid')->where('eledelanio', date('Y'))->first();
            $eleccionDelegadoId = $eleccionDelegado->eledelid;

            $empresa       = Empresa::informacion();
            $numeroBoletin = str_pad(Boletin::obtenerConsecutivo($eleccionDelegadoId), 2, '0', STR_PAD_LEFT);
            $data          = $service->resultadosEleccionDelegados($numeroBoletin);

            $dataPdf       = GenerarPdf::resultadosEleccionDelegados($data, $empresa, 'F');

            $eleccionDelegadoBoletin                      = new Boletin();
			$eleccionDelegadoBoletin->usuaid              = Auth::id();
            $eleccionDelegadoBoletin->eledelid            = $eleccionDelegadoId;
            $eleccionDelegadoBoletin->eldebofechahora     = Carbon::now();
            $eleccionDelegadoBoletin->eldebonumeroboletin = $numeroBoletin;
            $eleccionDelegadoBoletin->eldebototalvotos    = $dataPdf['totalVotos'];
            $eleccionDelegadoBoletin->eldeborutaarchivo   = $dataPdf['rutaPDF'];
			$eleccionDelegadoBoletin->save();

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de Boletin en la elección de delegado']);
		}
    }

    public function imprimir(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $boletin = DB::table('elecciondelegadoboletin')->select('eldeborutaarchivo')->where('eldeboid', $request->codigo)->first();
            if (!$boletin || empty($boletin->eldeborutaarchivo)) {
                return response()->json(['success' => false, 'message' => 'El boletin no existe o no tiene un archivo asociado.']);
            }

            $rutaFisica = public_path('archivos/pdf/boletin/'.$boletin->eldeborutaarchivo);

            if (!file_exists($rutaFisica)) {
                return response()->json(['success' => false, 'message' => 'El archivo físico no se encuentra en el servidor.']);
            }

            $contenidoPdf = file_get_contents($rutaFisica);
            $dataPdfBase64 = base64_encode($contenidoPdf);

			return response()->json(['success' => true, "data" => $dataPdfBase64]);
		} catch (Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al obtener el PDF generado durante el inforem ']);
		}
	}
}