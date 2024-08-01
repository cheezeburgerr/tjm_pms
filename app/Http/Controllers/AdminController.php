<?php

namespace App\Http\Controllers;

use App\Models\Attributes;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Equipment;
use App\Models\Lineup;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\ProductionDetails;
use App\Models\Products;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Carbon;

class AdminController extends Controller
{


    public  $noArray = ['Cancelled', 'Pending', 'Received'];
    public function login()
    {

        if (Auth::guard('admin')->check()) {
            return redirect()->route('admin.dashboard');
        }
        return Inertia::render('Admin/Login');
    }

    //todo: employee login functionality
    public function login_functionality(Request $request)
    {
        // dd('check');
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password])) {
            $admin = Auth::guard('admin')->user();

            if ($admin->user_type !== 'Admin') {
                Auth::guard('admin')->logout();
                return back();
            }

            return redirect()->intended('/admin/dashboard');
        } else {
            Session::flash('error-message', 'Invalid Email or Password');
            return back();
        }
    }

    public function dashboard()
    {

        $orders = Order::with(['production.printer', 'employees'])
            ->withCount('products', 'lineups', 'errors', 'reprint')->orderBy('due_date', 'asc')->get();

            $errors = Lineup::with('order')->where('status', 'Reprint')->get();


        $printers = Equipment::withCount('orders')->where('type', 'Printer')->get();

        // dd(auth()->guard('admin')->user());

        return Inertia::render('Admin/Dashboard', ['orders' => $orders, 'printers' => $printers, 'errors' => $errors]);

    }


    public function teams()
    {
        $order = Order::with('production', 'employees.employee', 'products.products')
        ->withCount('products', 'lineups')
        ->whereHas('production', function ($query) {
            $query->where('status', '!=', 'Pending');
        })->get();


        // dd($order);
        $user = Auth::guard('employee')->user();




        $artists = User::where('dept_id', 1)->get();

        // dd($order);
        return Inertia::render('Admin/Teams', ['order' => $order, 'artists' => $artists]);
    }

    public function production_details ($id) {


        $order = Order::with('production.printer', 'products.products', 'products.variations.category', 'products.variations.variations', 'lineups.products', 'files', 'customer', 'latestapproved', 'approved', 'errors')->withCount('products', 'lineups', 'errors')->find($id);


        return Inertia::render('Admin/ProductionDetails', ['order' => $order]);
    }

    public function view_order($id)
    {
        $order = Order::with('production', 'products.products', 'products.variations.category', 'products.variations.variations', 'lineups.products', 'files', 'customer')->find($id);

        return Inertia::render('Admin/OrderDetails', ['order' => $order]);
    }


    public function pending_teams()
    {

        $order = Order::select('*', 'orders.id AS order_id')->leftJoin('products', 'orders.product_id', 'products.id')->leftJoin('production_details', 'orders.production_details_id', 'production_details.production_details_id')->where('production_details.status', 'Pending')->get();
        return Inertia::render('Admin/PendingTeams', ['order' => $order]);
    }



    public function production()
    {
        $statusArray = ['Ready to Print', 'Printing', 'Printed', 'Sewing'];
        $employee = Auth::guard('employee')->user();

        $order = Order::select('*', 'orders.id AS order_id')->selectRaw('(SELECT COUNT(*) FROM lineups WHERE lineups.order_id = orders.id AND lineups.status = "Error") AS error_count')->leftJoin('products', 'orders.product_id', 'products.id')->leftJoin('production_details', 'orders.production_details_id', 'production_details.production_details_id')->leftJoin('employees', 'production_details.artist_id', 'employees.employee_id')->with('products.attributes', 'attributes')->orderBy('orders.due_date', 'desc')->whereIn('production_details.status', $statusArray)->get();




        return Inertia::render('Admin/Production', ['order' => $order]);
    }

    public function printers()
    {
        $printers = Equipment::select('*')->selectRaw('(SELECT COUNT(*) FROM production_details WHERE production_details.printer_id = equipment.id) AS printer_count')->where('equipment_type', 'Printer')->get();


        return Inertia::render('Admin/Printers', ['printers' => $printers]);
    }
    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }

    public function employees()
    {
        $employees = User::where('user_type', 'Employee')->with('department')->get();
        // dd($employees);
        $departments = Department::all();
        // dd($employees);
        return Inertia::render('Admin/Employees', ['employees' => $employees, 'departments' => $departments]);
    }



    public function employee_store(Request $request)
    {

        $request->validate([

            'name' => 'required|string|max:255',
            'department_id' => 'required|int',
            'email' => 'required|string|lowercase|email|max:255',

        ]);

        $lastEmployee = User::where('user_type', 'Employee')->latest()->first();
        $lastId = $lastEmployee ? substr($lastEmployee->user_id, 4) : 0;
        $nextId = $lastId + 1;
        $customId = 'TJM_' . str_pad($nextId, 5, '0', STR_PAD_LEFT);

        $emp = User::create([
            'user_id' => $customId,
            'name' => $request->name,
            'email' => $request->email,
            'contact_number' => $request->contact_number,
            'address' => $request->address,
            'department_id' => $request->department_id,
            'password' => Hash::make('password'),
            'user_type' => 'Employee'
        ]);


        return to_route('admin.employees')->with('success', 'Employee Successfully Added');
    }
}
