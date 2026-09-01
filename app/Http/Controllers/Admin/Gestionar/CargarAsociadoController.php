<?php

namespace App\Http\Controllers\Admin\Gestionar;

use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Gestionar\Asociado;
use App\Imports\AsociadosImport;
use Illuminate\Http\Request;
use Throwable, DB, Log;

class CargarAsociadoController extends Controller
{
    public function procesarArchivo(Request $request)
    {
        $request->validate(['archivo' => 'required|mimes:csv,xls,xlsx|max:2000']);

        try {
            DB::table('asociadotemporal')->truncate();

            Excel::import(new AsociadosImport(), $request->file('archivo') );

            return response()->json(['success' => true, 'message' => 'Asociados procesados con éxito']);

        } catch (Throwable $e) {

            Log::error('Error al procesar archivo de asociados', [
                'message' => $e->getMessage(),
                'file'    => $e->getFile(),
                'line'    => $e->getLine(),
            ]);

            return response()->json(['success' => false, 'message' => 'Error al procesar el archivo: ' . $e->getMessage()], 500);
        }
    }

    public function verificar()
	{
		try{
			$data = DB::table('asociadotemporal')
						->select('asotemagencia','asotemtipodocumento','asotemnumero','asotemnombrecompleto','asotemfechanacimiento',
                            'asotemtelefono', 'asotememail','asotemcelular','asotemfechaexpedicion')
						->orderBy('asotemnombrecompleto')->get();

			return response()->json(['success' => true, "data" => $data]);
		}catch(Throwable $e){
			Log::error($e->getMessage());
			return response()->json(['success' => false, 'message' => 'Error al obtener la información de los asociados para la verificación']);
		}
	}

    public function procesar(Request $request)
    {
        $asociadosTemporales = DB::table('asociadotemporal')->get();
        if ($asociadosTemporales->isEmpty()) {
            return response()->json(['success' => false, 'message' => 'No existen registros para procesar' ]);
        }

        try {

            DB::transaction(function () use ($asociadosTemporales) {

                DB::table('asociado')->update(['asocactivo' => false ]);

                $asociados     = [];
                //$tipoDocumento = [1 => 'TI', 2 => 'CC', 3 => 'RC', 4 => 'Nit'];
                $tipoDocumento = [
                    'TI - Tarjeta de identidad'                 => 1,
                    'CC - Cédula de ciudadanía'                 => 2,
                    'RC'                                        => 3,
                    'NIT - Número de identificación tributaria' => 4,
                ];

                foreach ($asociadosTemporales as $asociadoTemporal) {

                    $documento = $this->normalizarNumero($asociadoTemporal->asotemnumero);

                    if (empty($documento)) {
                        continue;
                    }

                    $asociados[] = [
                        'asocnumerodocumento' => $documento,
                        'tipideid'            => $tipoDocumento[trim($asociadoTemporal->asotemtipodocumento)] ?? null,
                        'agenid'              => $asociadoTemporal->asotemagencia === 'Principal' ? 1 : 2,
                        'asocnombrecompleto'  => mb_strtoupper(trim($asociadoTemporal->asotemnombrecompleto),'UTF-8'),
                        'asocfechanacimiento' => $asociadoTemporal->asotemfechanacimiento,
                        'asocfechaexpedicion' => $asociadoTemporal->asotemfechaexpedicion,
                        'asoctelefono'        => $this->normalizarNumero($asociadoTemporal->asotemtelefono),
                        'asoccelular'         => $this->normalizarNumero($asociadoTemporal->asotemcelular),
                        'asocemail'           => trim($asociadoTemporal->asotememail),
                        'asocactivo'          => true,
                    ];
                }

                foreach (array_chunk($asociados, 1000) as $lote) {
                    DB::table('asociado')->upsert(
                        $lote,
                        ['asocnumerodocumento'],
                        [
                            'tipideid',
                            'agenid',
                            'asocnombrecompleto',
                            'asocfechanacimiento',
                            'asocfechaexpedicion',
                            'asoctelefono',
                            'asoccelular',
                            'asocemail',
                            'asocactivo',
                        ]
                    );
                }
            });

            DB::table('asociadotemporal')->truncate();

            return response()->json(['success' => true, 'message' => 'Proceso realizado con éxito']);
        } catch (Throwable $e) {
            Log::error('Error al procesar asociados temporales', [
                'message' => $e->getMessage(),
                'file'    => $e->getFile(),
                'line'    => $e->getLine(),
            ]);

            return response()->json(['success' => false, 'message' => 'Error al procesar la lista de asociados temporales'], 500);
        }
    }

    private function normalizarNumero($valor): ?string
    {
        if ($valor === null || $valor === '') {
            return null;
        }

        if (is_numeric($valor)) {
            return (string) intval($valor);
        }

        return trim((string) $valor);
    }
}