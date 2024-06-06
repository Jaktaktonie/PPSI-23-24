<?php
require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Level;
use Monolog\Handler\StreamHandler;

class MyLogger
{
    private $logger;
    public function __construct()
    {
        $this->logger = new Logger('info');
    }
    public function info($message)
    {
        $this->logger->pushHandler(new StreamHandler(__DIR__.'/logs/'.date("dmy").'-info.log', Level::Info));
        $this->logger->info($message);
    }
    public function error($message)
    {
        $this->logger->pushHandler(new StreamHandler(__DIR__.'/logs/'.date("dmy").'-error.log', Level::Info));
        $this->logger->error($message);
    }
}
