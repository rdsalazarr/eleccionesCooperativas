<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Home\FrondController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Security\MantenimientoController;

use App\Http\Controllers\Admin\Configurar\RolController;
use App\Http\Controllers\Admin\Configurar\ActaController;
use App\Http\Controllers\Admin\Configurar\ModuloController;
use App\Http\Controllers\Admin\Configurar\EmpresaController;

use App\Http\Controllers\Admin\Configurar\FuncionalidadController;
use App\Http\Controllers\Admin\Configurar\ConfiguracionCorreoController;
use App\Http\Controllers\Admin\Configurar\NotificacionCorreoController;

use App\Http\Controllers\Admin\Gestionar\UsuarioController;
use App\Http\Controllers\Admin\Gestionar\AsociadoController;
use App\Http\Controllers\Admin\Gestionar\TipoOrganoController;
use App\Http\Controllers\Admin\Gestionar\PerfilUsuarioController;
use App\Http\Controllers\Admin\Gestionar\OrganoEleccionController;
use App\Http\Controllers\Admin\Gestionar\CargarAsociadoController;

use App\Http\Controllers\Admin\Eleccion\Delegado\GestionController;
use App\Http\Controllers\Admin\Eleccion\Delegado\AbrirVotacionController;
use App\Http\Controllers\Admin\Eleccion\Delegado\InformeVotacionController;
use App\Http\Controllers\Admin\Eleccion\Delegado\ImprimirVotacionController;
use App\Http\Controllers\Admin\Eleccion\Delegado\RegistrarAspiranteController;
use App\Http\Controllers\Admin\Eleccion\Delegado\JuradosController as JuradosDelegadoController;

use App\Http\Controllers\Admin\Eleccion\Organos\DelegadosController;
use App\Http\Controllers\Admin\Eleccion\Organos\InformacionController;
use App\Http\Controllers\Admin\Eleccion\Organos\GenerarTokenController;
use App\Http\Controllers\Admin\Eleccion\Organos\GenerarVotacionController;
use App\Http\Controllers\Admin\Eleccion\Organos\JuradosController as JuradosOrganosController;


Route::get('/', [FrondController::class, 'index']);
Route::post('/login',[LoginController::class, 'login'])->name('login');
Route::match(array('GET', 'POST'),'/logout',[LoginController::class, 'logout'])->name('logout');

Route::middleware(['auth'])->group(function () {//'revalidate',
    Route::get('dashboard', [DashboardController::class, 'index']);
    Route::get('reset', [DashboardController::class, 'reset']);
    Route::post('admin/generar/menu', [DashboardController::class, 'menu']);
    Route::get('admin/welcome', [DashboardController::class, 'welcome']);//->middleware(['verifySource'])

    Route::middleware(['preload'])->group(function (){//para recargar la pagina con f5
        Route::get('/admin/{id}', [DashboardController::class, 'index']);
        Route::get('/admin/configurar/{id}', [DashboardController::class, 'index']);
        Route::get('/admin/gestionar/{id}', [DashboardController::class, 'index']);
        Route::get('/admin/eleccionDelegado/{id}', [DashboardController::class, 'index']);
        Route::get('/admin/organosEleccion/{id}', [DashboardController::class, 'index']);
    });

    Route::prefix('admin')->group(function(){
        Route::get('/modulo/list', [ModuloController::class, 'index']);//->middleware(['security:admin/configurar/menu','verifySource']);
        Route::post('/modulo/salve', [ModuloController::class, 'salve']);
        Route::post('/modulo/destroy', [ModuloController::class, 'destroy']);

        Route::get('/funcionalidad/list', [FuncionalidadController::class, 'index']);//->middleware(['security:admin/configurar/menu','verifySource']);
        Route::post('/funcionalidad/listar/modulos', [FuncionalidadController::class, 'modulos']);
        Route::post('/funcionalidad/salve', [FuncionalidadController::class, 'salve']);
        Route::post('/funcionalidad/destroy', [FuncionalidadController::class, 'destroy']);

        Route::get('/rol/list', [RolController::class, 'index']);//->middleware(['security:admin/configurar/roles','verifySource']);
        Route::post('/rol/listar/funcionalidad', [RolController::class, 'funcionalidades']);
        Route::post('/rol/salve', [RolController::class, 'salve']);
        Route::post('/rol/destroy', [RolController::class, 'destroy']);

        Route::get('/notificacion/correo/list', [NotificacionCorreoController::class, 'index']);//->middleware(['security:admin/configurar/correo','verifySource']);
        Route::post('/notificacion/correo/salve', [NotificacionCorreoController::class, 'salve']);
        Route::post('/notificacion/correo/destroy', [NotificacionCorreoController::class, 'destroy']);

        Route::get('/configuracion/correo/list', [ConfiguracionCorreoController::class, 'index']);//->middleware(['security:admin/configurar/correo','verifySource']);
        Route::post('/configuracion/correo/salve', [ConfiguracionCorreoController::class, 'salve']);

        Route::get('/empresa/list', [EmpresaController::class, 'index']);//->middleware(['security:admin/configurar/empresa','verifySource']);
        Route::post('/empresa/salve', [EmpresaController::class, 'salve']);

        Route::get('/acta/list', [ActaController::class, 'index']);//->middleware(['security:admin/configurar/acta','verifySource']);
        Route::post('/acta/salve', [ActaController::class, 'salve']);
        Route::post('/acta/destroy', [ActaController::class, 'destroy']);

        Route::post('/usuario/list', [UsuarioController::class, 'index']);//->middleware(['security:admin/gestionar/usuario','verifySource']);
        Route::post('/usuario/list/datos', [UsuarioController::class, 'datos']);
        Route::post('/usuario/salve', [UsuarioController::class, 'salve']);
        Route::post('/usuario/destroy', [UsuarioController::class, 'destroy']);

        Route::get('/usuario/data', [PerfilUsuarioController::class, 'index']);
        Route::get('/usuario/consultar/perfil', [PerfilUsuarioController::class, 'perfil']);
        Route::post('/usuario/actualizar/perfil', [PerfilUsuarioController::class, 'updatePerfil']);
        Route::post('/usuario/actualizar/password', [PerfilUsuarioController::class, 'updatePassword']);

        Route::get('/tipo/organo/list', [TipoOrganoController::class, 'index']);//->middleware(['security:admin/configurar/tipos','verifySource']);
        Route::post('/tipo/organo/salve', [TipoOrganoController::class, 'salve']);
        Route::post('/tipo/organo/destroy', [TipoOrganoController::class, 'destroy']);

        Route::get('/organo/eleccion/list', [OrganoEleccionController::class, 'index']);//->middleware(['security:admin/configurar/organos','verifySource']);
        Route::post('/organo/eleccion/list/datos', [OrganoEleccionController::class, 'datos']);
        Route::post('/organo/eleccion/salve', [OrganoEleccionController::class, 'salve']);
        Route::post('/organo/eleccion/destroy', [OrganoEleccionController::class, 'destroy']);

        Route::post('/cargar/asociados/salve', [CargarAsociadoController::class, 'procesarArchivo']);//->middleware(['security:admin/gestionar/cargarAsociado']);
        Route::post('/cargar/asociados/verificar', [CargarAsociadoController::class, 'verificar']);
        Route::post('/cargar/asociados/procesar', [CargarAsociadoController::class, 'procesar']);

        Route::get('/asociados/list', [AsociadoController::class, 'index']);//->middleware(['security:admin/gestionar/asociado','verifySource']);
        Route::post('/asociados/list/datos', [AsociadoController::class, 'datos']);
        Route::post('/asociados/salve', [AsociadoController::class, 'salve']);
        Route::post('/asociados/destroy', [AsociadoController::class, 'destroy']);

        Route::prefix('eleccion/delegado')->group(function(){
            Route::get('/gestion/list', [GestionController::class, 'index']);//->middleware(['security:admin/eleccionDelegado/gestion','verifySource']);
            Route::post('/gestion/asignar/jurados/list', [GestionController::class, 'juradosAsignados']);
            Route::post('/gestion/asignar/jurados/salve', [GestionController::class, 'asignarJurados']);
            Route::post('/gestion/list/datos', [GestionController::class, 'datos']);
            Route::post('/gestion/salve', [GestionController::class, 'salve']);
            Route::post('/gestion/visualizar', [GestionController::class, 'show']);
            Route::post('/gestion/destroy', [GestionController::class, 'destroy']);

            Route::get('/registrar/aspirante/list', [RegistrarAspiranteController::class, 'index']);//->middleware(['security:admin/eleccionDelegado/registrarAspirante','verifySource']);
            Route::post('/registrar/aspirante/list/datos', [RegistrarAspiranteController::class, 'datos']);
            Route::post('/registrar/aspirante/salve', [RegistrarAspiranteController::class, 'salve']);
            Route::post('/registrar/aspirante/ver/PDF', [RegistrarAspiranteController::class, 'showPdf']);
            Route::post('/registrar/aspirante/imprimir/lista',[RegistrarAspiranteController::class, 'imprimirLista']);    

            Route::get('/abrir/votacion/list', [AbrirVotacionController::class, 'index']);//->middleware(['security:admin/eleccionDelegado/abrirVotacion','verifySource']);
            Route::post('/generar/acta/inicio/PDF', [AbrirVotacionController::class, 'actaInicio']);
            Route::post('/generar/acta/cierre/PDF', [AbrirVotacionController::class, 'actaCierre']);

            Route::get('/imprimir/actas/list', [ImprimirVotacionController::class, 'index']);//->middleware(['security:admin/eleccionDelegado/imprimirActas','verifySource']);

            Route::get('/informes/list', [InformeVotacionController::class, 'index']);//->middleware(['security:admin/eleccionDelegado/informeVotacion','verifySource']);

        });

        Route::prefix('organos/eleccion')->group(function(){
            Route::get('/delegados/list', [DelegadosController::class, 'index']);//->middleware(['security:admin/organosEleccion/generarToken','verifySource']);

            Route::get('/generar/token/list', [GenerarTokenController::class, 'index']);//->middleware(['security:admin/organosEleccion/generarToken','verifySource']);

            Route::get('/informacion/list', [InformacionController::class, 'index']);//->middleware(['security:admin/organosEleccion/informacion','verifySource']);

            Route::get('/jurados/list', [JuradosOrganosController::class, 'index']);//->middleware(['security:admin/organosEleccion/jurados','verifySource']);

            Route::get('/abrir/votacion/list', [GenerarVotacionController::class, 'index']);//->middleware(['security:admin/organosEleccion/abrirVotacion','verifySource']);

        });
    });

}); 

Route::get('/eliminar', [MantenimientoController::class, 'clear']);
Route::get('/correo', [MantenimientoController::class, 'email']);
Route::get('/generar/pdf', [MantenimientoController::class, 'Pdf']);
Route::middleware(['auth'])->group(function () {
    Route::get('/mantenimiento', [MantenimientoController::class, 'down']);
    Route::get('/up/mantenimiento', [MantenimientoController::class, 'up']);
}); 