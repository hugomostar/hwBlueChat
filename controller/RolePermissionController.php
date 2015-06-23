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
			
		public function grantUserRole() {
			
			$username = $this->data['username'];
			$roleName = $this->data['roleName'];
			
			$userId = User::getByUsername($username);	
			
			$affected = Role::grantUserRole($userId, $roleName);
			
			if ($affected === 0) {
				return "User '$username' already posseses role '$roleName'";
				} else {
					return "Role '$roleName' has been assigned to '$username'";
				}
			
			}
		
		public function addPermToRole() {
			
			$role = $this->data['roleName'];
			$permission = $this->data['permissionName'];
			
			$affected = Permission::addPermToRole($role, $permission);
			
			if ($affected === 0) {
				return "Role '$role' already posseses permission '$permission'";
				} else {
					return "Permission '$permission' has been assigned to role '$role'";
				}
			
			}
}
