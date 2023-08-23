<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class welcome extends Mailable
{
    use Queueable, SerializesModels;
    public $nombres='';
    public $apellidos='';
    public $token='';

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($apellidos, $nombres, $token)
    {
        $this->apellidos=$apellidos;
        $this->nombres=$nombres;
        $this->token=$token;
    }

    /**
     * Get the message envelope.
     *
     * @return \Illuminate\Mail\Mailables\Envelope
     */
    public function envelope()
    {
        return new Envelope(
            subject: 'Recuperacion de clave J-SOFTWARE'
        );
    }

    /**
     * Get the message content definition.
     *
     * @return \Illuminate\Mail\Mailables\Content
     */
    public function content()
    {
        return new Content(
            view: 'email.welcome',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array
     */
    public function attachments()
    {
        return [];
    }
}
