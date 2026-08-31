<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Home\FrondController;
use App\Http\Controllers\Admin\DashboardController;

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
        Route::get('/admin/solicitud/{id}', [DashboardController::class, 'index']);
        Route::get('/admin/informes/{id}', [DashboardController::class, 'index']);
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

        Route::post('/cargar/asociados/salve', [CargarAsociadoController::class, 'salve']);//->middleware(['security:admin/gestionar/cargarAsociado']);
        Route::post('/cargar/asociados/verificar', [CargarAsociadoController::class, 'verificar']);
        Route::post('/cargar/asociados/procesar', [CargarAsociadoController::class, 'procesar']);

        Route::get('/asociados/list', [AsociadoController::class, 'index']);//->middleware(['security:admin/gestionar/asociado','verifySource']);
        Route::post('/asociados/list/datos', [AsociadoController::class, 'datos']);
        Route::post('/asociados/salve', [AsociadoController::class, 'salve']);
        Route::post('/asociados/destroy', [AsociadoController::class, 'destroy']);
        



    });

}); 

Route::get('/eliminar', [MantenimientoController::class, 'clear']);
Route::get('/correo', [MantenimientoController::class, 'email']);
Route::get('/generar/pdf', [MantenimientoController::class, 'Pdf']);
Route::middleware(['auth'])->group(function () {
    Route::get('/mantenimiento', [MantenimientoController::class, 'down']);
    Route::get('/up/mantenimiento', [MantenimientoController::class, 'up']);
}); 