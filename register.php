<?php

require_once 'DB.php';

//Load Composer's autoloader
require 'vendor/autoload.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $token = bin2hex(random_bytes(50));

    $db = new DB();
    $conn = $db->getConnection();

    $sql = "INSERT INTO users (username, email, password, token, confirmed) VALUES ('$username', '$email', '$password', '$token', 0)";
    if (mysqli_query($conn, $sql)) {
        $mail = new PHPMailer\PHPMailer\PHPMailer;
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Użyj swojego serwera SMTP
        $mail->SMTPAuth = true;
        $mail->Username = 'kierownikprojektu12@gmail.com';
        $mail->Password = 'tjesfqrqsiglvbna';
        echo "koniec";
        $mail->SMTPSecure = PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port = 465;
        echo "loneic";
        $mail->setFrom('kierownikprojektu12@gmail.com', 'Weryfikacja/Verification');
        $mail->addAddress($email);

        $mail->isHTML(true);
        $mail->Subject = 'Confirm your email / Potwierdz swoj adres email';
        $mail->Body    = "<!DOCTYPE html>
<html lang='pl'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Weryfikacja Email / Email Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f9;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        h1 {
            color: #333;
        }
        p {
            color: black;
            margin: 20px 0;
        }
        .verify-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 20px 0;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .verify-btn:hover {
            background-color: #45a049;
        }
    </style>
</head
<body>
    <div class='container'>
        <h1>Weryfikacja Email / Email Verification</h1>
        <p>Kliknij tutaj, aby zweryfikować swój email.</p>
        <p>Click here to verify your email.</p>
        <a href='http://localhost/megusta/confirm' class='verify-btn'>Verify</a>
        <p>Jeśli to nie Twój adres email, zignoruj tę wiadomość.</p>
        <p>If this is not your email, please ignore this message.</p>
    </div>
</body>
</html>
";
        if (!$mail->send()) {
            echo 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
        } else {
            setcookie("user", $token, time() + 3600);
            echo 'Confirmation email has been sent';
            header("Location: index");
        }
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($db);
    }
}
