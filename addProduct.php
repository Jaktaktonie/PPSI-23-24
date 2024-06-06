<?php
require_once 'DB.php';
require_once 'logger.php';
$db = new DB();
$logger = new MyLogger();

$file_name = upload_file($_FILES["productImage"]);
$sql = "INSERT INTO produkty (nazwa, cena) VALUES ( ? , ? );";
$db->queryDB_injection($sql, [$_POST["productName"], $_POST["productPrice"]]);
$id_produktu = $db->queryDB("select max(id) as max from produkty")[0]['max'];
$sql = "INSERT INTO opisy (opisy.opis, opisy.produkt_id) VALUES ( ? , ? );";
$db->queryDB_injection($sql, [$_POST["productDescription"], $id_produktu]);
$sql = "INSERT INTO zdjecia (zdjecia.img, zdjecia.produkt_id) VALUES ( ? , ? );";
$db->queryDB_injection($sql, [$file_name, $id_produktu]);
header("Location: index");

function upload_file($file){
        if ($file['error'] == UPLOAD_ERR_OK) {
            $tmp_name = $file["tmp_name"];
            $new_name ="plik_".time().substr($file["name"], -5);
            move_uploaded_file($tmp_name, "img/$new_name");
            return $new_name;
        }
    return "";
}