<?php
require_once 'DB.php';
class HTMLGenerator
{
    private DB $db;
    private $dataFromDB;
    private $templateDir = "templates/index.tpl";
    private $main;
    public function __construct($db)
    {
        $this->main="templates/".$_COOKIE["lang"]."/priv/main.tpl";
        $this->db = $db;
        $this->loadFromDatabase();
    }
    private function loadFromDatabase()
    {
        if ($_COOKIE["sql"]!=NULL) {
            $this->dataFromDB = $this->db->queryDB_injection($_COOKIE["sql"], [$_COOKIE["sql_param"]]);
        }else
            $this->dataFromDB = $this->db->queryDB("SELECT produkty.id, produkty.nazwa, opisy.opis, produkty.cena, zdjecia.img, AVG(opinie.opinia) as ocena FROM produkty left join opisy on produkty.id = opisy.produkt_id left join zdjecia on produkty.id = zdjecia.produkt_id left JOIN opinie on produkty.id = opinie.produkt_id where produkty.id = 0 GROUP by produkty.id;");
    }
    public function setTemplateDir($dir)
    {
        $this->templateDir = $dir;
    }
    public function generate(){
        $result = file_get_contents($this->templateDir);
        if(sizeof($this->dataFromDB)>0) {
            foreach ($this->dataFromDB as $product) {
                $card = str_replace(
                    ["<!--id-->", "<!--nazwa-->", "<!--opis-->", "<!--cena-->", "<!--img-->", "<!--ocena-->"],
                    [$product["id"], $product["nazwa"], $product["opis"], $product["cena"], $product["img"], round($product["ocena"],2)],
                    file_get_contents("templates/".$_COOKIE["lang"]."/priv/card.tpl")
                );
                $card = $this->setCardInfo($card, $product["id"]);
                $result = str_replace("<!--card-->", $card, $result);
            }
        }else if ($_COOKIE["sql_param"]!=NULL)
            $result = str_replace("<!--card-->", "<p style='padding: 5px'>Nie znaleziono produktów</p>", $result);
        if($_COOKIE["user"]!=$GLOBALS["admin"])
            $result = str_replace("<!--body-->", $result, file_get_contents($this->main));
        return preg_replace('/<!--[^-]*-->/', " ", $result);
    }
    private function setCardInfo($card,$id_produktu)
    {
        $token = $_COOKIE['user'];

            $values = $this->db->queryDB_injection("SELECT token,komentarz,opinia from users left JOIN opinie on users.id = opinie.konsument_id where users.token = ? and opinie.produkt_id = ?", [$token, $id_produktu]);

            if(sizeof($values)>0){
            $card = str_replace(["<!--info-->","<!--comment-->","<!--".$values[0]["opinia"]."-->"],
                ["<p style='padding: 5px'>Dałeś już opinie ale możesz ją zmienić ;)</p>",$values[0]["komentarz"],"selected"],
                $card);
            return $card;

        }else
            return $card;
    }
}
