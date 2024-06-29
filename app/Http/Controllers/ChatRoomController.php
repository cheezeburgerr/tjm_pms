<?php

namespace App\Http\Controllers;

use App\Models\ChatRoom;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ChatRoomController extends Controller
{
    //

    // public function index(User $user)
    // {
    //     $chatRoom = ChatRoom::firstOrCreate(['name' => $user->name, 'user_id' => $user->id]);
    //     $messages = $chatRoom->messages()->with('user')->latest()->get();


    //     // dd(auth()->id());
    //     if($user->id !== auth()->id())
    //     {
    //         return redirect()->route('dashboard');
    //     }

    //     return Inertia::render('Chat', ['chatRoom' => $chatRoom, 'messages' => $messages]);
    // }


    public function index(User $user)
    {
        $chatRoom = ChatRoom::with('user')->firstOrCreate(['name' => $user->name, 'user_id' => $user->id]);
        $messages = $chatRoom->messages()->with('user')->orderBy('created_at', 'asc')->get();


        // dd(auth()->id());
        // if($user->id !== auth()->id())
        // {
        //     return redirect()->route('dashboard');
        // }

        return response()->json([
            'chatRoom' => $chatRoom,
            'messages' => $messages
        ]);
    }

}
