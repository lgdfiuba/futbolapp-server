<?php
namespace Futbolapp\db;

class Connection {
    private static $connection;

    static function init() {
        if (!self::$connection) {
            self::$connection = new self(
                conf()->getItem('db.host'),
                conf()->getItem('db.port'),
                conf()->getItem('db.dbname'),
                conf()->getItem('db.username'),
                conf()->getItem('db.password', '')
            );
        }

        return self::$connection;
    }

    private function __construct($host, $port, $dbname, $username, $password) {
        \ORM::configure("mysql:host=$host;port=$port;dbname=$dbname");
        \ORM::configure('username', $username);
        \ORM::configure('password', $password);
    }

    function enableLogging() {
        \ORM::configure('logging', true);
    }
}