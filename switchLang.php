<?php
if(isset($_COOKIE['lang']) && $_COOKIE['lang'] == 'pl') {
    setcookie("lang", "en");
} else if(isset($_COOKIE['lang']) && $_COOKIE['lang'] == 'en') {
    setcookie("lang", "pl");
}else {
    setcookie("lang", "", time() - 3600);
}
$url = explode("/",$_SERVER['HTTP_REFERER']);
header("Location: ".$url[sizeof($url)-1]);