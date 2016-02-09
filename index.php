<?php
require 'vendor/autoload.php';
// use Auth0\SDK\Auth0;

function conf() {
    global $conf;
    if (!$conf) {
        $conf = new Configula\Config('config');
    }
    return $conf;
}

$futbolapp = new Futbolapp\App();
$app = $futbolapp->getApp();
$connection = Futbolapp\db\Connection::init();
if (conf()->getItem('log.enabled') && conf()->getItem('log.query')) {
    $connection->enableLogging();
}

$app->get('/', function () {});

$api = new Futbolapp\api\Api($app);
$api->init();

$app->run();
