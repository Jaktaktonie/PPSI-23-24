<?php
require_once "HTMLGenerator.php";
class Router{
    private $URI;
    private $db;
    private $logged;
    private $parameters;
    public function __construct($db,$URI)
    {
        $this->db = $db;
        $this->URI = $URI;

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
        if(file_exists("templates/{$this->parameters[0]}.tpl"))
            $generator->setTemplateDir("templates/{$this->parameters[0]}.tpl");
        else header("Location: index");
        echo $generator->generate();
    }

}