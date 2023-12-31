<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/shifts', [\App\Http\Controllers\TabelController::class, 'createShift']);
Route::put('/shifts/{id}', [\App\Http\Controllers\TabelController::class, 'updateShift']);
Route::delete('/shifts/{id}', [\App\Http\Controllers\TabelController::class, 'deleteShift']);

Route::apiResource('/employee', \App\Http\Controllers\EmployeeController::class);
