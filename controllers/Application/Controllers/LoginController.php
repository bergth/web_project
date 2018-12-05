<?php

namespace Application\Controllers;

use \Ascmvc\AbstractApp;
use Application\Services\SessionService;
use Application\Models\Entity\Users;
use \Ascmvc\Mvc\Controller;


class LoginController extends Controller
{

   // use SessionServiceTrait;

    public static function config(AbstractApp &$app)
    {
        IndexController::config($app);
    }

    public function predispatch()
    {
        $users = new Users();
        $em = $this->serviceManager->getRegisteredService('em1');
        $sessionService = new SessionService($users, $em);
        $this->serviceManager->addRegisteredService('SessionService', $sessionService);
    }
    public function indexAction()
    {
       // $this->viewObject->assign('view', $this->view);

        if (isset($_SESSION['LOGGEDIN'])) {
            $this->viewObject->assign('view', $this->view);
            $this->viewObject->display('index_index.tpl');
        }
        else {
            $this->viewObject->assign('view', $this->view);
            $this->viewObject->display('login_index.tpl');
        }

    }
}
