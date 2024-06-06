<?php
require_once 'DB.php';
require_once 'logger.php';
require_once 'mailer.php';

//Load Composer's autoloader
require 'vendor/autoload.php';

$logger = new MyLogger();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $token = bin2hex(random_bytes(50));
    $verify_token = bin2hex(random_bytes(50));

    $db = new DB();
    //sprawdzenie czy użytkownik istnieje
    if(sizeof($db->queryDB_injection("SELECT * FROM users WHERE email = '$email'"))==0) {

        $sql = "INSERT INTO users (username, email, password, token, confirmed) VALUES (?,?,?,?,0)";
        $ask_for_login = $db->queryDB_injection($sql, [$username, $email, $password, $token]);
        if ($ask_for_login) {
            $id = $db->queryDB_injection("SELECT id FROM users WHERE token = ?",[$token])[0]['id'];
            $sql = "INSERT INTO verify (`user_id`, `verify_token`) VALUES (?,?)";
            $db->queryDB_injection($sql,[$id, $verify_token]);

            try {
                $mail = new Mailer("kierownikprojektu12@gmail.com", "Megusta+", $email, $username);
            } catch (\PHPMailer\PHPMailer\Exception $e) {
                $logger->error('Zarejstrowano ale nie udało się wysłać wiadomosci: problem z mailerem');
                header("location: bdregister");
            }

            if($_COOKIE["lang"] == "pl"){
                $subject = "Weryfikacja email";
            }else
                $subject = "Email verification";
            $body = file_get_contents("templates/".$_COOKIE["lang"]."/priv/veryfication_mail.tpl");
            $url = "http://localhost/megusta/verification.php?token=" . $verify_token;
            $body = str_replace("<!--url-->", $url, $body);
            $mail->setContent($subject, $body);
            if (!$mail->send()) {
                $logger->error('Zarejstrowano ale nie udało się wysłać wiadomosci: ' . $mail->getError());
                header("location: bdregister");
            } else {
                setcookie("user", $token, time() + 3600);
                $logger->info("Zarejstrowano nowego użytkownika: $username o mailu: $email");
                header("Location: checkmail");
            }
        } else {
            header("location: bdregister");
        }
    }else{
        $logger->info("Użytkownik $email juz istnieje próbował jeszcze raz");
        header("location: bdregister");
    }
}
