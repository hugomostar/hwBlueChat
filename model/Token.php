<?php

class Token
{	
	public function isLogedIn()
	{
		$token = isset($_COOKIE['token']) ? $_COOKIE['token'] : NULL;	
		$db = DB::$db;
		$userID = FALSE;		
			if (!empty($token)) {
			$token = $db->real_escape_string($token);
			$sql = "SELECT userID FROM token WHERE value = '$token' "
			. " AND validTo > NOW() ";
			$result = $db->query($sql);	
			$data = $result->fetch_object();
			} else {
				return false;
			}			
			
			if ($data) {
				return $data->userID;
			} else {
				return FALSE;
			}
	}
	
	public function create($idUser)
	{
		$token = $this->generate();
		$db = DB::$db;
		$sql = "INSERT INTO token (userID, value, created, validTo) VALUES ($idUser, '$token', NOW(), DATE_ADD(NOW(), INTERVAL 12 HOUR))";
		$db->query($sql);
		setcookie('token', $token);
		$_COOKIE['token'] = $token;
	}
	
	public function delete()
	{
	 	$db = DB::$db;
					
       	$sqlLog = "SELECT userID FROM token WHERE value = '".$_COOKIE['token']."'";
       	$r=$db->query($sqlLog);
       	$u = $r->fetch_object();
       	$log = new Log();
       	$log->createLogout($u->userID);
		
		$sql = "UPDATE token SET validTo = NOW() WHERE value = '".$_COOKIE['token']."'";	
		$db->query($sql);
		setcookie("token", '', -1);
		$_COOKIE['token'] = null;	
					
		return $u->userID;	
		
	}
	
	private function generate()
	{
		return sha1(uniqid());
	}
}
