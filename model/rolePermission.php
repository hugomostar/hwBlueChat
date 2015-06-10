<?php
	include "model/user.php";
	class rolePermission{
		private $userId;
		private $dateAssigned;
		private $roleId;
		private $permissionId;
		private $permissions;
		public
		function __construct($data,$required){
			$this->permissions = array();
			for ($i = 0; $i < count($required); $i++) {
				$this->$required[$i] = $data["$required[$i]"];
			}

		}

		public static
		function getById($userId) {
			
			if (!empty($userId)) {
				$privUser = new rolePermission($userId, array('userId'));
				$privUser->initRoles();
				return array($privUser, $privUser->roles);
			} else {
				return false;
			}

		}

		protected
		function initRoles() {
			$this->roleId = array();
			$sql = "SELECT userRole.roleId, role.name FROM userRole 
				JOIN role ON userRole.roleId = role.id WHERE userRole.userId = ? AND role.status = 'active'";
			$sth = Baza::$db->prepare($sql);
			$sth->bind_param("i", $this->userId);
			$sth->execute();
			$result1 = $sth->get_result();
			while($row = $result1->fetch_array()) {
				$this->roles[$row["name"]] = self::getRolePerms($row["roleId"]);
			}

		}

		public static
		function getRolePerms($role_id) {
			$role = new rolePermission();
			$sql = "SELECT permission.id, permission.permission FROM rolePermission 
                JOIN permission ON rolePermission.permissionId = permission.id
                WHERE rolePermission.roleId = ? AND permission.status = 'active'";
			$sth = Baza::$db->prepare($sql);
			$sth->bind_param("i", $role_id);
			
			if (!$sth->execute()) {
				echo "Execute failed: (" . $sth->errno . ") " . $sth->error;
				die();
				die();
			}

			//$sth->execute();  
			$result1 = $sth->get_result();
			while($row = $result1->fetch_array()){
				$role->permissions[$row["id"]] = $row["permission"];
			}

			return $role;
		}

		// provjeri ima li rola odreÄ�enu permisiju
		public
		function hasPerm($permission) {
			return isset($this->permissions[$permission]);
		}

		// provjeri ima li korisnik odreÄ�enu permisiju 
		public
		function hasPrivilege($perm) {
			foreach ($this->roles as $role) {
				
				if ($role->hasPerm($perm)) {
					return true;
				}

			}

			return false;
		}

	}
