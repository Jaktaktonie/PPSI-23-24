<?php
require_once 'DB.php';
$db = new DB();
$token = $_COOKIE['user'];
echo $token;
$sql = "UPDATE users SET confirmed = 1 WHERE token = '$token'";
if(mysqli_query($db->getConnection(), $sql))
    header("Location: confirmed");
else
    header("Location: unconfirmed");