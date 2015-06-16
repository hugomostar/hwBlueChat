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
		
		$sql = "UPDATE user set $name = ? WHERE id = ?"; 
		$result = Baza::$db->prepare($sql);		
		$result->bind_param("si", $arg, $userID);	
		$result->execute();
		$res = $result->get_result();
		return $res;
		
		}
	
	public function login($username, $password) {
		
		$password = md5($password);
		$sql = "SELECT * FROM user WHERE username = ? AND password = ?";		
		$result = Baza::$db->prepare($sql);
		$result->bind_param("ss", $username, $password);	
		$result->execute();
		$res = $result->get_result();
		return $res;
		
		}
	
	public function register($username, $password, $firstname, $lastname, $email) {		
		
		$sql = "INSERT INTO user (username, password, name, surname, email) VALUES (?, ?, ?, ?, ?)"; 	
		$result = Baza::$db->prepare($sql);
		$result->bind_param("sssss", $username, $password, $firstname, $lastname, $email);	
		$result->execute();
		return $result;
		}

}
