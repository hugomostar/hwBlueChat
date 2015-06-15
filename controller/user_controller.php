<?php
	require_once "DAL/baza.php";
	require_once "DAL/db.php";
	include 'model/token.php';
	include 'model/user.php';
	include 'helper/validate.php';
	include 'model/log.php';
 
	class user_controller {
		private $data;
		public
		function __construct($data){
			$this->data = $data;
		}

		public function login() {

			$token = isset($_COOKIE['token']) ? $_COOKIE['token'] : NULL;
			$db = Baza::$db;
			$user = new User($this->data,array('username', 'password'));
			$checkToken = new Token();
			$tokenValidateResult = $checkToken->isLogedIn($token);
			
			if ($tokenValidateResult) {

				return ("Korisnik je logiran <br> Idi na <a href='http://www.w3schools.com'>Chat</a> <br> ili se odjavite:
					    <br><form name='form1' method='POST' action='api.php'> 
					    <input type='hidden' name='controller' value='user_controller'> <input type='submit' 						    name='action' value='Logout'>");
			}

			$username = $db->real_escape_string($user->username);
			$password = md5($db->real_escape_string($user->password));
			$result = $user->login($username, $password);
			
			if ($result->num_rows === 0) {
				return "Wrong username or password!";
			}

			$userID = $result->fetch_object();
			$token = new Token();
			$log = new Log();
			$token->create($userID->id);
			$log->createLogin($userID->id);
			return "User $userID->id successfully logged in!";
		}

		public function register() {

			$db = Baza::$db;
			$user = new User($this->data,array('username', 'password', 'firstname', 'lastname', 'email'));
			
			if ($this->check()==TRUE){
				return "Username or e-mail already registered.";
			}

			$valid = new Valid();
			$validResult = $valid->isValid($this->data);
			
			if (!empty($validResult)){
				return $validResult;
			}

			$username = $db->real_escape_string($user->username);
			$password = md5($db->real_escape_string($user->password));
			$firstname = $db->real_escape_string($user->firstname);
			$lastname = $db->real_escape_string($user->lastname);
			$email = $db->real_escape_string($user->email);
			$result = $user->register($username, $password, $firstname, $lastname, $email);
			
			if ($result) {
				return "Successfully registered '$username'.";
			} else {
				return false;
			}

		}

		public function logout() {
			$tok = new Token();
			$result = $tok->delete();
			
			if($result) {
				return "User $result successfully logged out!";
			} else {
				return "You are not logged in!";
			}

		}

		public function check() {

			$sql="SELECT * FROM user WHERE username = '".$this->data['username']."' OR email = '".$this->data['email']."'";
			$result = Baza::$db->query($sql);
			
			if ($result->num_rows === 0) {
				return false;
			} else {
				return true;
			}

		}

		public function editProfile() {

			$checkToken = new Token();
			$userID = $checkToken->isLogedIn();
			
			if (empty($userID)) {
				return "User is not logged in!";
			}

			$user = new User($this->data,array('password', 'firstname', 'lastname', 'email'));
			$changed = array();
			$valid = new Valid();
			
			if(strlen($user->password) > 0){
				$validResult = $valid->isValid(array("password"=>"$user->password"));
				
				if (!empty($validResult)) {
					return $validResult;
				}

				$password = md5($user->password);
				$name = 'password';
				$update = $user->updateUserProfile($name, $password, $userID);
				array_push($changed, "Password changed.");
			}

			
			if(strlen($user->firstname) > 0) {
				$validResult = $valid->isValid(array("firstname"=>"$user->firstname"));
				
				if (!empty($validResult)) {
					return $validResult;
				}

				$firstname = $user->firstname;
				$name = 'name';
				$update = $user->updateUserProfile($name, $firstname, $userID);
				array_push($changed, "Firstname changed.");
			}

			
			if(strlen($user->lastname) > 0){
				$validResult = $valid->isValid(array("lastname"=>"$user->lastname"));
				
				if (!empty($validResult)) {
					return $validResult;
				}

				$lastname = $user->lastname;
				$name = 'surname';
				$update = $user->updateUserProfile($name, $lastname, $userID);
				array_push($changed, "Lastname changed.");
			}

			
			if(strlen($user->email) > 0) {
				$validResult = $valid->isValid(array("email"=>"$user->email"));
				
				if (!empty($validResult)) {
					return $validResult;
				}

				$email = $user->email;
				$name = 'email';
				$update = $user->updateUserProfile($name, $email, $userID);
				array_push($changed, "Email changed.");
			}

			return $changed;
		}

	}
