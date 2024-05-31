<?php
require_once "router.php";
require_once "DB.php";
$db = new DB();
$router = new Router($db,$_SERVER["REQUEST_URI"]);
