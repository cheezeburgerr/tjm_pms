<?php

namespace App\Http\Controllers;

use App\Events\MessageSent;
use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    //
    public function store(Request $request)
    {
        $request->validate([
            'message' => 'required_without:file',
            'file' => 'nullable|file|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'chat_room_id' => 'required|exists:chat_rooms,id',
        ]);

        $filePath = null;
        if ($request->hasFile('file')) {
            $filePath = $request->file('file')->store('/images/customers/chats', 'public');
        }

        $message = Message::create([
            'user_id' => $request->user_id,
            'chat_room_id' => $request->chat_room_id,
            'message' => $request->message,
            'file_path' => $filePath,
        ]);

        broadcast(new MessageSent($message))->toOthers();

        // return redirect()->back();
    }
}
