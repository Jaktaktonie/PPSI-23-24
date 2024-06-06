<?php
require_once 'DB.php';
require_once 'logger.php';
$db = new DB();
$verify_token = $_GET['token'];
$logger = new MyLogger();
var_dump($_GET);
$sql = "SELECT user_id FROM verify WHERE verify_token = ?";
$id = $db->queryDB_injection($sql,[$verify_token])[0]['user_id'];
$sql = "UPDATE users SET confirmed = 1 WHERE id = ?";
if($db->queryDB_injection($sql,[$id])){
    $sql = "DELETE FROM verify WHERE verify_token = ?;";
    $db->queryDB_injection($sql,[$verify_token]);
    $logger->info("Zatwierdzono email urzytkownika o id: $id");
    header("Location: confirmed");
}else {
    header("Location: unconfirmed");
}