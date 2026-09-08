<?php

namespace App\Http\Controllers\Admin\Eleccion\Delegado;

use App\Services\VotacionDelegadoService;
use App\Models\Eleccion\Delegado\Informe;
use App\Http\Controllers\Controller;
use Throwable, DB, Log, Auth;
use Illuminate\Http\Request;
use App\Util\GenerarPdf;
use App\Util\Empresa;
use Carbon\Carbon;

class InformeVotacionController extends Controller
{
    public function index()
    {
        try {

            $eleccion = DB::table('elecciondelegado')
                                ->select('eledelid','eledeltitulo','eledelperiodo','eledelabrireleccion','eledelcerrareleccion')
                                ->where('eledelanio', date('Y'))->first();

            $titulo         = 'No hay gestiones de elecciones realizadas';
            $habilitarBoton = false;
            $informes       = [];
            if ($eleccion) {
                $titulo         = 'Informes de '. mb_strtolower($eleccion->eledeltitulo, 'UTF-8').' '.$eleccion->eledelperiodo;
                $habilitarBoton = (bool) $eleccion->eledelabrireleccion && !(bool) $eleccion->eledelcerrareleccion;

                $informes = DB::table('elecciondelegadoinforme as edi')
                                ->select('edi.eldeinid','edi.eldeinfechahora','edi.eldeinnumeroinforme','edi.eldeintotalvotos',
                                    DB::raw("CONCAT_WS(' ', u.usuanombre, u.usuaapellidos) as usuario"))
                                ->join('usuario as u', 'u.usuaid', '=', 'edi.usuaid')
                                ->where('edi.eledelid', $eleccion->eledelid)
                                ->orderByDesc('edi.eldeinid')
                                ->get();
            }

            return response()->json(['success' => true, 'data' => $informes, 'titulo' => $titulo, 'habilitarBoton' => $habilitarBoton]);
        } catch (Throwable $e) {
            dd($e);
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
            $numeroInforme = str_pad(Informe::obtenerConsecutivo($eleccionDelegadoId), 2, '0', STR_PAD_LEFT);
            $data          = $service->resultadosEleccionDelegados($numeroInforme);

            $dataPdf       = GenerarPdf::resultadosEleccionDelegados($data, $empresa);

            $eleccionDelegadoInforme                      = new Informe();
			$eleccionDelegadoInforme->usuaid              = Auth::id();
            $eleccionDelegadoInforme->eledelid            = $eleccionDelegadoId;
            $eleccionDelegadoInforme->eldeinfechahora     = Carbon::now();
            $eleccionDelegadoInforme->eldeinnumeroinforme = $numeroInforme;
            $eleccionDelegadoInforme->eldeintotalvotos    = $dataPdf['totalVotos'];
            $eleccionDelegadoInforme->eldeinrutaarchivo   = $dataPdf['rutaPDF'];
			$eleccionDelegadoInforme->save();

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            dd($e);
			DB::rollback();
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de informe en la elección de delegado']);
		}
    }

    public function imprimir(Request $request)
	{
		$request->validate(['codigo' => 'required']);
		try {

            $informe    = DB::table('elecciondelegadoinforme')->select('eldeinrutaarchivo')->where('eldeinid', $request->codigo)->first();
            if (!$informe || empty($informe->eldeinrutaarchivo)) {
                return response()->json(['success' => false, 'message' => 'El informe no existe o no tiene un archivo asociado.']);
            }

            $rutaFisica = public_path('archivos/pdf/informes/'.$informe->eldeinrutaarchivo);
           
            if (!file_exists($rutaFisica)) {
                return response()->json(['success' => false, 'message' => 'El archivo físico no se encuentra en el servidor.']);
            }

            $contenidoPdf = file_get_contents($rutaFisica);
            $dataPdfBase64 = base64_encode($contenidoPdf);

			return response()->json(['success' => true, "data" => $dataPdfBase64]);
		} catch (Throwable $e){
            dd($e);
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error al obtener el PDF generado durante el inforem ']);
		}
	}
}