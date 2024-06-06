<?php
session_start();
require_once 'db.php';
require_once 'logger.php';
$db = new DB();
$logger = new MyLogger();
$conn = $db->getConnection();
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email='$email'";
    $result = mysqli_query($conn, $sql);
    $user = mysqli_fetch_assoc($result);

    if($user && password_verify($password, $user['password'])){

        setcookie("user", $user['token'], time() + 7200);
        header("location: logged");
        $logger->info("Zalogowano nowego użytkownika: $email");
    } else {
        $logger->error("Urzytkownik probwał zalogować sie na $email i podał błędne hasło: $password");
        header("location: bdlogin");
    }
}