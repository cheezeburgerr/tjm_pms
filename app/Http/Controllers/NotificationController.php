<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use Inertia\Inertia;

class NotificationController extends Controller
{
    //


    public function index()
    {
        $notifications = Notification::where('user_id', auth()->id())->get();
        return Inertia::render('Notifications/Index', ['notifications' => $notifications]);
    }

    public function fetch($id)
    {
        $notifications = Notification::where('user_id', $id)->orderBy('created_at', 'desc')->get();
        // dd('ssd');
        return response()->json($notifications);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'url' => 'nullable|url',
        ]);

        Notification::create([
            'user_id' => auth()->id(),
            'title' => $request->title,
            'message' => $request->message,
            'url' => $request->url,
        ]);

        return redirect()->back()->with('success', 'Notification created successfully.');
    }

    public function update (Request $request, $id)
    {
        $notif = Notification::where('id', $id)->first();
        $notif->status = $request->status;
        $notif->save();
    }
}
