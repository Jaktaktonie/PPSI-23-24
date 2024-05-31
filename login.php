<?php
session_start();
require_once 'db.php';
$db = new DB();
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
    } else {
        header("location: bdlogin");
    }
}