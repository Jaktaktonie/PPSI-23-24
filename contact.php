<?php
require_once "mailer.php";
require_once "logger.php";
$logger = new MyLogger();
try {
    $mail = new Mailer($_POST['email'], $_POST['name'], 'kierownikprojektu12@gmail.com', 'Megusta+');
} catch (\PHPMailer\PHPMailer\Exception $e) {
    $logger->error('Wiadomosc nie została wysłana: problem z mailerem '. $e);
    header("location: kontakt");
}
$mail->setContent(
    'Nowa wiadomosc od urzytkownika '.$_POST['name'],
            $_POST['message']);
$mail->send();
header("Location: kontakt");