<?php
session_start();
require_once 'db.php';
$db = new DB();
$conn = $db->getConnection();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $rate = $_POST['rating'];
    $comment = $_POST['comment'];
    $id_produktu = $_POST['id'];
    $token = $_COOKIE['user'];
    $sql = "SELECT * FROM users where token = ?";
    $ask_for_login = $db->queryDB_injection($sql,[$token]);
    $user_confirm = $ask_for_login[0]['confirmed'];
    $imie = $ask_for_login[0]['username'];
    $user_id = $ask_for_login[0]['id'];
    if(sizeof($ask_for_login) > 0) {
        if ($user_confirm == 1) {
            $users_rate = $db->queryDB_injection("SELECT * FROM opinie where konsument_id = ? and produkt_id = ?",[$user_id, $id_produktu]);
            if(sizeof($users_rate)>0){
                $sql = "UPDATE `opinie` SET `opinia`= ? ,`komentarz`= ? WHERE konsument_id = ? and produkt_id = ? ";
                $result = $db->queryDB_injection($sql, [$rate, $comment, $user_id, $id_produktu]);
            }else {
                $sql = "INSERT INTO opinie (`opinia`, `imie`, `komentarz`,`konsument_id`,`produkt_id`) VALUES (?,?,?,?,?)";
                $result = $db->queryDB_injection($sql, [$rate, $imie, $comment, $user_id, $id_produktu]);
            }
            header("location: index");
        }else{
            header("location: unconfirmed");
        }
    }else{
        header("location: login");
    }
}