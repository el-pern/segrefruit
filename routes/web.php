<?php

use App\Http\Controllers\FruitController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

//login routes
Route::middleware(['guest'])->group(function() {
Route::get('/segrefruit/login', function (){
    return view('login');
})->name('login');});

Route::post('/segrefruit/login', [UserController::class, 'login']);

//auth routes

Route::middleware(['web'])->group(function (){
    Route::post('/logout', [UserController::class, 'logout']);}
);

Route::middleware(['auth'])->group(function (){
    
    Route::get('/', function () {
        return redirect('/segrefruit');
    });

    Route::get('/segrefruit', [UserController::class, 'home']);

    Route::get('/segrefruit/dashboard', [FruitController::class, 'dashboard']);

    Route::post('/segrefruit/crbatch', [FruitController::class, 'createBatch'])->name('fruits.batch');

    Route::post('/segrefruit/export', [FruitController::class, 'export'])->name('fruits.export');
    Route::get('/segrefruit/export/download', [FruitController::class, 'downloadExport'])->name('fruits.download');

    Route::post('/segrefruit/import', [FruitController::class, 'import'])->name('fruits.import');

    Route::post('/segrefruit/backup', [UserController::class, 'backup'])->name('backups.generate');
    Route::get('/segrefruit/backup', [UserController::class, 'downloadBackup'])->name('backups.download');

    Route::post('/segrefruit/restore', [UserController::class, 'restore'])->name('backups.restore');

});
