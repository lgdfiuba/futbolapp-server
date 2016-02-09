<?php
namespace Futbolapp\api;

class Resource {
    private $app;

    abstract function setupRoutes();

    function __construct(\Futbolapp\App $app) {
        $this->app = $app;
    }

    protected function getApp() {
        $this->app->getApp();
    }

}