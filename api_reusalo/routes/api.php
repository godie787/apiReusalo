<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriasController;
use App\Http\Controllers\ProductosController;
use App\Http\Controllers\TipoEventoController;
use App\Http\Controllers\EventosController;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\VentaController;

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('/categorias', CategoriasController::class);

Route::apiResource('/productos', ProductosController::class);

Route::apiResource('/tipos-eventos', TipoEventoController::class);

Route::apiResource('/eventos', EventosController::class);

Route::apiResource('/ventas', VentaController::class);

Route::apiResource('/usuarios', UsuarioController::class);