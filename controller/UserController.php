<?php

	class UserController {
		
		private $data;
		public function __construct($data){
			
			$this->data = $data;
			
		}

		public function loginUser() {

			$db = DB::$db;
			$user = new User($this->data,array('username', 'password'));

			$result = $user->login($user->username, $user->password);
			
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

		public function registerUser() {
			
			$valid = new Valid();
			$validResult = $valid->isValid($this->data);
			
			if (!empty($validResult)){
				return $validResult;
			}

			$db = DB::$db;
			$user = new User($this->data,array('username', 'password', 'firstname', 'lastname', 'email'));
			
			if ($this->checkUserExists()==TRUE){
				return "Username or e-mail already registered.";
			}

			$result = $user->register($user->username, $user->password, $user->firstname, $user->lastname, $user->email);
			
			if ($result) {
				return "Successfully registered '$user->username'.";
			} else {
				return false;
			}

		}

		public function logoutUser() {
			
			$tok = new Token();
			$result = $tok->delete();
			
			if($result) {
				return "User $result successfully logged out!";
			} else {
				return "You are not logged in!";
			}

		}

		public function checkUserExists() {

			$sql="SELECT * FROM user WHERE username = '".$this->data['username']."' OR email = '".$this->data['email']."'";
			$result = DB::$db->query($sql);
			
			if ($result->num_rows === 0) {
				return false;
			} else {
				return true;
			}

		}

		public function editProfile() {

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
