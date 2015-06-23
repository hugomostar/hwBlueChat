<?php

	class PermissionController 
	{

		private $data;

		public function __construct($data){
			$this->data = $data;
		}

		public function addPerm(){

				$perm = new Permission($this->data, array('permission'));
				$result = $perm->addPermission();
				return "Successfully added permission '$result'";
			
		}

		public function changePermStatus() {
			
			$role = new Permission($this->data, array('permission', 'status'));
			$result = $role->changePermissionStatus();
			return "Permission '$result' is changed to '" .$this->data['status']. "'.";
			
		}

	}
