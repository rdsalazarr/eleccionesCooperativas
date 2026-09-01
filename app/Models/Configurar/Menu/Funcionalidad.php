<?php

namespace App\Models\Configurar\Menu;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use App\Util\General;
use DB, Auth;

#[Fillable(['moduid', 'funcnombre','functitulo','funcruta', 'funcicono', 'funcorden','funcactiva'])]
class Funcionalidad extends Model
{
    protected $table      = 'funcionalidad';  
    protected $primaryKey = 'funcid';

    //Funcion que construye los menus recorriendo 
    public static function menus()
    {
        $consultaModulos = DB::table('modulo as m')
                                ->select('m.moduid','m.modunombre as nombre','m.moduicono as icono')
                                ->join('funcionalidad as f', 'f.moduid', '=','m.moduid')
                                ->join('rolfuncionalidad as rf', 'rf.rolfunfuncid', '=','f.funcid')
                                ->join('usuariorol as ur','ur.usurolrolid','=','rf.rolfunrolid')
                                ->where('ur.usurolusuaid', Auth::id());

                            if(Auth::id() != 2){
                                $consultaModulos = $consultaModulos->where('m.moduactivo', 1);
                            }

            $modulos = $consultaModulos->orderby('m.moduorden')->orderBy('m.modunombre')->distinct()->get();

        $arrayModulos = collect($modulos)->map(function($x){ 
                         return (array) $x;
                      })->toArray();

        $consultaMenu = DB::table('funcionalidad as f')
                            ->select('f.funcid as id','f.moduid','f.funcnombre as menu', 'f.functitulo as titulo', 'f.funcruta as ruta', 'f.funcicono as icono')->distinct()
                            ->join('rolfuncionalidad as rf', 'rf.rolfunfuncid', '=','f.funcid')
                            ->join('usuariorol as ur','ur.usurolrolid','=','rf.rolfunrolid')
                            ->where('ur.usurolusuaid', Auth::id());

                        if(Auth::id() != 2){
                            $consultaMenu = $consultaMenu->where('f.funcactiva', 1);
                        }

            $menus = $consultaMenu->orderby('f.funcorden')->orderBy('f.funcnombre')->get();

        $arrayMenus = collect($menus)->map(function($x){ 
                         return (array) $x; 
                      })->toArray();

        $label   = ['moduid'];
        $nombres = ['itemMenu'];

        return General::ordenarArray($arrayModulos, $label, $nombres, $arrayMenus);
    }
}