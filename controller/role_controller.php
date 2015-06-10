<?php
	require_once "DAL/baza.php";
	require_once "DAL/db.php";
	require_once "model/role.php";
	require_once "model/rolePermission.php";
	require_once "model/token.php";
	class role_controller {
		private $data;
		public
		function __construct($data){
			$this->data = $data;
		}

		public
		function addRole(){
			$checkToken = new Token();
			$userId = $checkToken->isLogedIn();
			
			if (empty($userId)) {
				return "Korisnik nije logiran";
			}

			$user = rolePermission::getById($userId);
			
			if ($user[0]->hasPrivilege("3")) {
				$role = new role($this->data, array('name'));
				$result = $role->addRole();
				return "UspjeÅ¡no dodana rola '$result'";
			} else {
				return "Nemate privilegije za ovu akciju";
			}

			return $user;
		}

		public
		function changeStatus() {
			$role = new Role($this->data, array('name', 'status'));
			$role->changeRoleStatus();
		}

	}
