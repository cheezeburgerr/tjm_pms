<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class EmployeeController extends Controller
{
    //
    public function login()
    {
        if (Auth::guard('employee')->user()) {
            return redirect()->route('employee.dashboard');
        }

        return Inertia::render('Employee/Login');
    }

    public function login_functionality(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        if (Auth::guard('employee')->attempt(['email' => $request->email, 'password' => $request->password])) {
            $employee = Auth::guard('employee')->user();

            if ($employee->user_type !== 'Employee') {
                Auth::guard('employee')->logout();
                return back();
            }

            return redirect()->intended('/employee/dashboard');
        } else {
            Session::flash('error-message', 'Invalid Email or Password');
            return back();
        }
    }

    public function dashboard()
    {
        $orders = Order::with('production')->withCount('products')->get();
        return Inertia::render('Employee/Dashboard', ['orders' => $orders]);
    }

    public function view_order($id)
    {
        $order = Order::with('production', 'products.products', 'products.variations.category', 'products.variations.variations', 'lineups.products', 'files', 'customer')->find($id);

        return Inertia::render('Employee/OrderDetails', ['order' => $order]);
    }

    public function pending_teams()
    {
        $order = Order::with('production')
            ->withCount('products')
            ->whereHas('production', function ($query) {
                $query->where('status', 'Pending');
            })
            ->get();

        return Inertia::render('Employee/PendingTeams', ['order' => $order]);
    }

    public function approve (Request $request, $id)
    {

        $order = Order::with('production')->findOrFail($id);


        $order->production->status = 'Designing';
        $order->production->update();

        return to_route('employee.pending');
    }
}
