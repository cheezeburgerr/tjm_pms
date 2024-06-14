<?php

use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderProductController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
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

Route::resource('orders', OrderController::class);
Route::resource('order-product', OrderProductController::class);
Route::get('order-downpayment/{id}', [OrderController::class, 'summary'])->name('orders.downpayment');

Route::post('downpayment/{id}', [OrderController::class, 'downpayment_store'])->name('downpayment');
Route::prefix('employee')->group(function () {
    Route::get('login', [EmployeeController::class, 'login'])->name('employee.login');
    Route::post('login', [EmployeeController::class, 'login_functionality'])->name('login.functionality');

    Route::middleware('employee')->group(function () {
        Route::get('/dashboard', [EmployeeController::class, 'dashboard'])->name('employee.dashboard');
        Route::get('/view-order/{id}', [EmployeeController::class, 'view_order'])->name('employee.vieworder');
        Route::get('/pending-teams', [EmployeeController::class, 'pending_teams'])->name('employee.pending');
        Route::post('/approve/{id}', [EmployeeController::class, 'approve'])->name('employee.approve');
        Route::resource('/products', ProductController::class);
        Route::post('logout', [EmployeeController::class, 'logout'])->name('employee.logout');
    });
});

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
