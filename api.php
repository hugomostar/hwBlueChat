<?php
foreach (glob("controller/*.php") as $filename)
{
    include $filename;
}

foreach (glob("model/*.php") as $filename)
{
    include $filename;
}

foreach (glob("helper/*.php") as $filename)
{
    include $filename;
}

foreach (glob("DAL/*.php") as $filename)
{
    include $filename;
}

require __DIR__ . '/vendor/autoload.php';

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

$guestActions = array('loginUser', 'registerUser');

if(in_array($action, $guestActions)) {
	if (empty($userId)){
	$result["data"] = $controller->$action();
	$result["success"] = true;
	dump($result);
	} else {
		$result["data"] = "Already logged in, please logout to do this action!";
		$result["success"] = false;
		dump($result);
		exit();
	}
} else {			

if ($userId){
	
	$userPerm = RolePermission::getById($userId);
	
	if($userPerm->hasPrivilege($action)) {
	$result["data"] = $controller->$action($userId);
	$result["success"] = true;
	dump($result);
} else {
	$result["data"] = "You don't have privilege '$action'";
	$result["success"] = false;
	dump($result);
	exit();
	}
	
} else {
		
	$result["data"] = "User is not logged in!";
	$result["success"] = false;
	dump($result);
}

}
