<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BienController;
use App\Http\Controllers\MarcaController;
use App\Http\Controllers\PersonaController;
use App\Http\Controllers\ReportesController;
use App\Http\Controllers\MovimientoController;
use App\Http\Controllers\DenominacionController;
use App\Http\Controllers\SubcoordinacionController;
use App\Http\Controllers\DependenciaUsuariaController;
use App\Http\Controllers\UnidadAdministrativaController;
use App\Http\Controllers\DetalleTipoMovimientoController;
use App\Http\Controllers\TipoDependenciaUsuariaController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::resource('marcas', MarcaController::class);
Route::resource('personas', PersonaController::class);

// desglose el resource de subcoordinacions por que tenia algo en mente, de pasar al momento de crear recibir por parametro el {coordinacion} pero al final me dio pereza
Route::get('subcoordinacions', [SubcoordinacionController::class, 'index'])->name('subcoordinacions.index');
Route::get('subcoordinacions/create', [SubcoordinacionController::class, 'create'])->name('subcoordinacions.create');
Route::get('subcoordinacions/porCoordinacion/{coordinacion}/', [SubcoordinacionController::class, 'porCoordinacion'])->name('subcoordinacions.porCoordinacion');
Route::post('subcoordinacions', [SubcoordinacionController::class, 'store'])->name('subcoordinacions.store');
Route::get('subcoordinacions/{subcoordinacion}', [SubcoordinacionController::class, 'show'])->name('subcoordinacions.show');
Route::get('subcoordinacions/{subcoordinacion}/edit', [SubcoordinacionController::class, 'edit'])->name('subcoordinacions.edit');
Route::put('subcoordinacions/{subcoordinacion}', [SubcoordinacionController::class, 'update'])->name('subcoordinacions.update');
Route::delete('subcoordinacions/{subcoordinacion}', [SubcoordinacionController::class, 'destroy'])->name('subcoordinacions.destroy');







Route::resource('unidadAdministrativas',UnidadAdministrativaController::class);
Route::get('unidadAdministrativas/ConDependenciaAlmacen/{id}', [UnidadAdministrativaController::class, 'ConDependenciaAlmacen']);
Route::resource('dependenciaUsuarias',DependenciaUsuariaController::class);
Route::get('dependenciaUsuarias/porUnidadAdministrativa/{id}', [DependenciaUsuariaController::class, 'porUnidadAdministrativa']);
Route::get('tipoDependenciaUsuarias/porUnidadAdministrativa/{id}', [TipoDependenciaUsuariaController::class, 'porUnidadAdministrativa']);
Route::get('denominacions/porCategoria/{id}', [DenominacionController::class, 'porCategoria']);
Route::resource('biens',BienController::class);
Route::resource('movimientos',MovimientoController::class);
Route::get('detalleTipoMovimientos/porTipoMovimiento/{id}',  [DetalleTipoMovimientoController::class, 'porTipoMovimiento'] );
Route::post('reportes/inventario', [ReportesController::class, 'inventario'] );
