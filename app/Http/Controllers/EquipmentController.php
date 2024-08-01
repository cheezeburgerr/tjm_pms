<?php

namespace App\Http\Controllers;

use App\Models\Equipment;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EquipmentController extends Controller
{
    //
    public function index ()
    {
        $printers = Equipment::where('type', 'Printer')->get();
        return Inertia::render('Printers', ['printers' => $printers]);
    }

}
