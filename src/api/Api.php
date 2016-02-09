<?php
namespace Futbolapp\api;

class Api {
    private $app;

    function __construct(\Futbolapp\App $app) {
        $this->app = $app;
    }

    function init() {
        $this->initResources();
        $this->addNotFound();
    }

    function run() {
        $this->app->run();
    }

    private function initResources() {
        foreach ($this->getResources() as $resource) {
            $resource->setupRoutes();
        }
    }

    private function getResources() {
        return array(
        );
    }

    private function addNotFound() {
        $this->app->getApp()->notFound(function () use ($app) {
            echo "Resouce not found";
        });
    }
}
