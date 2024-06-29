<?php

namespace App\Jobs;

use App\Events\GotNotif;
use App\Models\Notification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendNotif implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(public Notification $notification)
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        GotNotif::dispatch([
            'id' => $this->notification->id,
            'user_id' => $this->notification->user_id,
            'title' => $this->notification->title,
            'message' => $this->notification->message,
            'url' => $this->notification->url,
        ]);
    }
}
