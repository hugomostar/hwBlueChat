<?php
	require_once "DAL/baza.php";
	require_once "DAL/db.php";
	require_once "model/role.php";
	require_once "model/rolePermission.php";
	require_once "model/token.php";
	class rolePermission_controller {
		private $data;
		public
		function __construct($data){
			$this->data = $data;
		}

		public
		function getUserPermissions(){
			$checkToken = new Token();
			$userId = $checkToken->isLogedIn();
			
			if (empty($userId)) {
				return "Korisnik nije logiran";
			}

			$user = rolePermission::getById($userId);
			
			if($user[1]) {
				return $user[1];
			} else {
				return "Korisnik nema privilegije";
			}

		}

	}
