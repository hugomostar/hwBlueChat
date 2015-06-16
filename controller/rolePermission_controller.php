<?php
	require_once "DAL/baza.php";
	require_once "DAL/db.php";
	require_once "model/role.php";
	require_once "model/rolePermission.php";
	require_once "model/token.php";

	class rolePermission_controller {
		private $data;

		public function __construct($data){
			$this->data = $data;
		}

		public function getUserPermissions($userId){

			$user = rolePermission::getById($userId);		
			return $user->roles;

		}

	}
