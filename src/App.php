<?php
namespace Futbolapp;

class App {
    private $app;
    private $auth0;

    function __construct() {
        $this->app = new \Slim\Slim(array(
            'debug' => conf()->getItem('log.enabled'),
            'log.writer' => new \Slim\LogWriter(fopen(conf()->getItem('log.path'), 'a'))
        ));

        // $auth0 = new Auth0(array(
        //     'domain' => conf()->getItem('auth0.domain'),
        //     'client_id' => conf()->getItem('auth0.client.id'),
        //     'client_secret' => conf()->getItem('auth0.client.secret'),
        //     'redirect_uri' => conf()->getItem('auth0.redirect')
        // ));

    }

    function getApp() {
        return $this->app;
    }

    function run() {
        $this->app->run();
    }

}
