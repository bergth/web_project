<?php

namespace Application\Controllers;

use \web_project\AbstractApp;
use Application\Services\SessionService;
use Application\Models\Entity\session;
use \Ascmvc\Mvc\Controller;
use Application\Services\CrudProductsService;
use Application\Services\CrudProductsServiceTrait;
use Application\Models\Entity\Products;

class SessionController extends Controller
{

    public static function config(AbstractApp &$app)
    {
        IndexController::config($app);
    }

    public function predispatch()
    {
        $em = $this->serviceManager->getRegisteredService('em1');

        $products = new session();

        $crudService = new SessionService($session, $em);

        $this->serviceManager->addRegisteredService('SessionService', $crudService);

        $this->setCrudProducts($this->serviceManager->getRegisteredService('SessionService'));

        $this->view['saved'] = 0;

        $this->view['error'] = 0;
    }
}
