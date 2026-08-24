<?php

namespace App\Http\Controllers\Admin\Configurar;

use App\Http\Controllers\Controller;
use Throwable, DB, URL, Log, File;
use App\Models\Configurar\Empresa;
use App\Util\ProcesadorImagen;
use Illuminate\Http\Request;
use App\Util\General;
use Carbon\Carbon; 

class EmpresaController extends Controller
{
	public function index()
	{
        try{
            $data = DB::table('empresa as e')->select('e.emprid','e.emprnit','e.emprnombre','e.emprsigla','e.emprlema','e.emprdireccion',
                                'e.emprciudad','e.emprcorreo','e.emprtelefonofijo','e.emprtelefonocelular','e.emprurl','e.emprlogo',
                                DB::raw("CONCAT(IFNULL(e.emprtelefonocelular,''),' ',IFNULL(e.emprtelefonofijo,'')) as telefonos"),
                                DB::raw("CONCAT('".URL::to('/')."/archivos/images/logoIntitucion/', e.emprlogo ) as rutaLogo"))
                            ->get();

            return response()->json(['success' => true, "data" => $data]);
        }catch(Throwable $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'message' => 'Error al obtener la información de la empresa ']);
        }
    }

	public function salve(Request $request)
	{
        $emprid  = $request->codigo;
        $empresa = ($emprid != '000') ? Empresa::findOrFail($emprid) : new Empresa();

		$request->validate([
                'nit'        => 'required|string|min:6|max:15',
                'nombre'     => 'required|string|min:4|max:99',
                'sigla'      => 'nullable|string|min:4|max:20',
                'lema'       => 'nullable|string|min:4|max:100',
                'direccion'  => 'required|string|min:4|max:100',
                'ciudad'     => 'required|string|min:4|max:100',
                'correo'     => 'nullable|email|min:4|max:80',
                'telefono'   => 'nullable|max:20',
                'celular'    => 'nullable|max:20',
                'url'        => 'nullable|max:100',
                'logo'       => 'nullable|mimes:png|max:1000',
			]);

        DB::beginTransaction();
		try {

            if($request->hasFile('logo')){
                $rutaCarpeta    = public_path().'/archivos/images/logoIntitucion/';
                $carpetaServe   = (is_dir($rutaCarpeta)) ? $rutaCarpeta : File::makeDirectory($rutaCarpeta, $mode = 0775, true, true);
                $file           = $request->file('logo');
                $nombreOriginal = $file->getclientOriginalName();
                $filename       = pathinfo($nombreOriginal, PATHINFO_FILENAME);
                $extension      = pathinfo($nombreOriginal, PATHINFO_EXTENSION);
                $nombreLogoBD   = $request->nit.'_'.General::quitarCaracteres($filename).'.'.$extension;
                $file->move($rutaCarpeta, $nombreLogoBD);
                ProcesadorImagen::optimizarDimensiones($rutaCarpeta.'/'.$nombreLogoBD, 160, 110);
            }else{
                $nombreLogoBD = $empresa->emprescudo;
            }

            $empresa->emprnombre          = $request->nombre;
            $empresa->emprsigla           = $request->sigla;
            $empresa->emprlema            = $request->lema;
            $empresa->emprdireccion       = $request->direccion;
            $empresa->emprciudad          = $request->ciudad;
            $empresa->emprcorreo          = $request->correo;
            $empresa->emprtelefonofijo    = $request->telefono;
            $empresa->emprtelefonocelular = $request->celular;
            $empresa->emprurl             = $request->url;
            $empresa->emprlogo            = $nombreLogoBD;
            $empresa->save(); 

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Registro almacenado con éxito']);
		} catch (Throwable $e){
            DB::rollback();
            Log::error($e->getMessage());
			return response()->json(['success' => false, 'message'=> 'Ocurrio un error en el registro de la actualización de la empresa ']);
		}
	}
}