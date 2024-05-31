<?php
require_once 'DB.php';
class HTMLGenerator
{
    private DB $db;
    private $dataFromDB;
    private $templateDir = "templates/index.tpl";
    public function __construct($db)
    {
        $this->db = $db;
        $this->loadFromDatabase();
    }
    private function loadFromDatabase()
    {
            $this->dataFromDB = $this->db->queryDB("SELECT produkty.id, produkty.nazwa, opisy.opis, produkty.cena, zdjecia.img, AVG(opinie.opinia) as ocena FROM produkty left join opisy on produkty.id = opisy.produkt_id left join zdjecia on produkty.id = zdjecia.produkt_id left JOIN opinie on produkty.id = opinie.produkt_id GROUP by produkty.id;");
    }
    public function setTemplateDir($dir)
    {
        $this->templateDir = $dir;
    }
    public function generate(){
        $result = file_get_contents($this->templateDir);
        foreach ($this->dataFromDB as $product){
            $card = str_replace(
                ["<!--id-->","<!--nazwa-->","<!--opis-->","<!--cena-->","<!--img-->","<!--ocena-->"],
                [$product["id"],$product["nazwa"],$product["opis"],$product["cena"],$product["img"],$product["ocena"]],
                file_get_contents("templates/priv/card.tpl")
            );
            $card = $this->setCardInfo($card,$product["id"]);
            $result= str_replace("<!--card-->", $card, $result);
        }
        return $result = preg_replace('/<!--[^-]*-->/', " ", $result);
    }
    private function setCardInfo($card,$id_produktu)
    {
        $token = $_COOKIE['user'];
        $values = $this->db->queryDB_injection("SELECT token,komentarz,opinia from users left JOIN opinie on users.id = opinie.konsument_id where users.token = ? and opinie.produkt_id = ?",[$token,$id_produktu]);
        if(sizeof($values)>0){
            $card = str_replace(["<!--info-->","<!--comment-->","<!--".$values[0]["opinia"]."-->"],
                ["<p style='padding: 5px'>Dałeś już opinie ale możesz ją zmienić ;)</p>",$values[0]["komentarz"],"selected"],
                $card);
            return $card;

        }else
            return $card;
    }
}
