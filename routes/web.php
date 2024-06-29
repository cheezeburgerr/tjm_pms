<?php

use App\Http\Controllers\ChatRoomController;
use App\Http\Controllers\CheckingController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\FinalCheckingController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderProductController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/', function () {
    return Inertia::render('Dashboard');
})->name('dashboard');

// Route::get('order', [OrderController::class, 'index'])->name('order');
// Route::post('/orders', [OrderController::class, 'store'])->name('orders.store');

Route::post('/broadcasting/auth', function () {
    return Auth::user();
 });


//  Route::middleware(['auth:sanctum', 'verified'])->get('/chat/{user}', [ChatRoomController::class, 'index'])->name('chat');
Route::post('/messages', [MessageController::class, 'store']);

Route::prefix('employee')->group(function () {
    Route::get('login', [EmployeeController::class, 'login'])->name('employee.login');
    Route::post('login', [EmployeeController::class, 'login_functionality'])->name('login.functionality');

    Route::middleware('employee')->group(function () {
        Route::get('/dashboard', [EmployeeController::class, 'dashboard'])->name('employee.dashboard');
        Route::post('/logout', [EmployeeController::class, 'logout'])->name('employee.logout');
        Route::get('/view-order/{id}', [EmployeeController::class, 'view_order'])->name('employee.vieworder');
        Route::get('/production-details/{id}', [EmployeeController::class, 'production_details'])->name('employee.production');
        Route::get('/pending-teams', [EmployeeController::class, 'pending_teams'])->name('employee.pending');
        Route::get('/teams', [EmployeeController::class, 'teams'])->name('employee.teams');
        Route::post('/approve-design', [EmployeeController::class, 'approve_design'])->name('employee.approvedesign');

        Route::put('/cancel-order/{id}', [OrderController::class, 'cancel_order'])->name('cancel.order');
        Route::get('/print/{id}', [EmployeeController::class, 'print'])->name('employee.print');
        Route::get('/reprint/{id}', [EmployeeController::class, 'reprint'])->name('employee.reprint');
        Route::get('/without-artist', [EmployeeController::class, 'without_artist'])->name('employee.artist');
        Route::resource('/checking', CheckingController::class);
        Route::resource('/final-checking', FinalCheckingController::class);

        Route::get('/chat', [EmployeeController::class, 'chat'])->name('employee.chat');
        Route::put('/reprint-errors/{id}', [EmployeeController::class, 'reprint_errors'])->name('reprint.errors');
        Route::put('/change-status/{id}', [EmployeeController::class, 'change_status'])->name('employee.changestatus');
        Route::put('/release/{id}', [EmployeeController::class, 'release'])->name('employee.release');
        Route::put('/return-records', [EmployeeController::class, 'return_records'])->name('employee.returnrecords');
        Route::post('/assign-artist/{id}', [EmployeeController::class, 'assign'])->name('employee.assign-artist');
        Route::post('/approve/{id}', [EmployeeController::class, 'approve'])->name('employee.approve');
        Route::resource('/products', ProductController::class);
        Route::post('logout', [EmployeeController::class, 'logout'])->name('employee.logout');

        Route::get('/orders/export-pdf', [OrderController::class, 'exportPdf'])->name('orders.exportPdf');
    });
});

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile-show', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/return/{id}', [OrderController::class, 'return'])->name('orders.return');
    Route::put('/return-records', [OrderController::class, 'return_records'])->name('employee.returnrecords');
    Route::resource('orders', OrderController::class);
    Route::resource('order-product', OrderProductController::class);
    Route::get('approval/{id}', [OrderController::class, 'approval'])->name('orders.approval');
    Route::put('/approve', [OrderController::class, 'approve'])->name('orders.approve');
    Route::put('/reject', [OrderController::class, 'reject'])->name('orders.reject');
    Route::get('order-downpayment/{id}', [OrderController::class, 'summary'])->name('orders.downpayment');
    Route::post('downpayment/{id}', [OrderController::class, 'downpayment_store'])->name('downpayment');
});

require __DIR__ . '/auth.php';
