<?php

	class rolePermission {
		
		public static function getById($userId) {				
			
			if (!empty($userId)) {
				
				$privUser = new rolePermission();
				$privUser->userId = $userId;
				$privUser->initRoles();
				return $privUser;
				} else {
				return false;
			}

		}

		protected function initRoles() {
			$sql = "SELECT userRole.roleId, role.name FROM userRole 
				JOIN role ON userRole.roleId = role.id WHERE userRole.userId = ? AND role.status = 'active'";
			$sth = DB::$db->prepare($sql);
			$sth->bind_param("i", $this->userId);
			$sth->execute();
			$result1 = $sth->get_result();
			while($row = $result1->fetch_array()) {
				$this->roles[$row["name"]] = self::getRolePerms($row["roleId"]);
			}

		}

		public static function getRolePerms($role_id) {
			$role = new rolePermission();
			$sql = "SELECT permission.id, permission.permission FROM rolePermission 
                JOIN permission ON rolePermission.permissionId = permission.id
                WHERE rolePermission.roleId = ? AND permission.status = 'active'";
			$sth = DB::$db->prepare($sql);
			$sth->bind_param("i", $role_id);
			
			if (!$sth->execute()) {
				echo "Execute failed: (" . $sth->errno . ") " . $sth->error;
				die();
			}
			//$sth->execute();  
			$result1 = $sth->get_result();
			while($row = $result1->fetch_array()){
				$role->permissions[$row["permission"]] = $row["id"];
			}

			return $role;
		}

		// provjeri ima li korisnik odredjenu permisiju 
		public function hasPrivilege($perm) {
			foreach ($this->roles as $role) {
				
				if ($role->hasPerm($perm)) {
					return true;
				}

			}
			return false;
		}
		
		public function hasPerm($permission) {
			return isset($this->permissions[$permission]);
		}

	}
