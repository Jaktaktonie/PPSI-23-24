<?php
require_once "HTMLGenerator.php";
class Router{
    private $URI;
    private DB $db;
    private $logger;
    private $parameters;
    public function __construct($db,$URI,$logger)
    {
        $this->db = $db;
        $this->URI = $URI;
        $this->setAdminGlobal();
        $this->logger = $logger;
        $this->logger->info("Użytkowanik o ip: " . $_SERVER['REMOTE_ADDR'] . " prosi o akcje: $URI");
        $this->parameters = $this->getParameters();
        $this->loadModule();
    }
    private function getParameters(){
        $parameters = explode("/",$this->URI);
        array_shift($parameters);
        array_shift($parameters);
        return $parameters;
    }
    private function loadModule(){
        $generator = new HTMLGenerator($this->db);
        if(file_exists("templates/".$_COOKIE['lang']."/{$this->parameters[0]}.tpl"))
            $generator->setTemplateDir("templates/".$_COOKIE['lang']."/{$this->parameters[0]}.tpl");
        else header("Location: index");

        if($this->isAdmin()) {
            $generator->setTemplateDir("templates/pl/priv/adminpanel.tpl");
        }
        echo $generator->generate();
    }
    private function isAdmin(){
        $sql = "SELECT confirmed FROM users WHERE token = ?";
        if($_COOKIE['user']==$GLOBALS['admin']){
            return true;
        }else{
            return false;
        }
    }
    private function setAdminGlobal(){
        $sql = "SELECT token FROM users WHERE confirmed = 2";
        $GLOBALS['admin'] = $this->db->queryDB($sql)[0]['token'];
    }
}