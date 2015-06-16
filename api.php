<?php


$params = $_REQUEST;
$action = $params['action'];
$controller = $params['controller'];
$token = isset($_COOKIE['token']) ? $_COOKIE['token'] : NULL;

//check if the controller exists. if it doesn't - stop

if( file_exists("controller/{$controller}.php") ) {
	include_once "controller/{$controller}.php";
} else {
    $result['success'] = false;
	die("Controller doesn't exit.");
}
$controller = new $controller($params); 

//check if method from controller exists, if it doesn't - stop

if( method_exists($controller, $action) === false ) {
    $result['success'] = false;
	die("Action doesn't exit.");
}

$userId = Token::isLogedIn($token);

$guestActions = array('login', 'register');

if(in_array($action, $guestActions)) {
	if (empty($userId)){
	$result["data"] = $controller->$action();
	$result["success"] = true;
	print_r($result);
	} else {
		$result["data"] = "Already logged in, please logout to do this action!";
		$result["success"] = false;
		print_r($result);
		exit();
	}
} else {			

$userPerm = rolePermission::getById($userId);

if($userPerm->hasPrivilege($action)) {
	$result["data"] = $controller->$action($userId);
	$result["success"] = true;
	print_r($result);
} else {
	$result["data"] = "You don't have privilege '$action'";
	$result["success"] = false;
	print_r($result);
	exit();
	}

}






























/*
 * $params = $_REQUEST;
$token = isset($_COOKIE['token']) ? $_COOKIE['token'] : NULL;
$action = $params['action'];

//check if the controller exists. if it doesn't - stop

if (empty($action) || empty($params)) {
	$result['success'] = false;
	die("Action or data is not specified");
}	else {
		switch($action) {
			case 'Login':	
				include_once 'controller/user_controller.php';
				$controller = new UserController($params);
				$result["data"] = $controller->login($token);
				$result["success"] = true;
				break;
			case 'Logout':
				include_once 'controller/user_controller.php';
				$controller = new UserController($params);
			    $result["data"] = $controller->logout();
			    $result["success"] = true;
				break;
			case 'Register':
				include_once 'controller/user_controller.php';
				$result["data"] = $this->onRegister($data);
				$result["success"] = true;
				break;
			default:
				die("Nepostojeca metoda!");
				break;
		}
	
}

print_r($result);



/*	
 * 
 * 
 * $controller = new $controller($params);
//check if method from controller exists, if it doesn't - stop
if( method_exists($controller, $action) === false ) {
    $result['success'] = false;
	die("Action doesn't exit.");
}
 * 
 * 
 * 
 * 
 * 
$args = $_REQUEST;
$v = new Valid();
$error = $v->isValid($args);
	
$json_data_string = '{"username":"'.$_POST['username'].'", "password":"'.$_POST['password'].'",'
				    .'"firstname":"'.$_POST['firstname'].'", "lastname":"'.$_POST['lastname'].'",'
				    .'"email":"'.$_POST['email'].'"}';				   

$data = isset($json_data_string) ? $json_data_string : NULL;
$action = isset($_POST['action']) ? $_POST['action'] : NULL;
$token = isset($_COOKIE['token']) ? $_COOKIE['token'] : NULL;


if (empty($action)) {
	die("Action is not specified");
}

$d = new Data();
if (!empty($data)) {
	$obj = json_decode($data, TRUE);
	
	if (json_last_error() !== JSON_ERROR_NONE) {
		die("Invalid JSON received");
	}
	
	foreach($obj as $key => $val) {
		$d->$key = $val;
	}
}

$api = new ApiController();

if ($error==false){
	try {
		$r = $api->handle($action, $d, $token);
	} catch(Exception $e){
		$r = new Result();
		$r->ok = FALSE;
		$r->error = $e->getMessage();
	}
} else {
	echo 'Ispravite pogreske';
}

if($r->error!=NULL) {
echo $r->error;
}
*/
