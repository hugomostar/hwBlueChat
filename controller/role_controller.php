<?php

require_once "DAL/baza.php";
require_once "DAL/db.php";


class role_controller {
	
	private $data;
	
	public function __construct($data)
	{
		$this->data = $data;
	}
	
	public function insertRole(){
		
		include "model/role.php";
		include "model/rolePermission.php";
		include "model/token.php";
		
		$checkToken = new Token();
		$userId = $checkToken->isLogedIn();		
		
		if (empty($userId)) {				
			return "Korisnik nije logiran";					
		}		
		$name = $this->data['roleName'];
		
		$user = rolePermission::getById($userId);	
						
		if ($user->hasPrivilege("addRole")) {			
			$sql = "INSERT INTO role (name) "
			   ."VALUES ('$name')"; 			   	
			$result = Baza::$db->query($sql);			
			return "Uspješno dodana rola";
		} else {
			return "Nemate privilegije za ovu akciju";
			}
					
		return $user;
	}
}
