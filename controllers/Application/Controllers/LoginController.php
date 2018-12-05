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

    public static function postboot(AbstractApp &$app)

    {

        $em = $app->getServiceManager()->getRegisteredService('em1');

        $users = new Users();

        $sessionService = new SessionService($users, $em);

        $app->getServiceManager()->addRegisteredService('SessionService', $sessionService);
    }

    public function indexAction()
    {
       // $this->viewObject->assign('view', $this->view);


        if (isset($_SESSION['LOGGEDIN'])) {

            $this->view['session']=1;
            $this->view['bodyjs']=1;

            $this->viewObject->assign('view', $this->view);
            $this->viewObject->display('index_index.tpl');
        }
        else {
            $this->viewObject->assign('view', $this->view);
            $this->viewObject->display('login_index.tpl');
        }

    }
}
