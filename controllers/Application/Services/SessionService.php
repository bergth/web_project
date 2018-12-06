<?php
/**
 * Created by PhpStorm.
 * User: Pinpin
 * Date: 04/12/2018
 * Time: 22:05
 */

namespace Application\Services;

use Application\Models\Entity\Users;
use Application\Models\Entity\logout;
use Application\Models\Traits\DoctrineTrait;
use Application\Models\Repository\UsersRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\ClassMetadata;

class SessionService {

    use DoctrineTrait;

    protected $loginCheck;
    protected $validSession;
    protected $postLoginForm;
    protected $errorMessage;
    protected $userMessage;
    protected $useragent;
    protected $users;
    protected $em;
    protected $username;
    protected $password;
    protected $sessionname;

    public function __construct(Users $users, EntityManager $em)
    {
        $this->users = $users;

        $this->em = $em;

        // Set flags.
        $this->loginCheck = FALSE;

        $this->validSession = FALSE;

        $this->postLoginForm = TRUE;

        // Initialize application business and frontend messages.
        $this->errorMessage = 0;

        $this->userMessage = '';

        // Check if user is already logged in.
        if (isset($_COOKIE['loggedin'])) {

            if ($this->validSession === FALSE) {

                $this->validSession = $this->session_secure_init();

            }

            //  Check for cookie tampering.
            if ($this->validSession === TRUE && isset($_SESSION['LOGGEDIN'])) {

                $this->postLoginForm = FALSE;

            } else {

                $this->validSession =  $this->session_obliterate();

                $this->errorMessage = 3;

                $this->postLoginForm = TRUE;

            }

            // Cookie login check done.
            $this->loginCheck = TRUE;

        }

        // Login verification.
        if (isset($_POST['submit'])
            && !empty($_POST['username'])
            && !empty($_POST['password'])) {

            if ($this->validSession === FALSE) {

                $this->validSession = $this->session_secure_init();

            }

            $this->username = (string) $_POST['username'];

            $this->password = (string) $_POST['password'];

            if (!ctype_alpha($this->username)) {

                $this->username = preg_replace("/[^a-zA-Z]+/", "", $this->username);

            }

            if (strlen($this->username) > 40) {

                $this->username = substr($this->username, 0, 39);

            }

            $this->password = preg_replace("/[^_a-zA-Z0-9]+/", "", $this->password);

            if (strlen($this->password) > 40) {

                $this->password = substr($this->password, 0, 39);

            }

            // Check credentials.
            if ($this->checkLogin($this->username, $this->password)) {

                if ($this->validSession === TRUE) {

                    //  Check for cookie tampering.
                    if (isset($_SESSION['LOGGEDIN'])) {

                        $this->validSession = $this->session_obliterate();
                        $this->errorMessage = 3;
                        $this->postLoginForm = TRUE;

                    } else {

                        setcookie('loggedin', TRUE, time()+ 4200, '/');
                        $_SESSION['LOGGEDIN'] = TRUE;
                        $_SESSION['REMOTE_USER'] = $this->username;
                        $this->postLoginForm = FALSE;

                    }

                } else {

                    $this->validSession = $this->session_obliterate();
                    $this->errorMessage = 3;
                    $this->postLoginForm = TRUE;

                }

            } else {

                $this->validSession = $this->session_obliterate();
                $this->errorMessage = 1;
                $this->postLoginForm = TRUE;

            }

            // Username-password login check done.
            $this->loginCheck = TRUE;

        }

        // Intercept logout POST.
        if (isset($_POST['logout'])) {

            if ($this->validSession === FALSE) {

                $this->session_secure_init();

            }

            $this->validSession = $this->session_obliterate();
            $this->errorMessage = 2;
            $this->postLoginForm = TRUE;

        }

        // Intercept invalid sessions and redirect to login page.
        if ($this->loginCheck === TRUE && $this->validSession === FALSE && $this->errorMessage === 0) {

            if ($this->validSession === FALSE) {

                $this->validSession = $this->session_secure_init();
                $this->validSession = $this->session_obliterate();

            }

            $this->errorMessage = 3;
            $this->postLoginForm = TRUE;

        }

        // Prepare view output.
        if ($this->postLoginForm === TRUE) {

            switch ($this->errorMessage) {

                case 0:
                    $this->userMessage = 'Please sign in.';
                    break;
                case 1:
                    $this->userMessage = 'Wrong credentials.  <a href="index.php/login">Try again</a>.';
                    break;
                case 2:
                    $this->userMessage = 'You are logged out!  <a href="index.php/login">You can login again</a>.';
                    break;
                case 3:
                    $this->userMessage = 'Invalid session. <a href="index.php/login">Please login again</a>.';
                    break;
            }

            /*header("https://127.0.0.2/index.php/login.tpl");
            ob_end_flush();
            exit();*/
            /*
                    $htmlOut = "<!DOCTYPE html>\n\n";
                    $htmlOut .= "<html lang=\"en\">\n\n";
                    $htmlOut .= "<head>\n\n";
                    $htmlOut .= "\t<meta charset=\"utf-8\">\n";
                    $htmlOut .= "\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
                    $htmlOut .= "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
                    $htmlOut .= "\t<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n\n";
                    $htmlOut .= "\t<title>Login App</title>\n\n";
                    $htmlOut .= "\t<!-- Bootstrap -->\n";
                    $htmlOut .= "\t<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n\n";
                    $htmlOut .= "\t<!-- Custom styles for this template -->\n";
                    $htmlOut .= "\t<link href=\"css/signin.css\" rel=\"stylesheet\">\n\n";
                    $htmlOut .= "\t<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n";
                    $htmlOut .= "\t<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n\n";
                    $htmlOut .= "\t<!--[if lt IE 9]>\n";
                    $htmlOut .= "\t\t<script src=\"js/html5shiv.min.js\"></script>\n";
                    $htmlOut .= "\t\t<script src=\"js/respond.min.js\"></script>\n";
                    $htmlOut .= "\t<![endif]-->\n\n";
                    $htmlOut .= "</head>\n\n";
                    $htmlOut .= "<body>\n\n";

                    if ($this->errorMessage === 0) {

                        $htmlOut .= "\t<div class=\"container\">\n";
                        $htmlOut .= "\t\t<form class=\"form-signin\" action=\"index.php\" method=\"post\" data-toggle=\"validator\" role=\"form\">\n";
                        $htmlOut .= "\t\t\t<h2 class=\"form-signin-heading\">" . $this->userMessage . "</h2>\n";
                        $htmlOut .= "\t\t\t<div class=\"form-group\">\n";
                        $htmlOut .= "\t\t\t\t<label for=\"inputUsername\" class=\"control-label\">Username:</label>\n";
                        $htmlOut .= "\t\t\t\t<input class=\"form-control\" id=\"inputUsername\" name=\"username\" placeholder=\"Username\" type=\"text\" pattern=\"^[a-zA-Z]+$\" maxlength=\"40\" data-error=\"Invalid character.\" required autofocus>\n";
                        $htmlOut .= "\t\t\t\t<div class=\"help-block with-errors\"></div>\n";
                        $htmlOut .= "\t\t\t</div>\n";
                        $htmlOut .= "\t\t\t<div class=\"form-group\">\n";
                        $htmlOut .= "\t\t\t\t<label for=\"inputPassword\" class=\"control-label\">Password:</label>\n";
                        $htmlOut .= "\t\t\t\t<input class=\"form-control\" id=\"inputPassword\" name=\"password\" placeholder=\"Password\" type=\"password\" pattern=\"^[_a-zA-Z0-9]+$\" maxlength=\"40\" data-error=\"Invalid character.\" required>\n";
                        $htmlOut .= "\t\t\t\t<div class=\"help-block with-errors\"></div>\n";
                        $htmlOut .= "\t\t\t</div>\n";
                        $htmlOut .= "\t\t\t<div class=\"form-group\">\n";
                        $htmlOut .= "\t\t\t\t<button class=\"btn btn-lg btn-primary btn-block\" name=\"submit\" type=\"submit\" value=\"1\">Submit</button>\n";
                        $htmlOut .= "\t\t\t</div>\n";
                        $htmlOut .= "\t\t</form>\n";
                        $htmlOut .= "\t</div> <!-- /container -->\n\n";

                    } else {

                        $htmlOut .= "\t<div class=\"container theme-showcase\" role=\"main\">\n";
                        $htmlOut .= "\t\t<!-- Main jumbotron for a primary marketing message or call to action -->\n";
                        $htmlOut .= "\t\t<div class=\"jumbotron\">\n";
                        $htmlOut .= "\t\t\t<h2>" . $this->userMessage . "</h2>\n";
                        $htmlOut .= "\t\t</div> <!-- /jumbotron -->\n";
                        $htmlOut .= "\t</div> <!-- /container -->\n\n";

                    }

                    $htmlOut .= "\t<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n";
                    $htmlOut .= "\t<script src=\"js/jquery.min.js\"></script>\n";
                    $htmlOut .= "\t<!-- Include all compiled plugins (below), or include individual files as needed -->\n";
                    $htmlOut .= "\t<script src=\"js/bootstrap.min.js\"></script>\n";
                    $htmlOut .= "\t<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->\n";
                    $htmlOut .= "\t<script src=\"js/ie10-viewport-bug-workaround.js\"></script>\n";
                    $htmlOut .= "\t<!-- Form validator for Bootstrap 3 -->\n";
                    $htmlOut .= "\t<script src=\"js/validator.min.js\"></script>\n\n";
                    $htmlOut .= "</body>\n\n";
                    $htmlOut .= "</html>";

                } else {

                    $htmlOut = "<!DOCTYPE html>\n\n";
                    $htmlOut .= "<html lang=\"en\">\n\n";
                    $htmlOut .= "<head>\n\n";
                    $htmlOut .= "\t<meta charset=\"utf-8\">\n";
                    $htmlOut .= "\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
                    $htmlOut .= "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
                    $htmlOut .= "\t<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n\n";
                    $htmlOut .= "\t<title>Login App</title>\n\n";
                    $htmlOut .= "\t<!-- Bootstrap -->\n";
                    $htmlOut .= "\t<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n\n";
                    $htmlOut .= "\t<!-- Custom styles for this template -->\n";
                    $htmlOut .= "\t<link href=\"css/signin.css\" rel=\"stylesheet\">\n\n";
                    $htmlOut .= "\t<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n";
                    $htmlOut .= "\t<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n\n";
                    $htmlOut .= "\t<!--[if lt IE 9]>\n";
                    $htmlOut .= "\t\t<script src=\"js/html5shiv.min.js\"></script>\n";
                    $htmlOut .= "\t\t<script src=\"js/respond.min.js\"></script>\n";
                    $htmlOut .= "\t<![endif]-->\n\n";
                    $htmlOut .= "\t<style media=\"screen\" type=\"text/css\">\n\n";
                    $htmlOut .= "\t\t.container {\n";
                    $htmlOut .= "\t\t\tmax-width: 480px;\n";
                    $htmlOut .= "\t\t}\n\n";
                    $htmlOut .= "\t</style>\n\n";
                    $htmlOut .= "</head>\n\n";
                    $htmlOut .= "<body>\n\n";
                    $htmlOut .= "\t<div class=\"container theme-showcase\" role=\"main\">\n";
                    $htmlOut .= "\t\t<!-- Main jumbotron for a primary marketing message or call to action -->\n";
                    $htmlOut .= "\t\t<div class=\"jumbotron\">\n";

                    if (isset($_GET["check"])) {

                        $htmlOut .= "\t\t\t<h2>Hello, " . $_SESSION['REMOTE_USER'] . "!<br /><br /><br />You are still logged in.<br /><br /><br /><br /></h2>\n";

                    } else {

                        $htmlOut .= "\t\t\t<h2>Welcome, " . $_SESSION['REMOTE_USER'] . "!<br /><br /><br />You are logged in.</h2><br /><br /><p><a href=\"index.php?check=1\">Check cookie</a><br /><br /><br /><br /></p>\n";
                    }

                    $htmlOut .= "\t\t\t<form action=\"index.php\" method=\"post\">\n";
                    $htmlOut .= "\t\t\t\t<button class=\"btn btn-lg btn-primary btn-block\" name=\"logout\" type=\"submit\" value=\"2\">Logout</button>\n";
                    $htmlOut .= "\t\t\t</form>\n";
                    $htmlOut .= "\t\t</div> <!-- /jumbotron -->\n";
                    $htmlOut .= "\t</div> <!-- /container -->\n\n";
                    $htmlOut .= "\t<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n";
                    $htmlOut .= "\t<script src= \"js/jquery.min.js\"></script>\n";
                    $htmlOut .= "\t<!-- Include all compiled plugins (below), or include individual files as needed -->\n";
                    $htmlOut .= "\t<script src=\"js/bootstrap.min.js\"></script>\n";
                    $htmlOut .= "\t<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->\n";
                    $htmlOut .= "\t<script src=\"js/ie10-viewport-bug-workaround.js\"></script>\n\n";
                    $htmlOut .= "</body>\n\n";
                    $htmlOut .= "</html>";

                }

            */
    }

    }

    public function checkLogin($username, $password)
    {

        $results = $this->getEm()->getRepository('Application\Models\Entity\Users')->findBy(array('username' => $username));

        $passwordVerified = password_verify($password, $results[0]->getPassword());

        return $passwordVerified;

    }

    public function session_obliterate()
    {

        $_SESSION = array();
        setcookie(session_name(),'', time() - 3600, '/');
        setcookie('loggedin', '', time() - 3600, '/');
        session_destroy();   // Destroy session data in storage.
        session_unset();     // Unset $_SESSION variable for the runtime.
        $this->validSession = FALSE;
        return $this->validSession;

    }

    public function session_secure_init()
    {
        session_set_cookie_params(4200);

        $this->validSession = TRUE;

        if (!defined('OURUNIQUEKEY')) {

            define('OURUNIQUEKEY', 'phpi');

        }

        // Avoid session prediction.
        $this->sessionname = OURUNIQUEKEY;

        if (session_name() != $this->sessionname) {

            session_name($this->sessionname);

        } else {

            session_name();

        }

        // Start session.
        session_start();

        if ((!isset($_COOKIE['loggedin']) && isset($_SESSION['LOGGEDIN']))
            ^ (isset($_COOKIE['loggedin']) && !isset($_SESSION['LOGGEDIN']))) {

            $this->validSession = FALSE;

        }

        if ($this->validSession == TRUE) {

            // Avoid session fixation.
            if (!isset($_SESSION['INITIATED'])) {

                session_regenerate_id();
                $_SESSION['INITIATED'] = TRUE;

            }

            if (!isset($_SESSION['CREATED'])) {

                $_SESSION['CREATED'] = time();

            }

            if (time() - $_SESSION['CREATED'] > 3600) {

                // Session started more than 60 minutes ago.
                session_regenerate_id();    // Change session ID for the current session an invalidate old session ID.
                $_SESSION['CREATED'] = time();  // Update creation time.

            }

            // Avoid session hijacking.
            $this->useragent = $_SERVER['HTTP_USER_AGENT'];

            $this->useragent .= OURUNIQUEKEY;

            if (isset($_SESSION['HTTP_USER_AGENT'])) {

                if ($_SESSION['HTTP_USER_AGENT'] != md5($this->useragent)) {

                    $this->validSession = FALSE;

                }

            } else {

                $_SESSION['HTTP_USER_AGENT'] = md5($this->useragent);

            }

            // Avoid session fixation in case of an inactive session.
            if ($this->validSession == TRUE && isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY']) > 3600) {

                // Last request was more than 60 minutes ago.
                $this->validSession = FALSE;

            } else {

                $_SESSION['LAST_ACTIVITY'] = time(); // Update last activity timestamp.
            }
        }
        return $this->validSession;
    }



}

