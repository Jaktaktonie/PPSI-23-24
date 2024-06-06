<?php
setcookie("sql", "SELECT produkty.id, produkty.nazwa, opisy.opis, produkty.cena, zdjecia.img, AVG(opinie.opinia) as ocena FROM produkty left join opisy on produkty.id = opisy.produkt_id left join zdjecia on produkty.id = zdjecia.produkt_id left JOIN opinie on produkty.id = opinie.produkt_id where produkty.nazwa like ? GROUP by produkty.id");
setcookie("sql_param","%".$_POST['search']."%");
header("location: index");