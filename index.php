<?php
require_once "router.php";
require_once "DB.php";
require_once "logger.php";
if(!isset($_COOKIE['lang'])) {
    if (explode(",", $_SERVER['HTTP_ACCEPT_LANGUAGE'])[0] == "pl-PL")
        setcookie("lang", "pl");
    else
        setcookie("lang", "en");
}
$logger = new MyLogger();
$db = new DB();
$router = new Router($db,$_SERVER["REQUEST_URI"],$logger);

