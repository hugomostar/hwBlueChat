<?php

class Log
{
		
	public function createLogin($idUser)
	{
		$db = DB::$db;
		$sql = "INSERT INTO log (userID, dt, type) "
			   ."VALUES ($idUser, NOW(), 'Login')";
		$r = $db->query($sql);
	}
	
	
	public function createLogout($idUser)
	{
		
		$db = DB::$db;		
		$sql = "INSERT INTO log (userID, dt, type) "
			   ."VALUES ('$idUser', NOW(), 'Logout')"; 			   
		$r = $db->query($sql);
		return $idUser;
	}
	
	
}
