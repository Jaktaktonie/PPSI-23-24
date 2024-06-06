<?php
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require 'vendor/autoload.php';
require_once 'logger.php';

class Mailer
{
    private $logger;
    private $mailer;

    /**
     * @throws Exception
     */
    public function __construct($from, $from_name = '', $to, $to_name = '')
    {
        $this->logger = new MyLogger();
        $mail = new PHPMailer(true);

        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'kierownikprojektu12@gmail.com';                     //SMTP username
        $mail->Password   = 'tjesfqrqsiglvbna';                               //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        //Recipients
        $mail->setFrom($from, $from_name);
        $mail->addAddress($to, $to_name);     //Add a recipient
        $mail->addReplyTo($from, $from_name);
        $mail->isHTML(true);                                  //Set email format to HTML

        $this->mailer = $mail;
    }
    public function setContent($subject, $body)
    {
        $this->mailer->Subject = $subject;
        $this->mailer->Body = $body;
        $this->mailer->setLanguage("pl");
    }
    public function send(){
        if(!$this->mailer->send()){
            $this->logger->error($this->mailer->ErrorInfo);
            return false;
        }else{
            return true;
        }
    }
    public function getError(){
        return $this->mailer->ErrorInfo;
    }
}
