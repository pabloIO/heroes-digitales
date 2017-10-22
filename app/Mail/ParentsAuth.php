<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ParentsAuth extends Mailable
{
    use Queueable, SerializesModels;
    private $name;
    private $lastname;
    private $url;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($name, $lastname, $url)
    {
      $this->name = $name;
      $this->lastname = $lastname;
      $this->url = $url;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
      return $this->from('elementalbolivia@gmail.com')
                  ->subject('Autorización de padre/apoderado - Héroes Digitales')
                  ->view('emails.auth-parents');
    }
}
