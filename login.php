<?php
session_start();
require_once 'db.php';
require_once 'logger.php';
$db = new DB();
$logger = new MyLogger();
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email=?";
    $result = $db->queryDB_injection($sql,[$email]);
    $user=$result[0];

    if($user && password_verify($password, $user['password'])){

        setcookie("user", $user['token'], time() + 7200);
        header("location: logged");
        $logger->info("Zalogowano nowego użytkownika: $email");
    } else {
        $logger->error("Użytkownik probwał zalogować sie na $email i podał błędne hasło: $password");
        header("location: bdlogin");
    }
}