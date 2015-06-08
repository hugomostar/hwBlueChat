<?php

class User
{
	public $username;
	public $password;
	public $firstname;
	public $lastname;
	public $email;

	public function __construct($data,$required)
	{
		
		for ($i = 0; $i < count($required); $i++) { 
			$this->$required[$i] = $data["$required[$i]"];
		}
	}

	public function updateUserProfile($name, $arg, $userID) {
		
		$sql = "UPDATE user set $name = '$arg' WHERE id = '$userID'"; 
		$result = Baza::$db->query($sql);
		return $result;
		
		}
	
	public function login($username, $password) {
		
		$sql = "SELECT * FROM user "
			   ." WHERE username = '$username' AND password = '$password'";			   
		$result = Baza::$db->query($sql);
		return $result;
		
		}
	
	public function register($username, $password, $firstname, $lastname, $email) {
		
		
		$sql = "INSERT INTO user (username, password, name, surname, email) "
			   ."VALUES ('$username', '$password', '$firstname', '$lastname', '$email')"; 	
		$result = Baza::$db->query($sql);
		return $result;
		
		}

}
