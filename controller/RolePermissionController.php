<?php

class RolePermissionController {
	
		private $data;

		public function __construct($data){
			$this->data = $data;
		}

		public function getUserPermissions($userId){

			$user = RolePermission::getById($userId);
			$roles = $user->roles;
			$array = [];
						
			foreach ($roles as $obj) {
				array_push($array, $obj->permissions);
			}
			
			$merged = call_user_func_array('array_merge', $array);
			
			return $merged;
		
		}
		
		public function ban($userId){

			$user = RolePermission::getById($userId);
			$roles = $user->roles;
			$array = [];
						
			foreach ($roles as $obj) {
				array_push($array, $obj->permissions);
			}
			
			$merged = call_user_func_array('array_merge', $array);
			
			return $merged;
		
		}
}
