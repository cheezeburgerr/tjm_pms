<?php

namespace App\Http\Controllers;

use App\Models\ChatRoom;
use App\Models\Order;
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

    public function index ()
    {
        $chats = ChatRoom::with('user', 'order.latestapproved')->where('user_id', auth()->id())->get();
        // dd($chats);

        return Inertia::render('Chat', ['chats' => $chats]);
    }

    public function user(User $user)
    {
        $chatRoom = ChatRoom::with('user')->firstOrCreate(['name' => $user->name, 'user_id' => $user->id], ['type' => 'User']);
        $messages = $chatRoom->messages()->with('user', 'files')->orderBy('created_at', 'asc')->get();


        // dd(auth()->id());
        // if($user->id !== auth()->id())
        // {
        //     return redirect()->route('dashboard');
        // }

        $chatRoom->load('user');
        return response()->json([
            'chatRoom' => $chatRoom,
            'messages' => $messages
        ]);
    }

    public function order(Order $order)
    {
        $chatRoom = ChatRoom::with('user', 'order.latestapproved')->firstOrCreate(['name' => $order->team_name, 'order_id' => $order->id, 'user_id' => $order->customer_id], ['type' => 'Order']);
        $messages = $chatRoom->messages()->with('user', 'order', 'files')->orderBy('created_at', 'asc')->get();


        // dd(auth()->id());
        // if($user->id !== auth()->id())
        // {
        //     return redirect()->route('dashboard');
        // }

        $chatRoom->load('order.latestapproved', 'user');
        return response()->json([
            'chatRoom' => $chatRoom,
            'messages' => $messages
        ]);
    }

}
