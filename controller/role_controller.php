<?php
	require_once "DAL/baza.php";
	require_once "DAL/db.php";
	require_once "model/role.php";
	require_once "model/rolePermission.php";
	require_once "model/token.php";

	class role_controller 
	{

		private $data;

		public function __construct($data){
			$this->data = $data;
		}

		public function addRole(){

				$role = new role($this->data, array('name'));
				$result = $role->addRole();
				return "Successfully added role '$result'";
			
		}

		public function changeStatus() {
			
			$role = new Role($this->data, array('name', 'status'));
			$role->changeRoleStatus();
			
		}

	}
