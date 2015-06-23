<?php
	class Permission {
		private $permission;
		private $type;
		private $status;

		public function __construct($data,$required) {

			for ($i = 0; $i < count($required); $i++) {
				$this->$required[$i] = $data["$required[$i]"];
			}

		}

		public function addPermission() {
			$sql = "INSERT INTO permission (permission) VALUES (?)";
			$result = DB::$db->prepare($sql);
			$result->bind_param("s", $this->permission);
			
			if (!$result->execute()) {
			echo "Execute failed: (" . $result->errno . ") " . $result->error; 
			die();
			}
			
			$this->status = 'active';
			self::changePermissionStatus();
			return $this->permission;
		}

		public function changePermissionStatus() {
			$sql = "UPDATE permission set status = ? WHERE permission = ?";
			$result = DB::$db->prepare($sql);
			$result->bind_param("ss", $this->status, $this->permission);
			$result->execute();
			return $this->permission;
		}
		
		public static function addPermToRole($role, $permission) {
			
			$sqlGetRole = "SELECT id FROM role WHERE name = ?";		
			$resultGetRole = DB::$db->prepare($sqlGetRole);
			$resultGetRole->bind_param("s", $role);	
			$resultGetRole->execute();
			$resGetRole = $resultGetRole->get_result();
			$idRoleResult = $resGetRole->fetch_object();
			$roleId = $idRoleResult->id;	
			
			$sqlGetPermission = "SELECT id FROM permission WHERE permission = ?";		
			$resultGetPermission = DB::$db->prepare($sqlGetPermission);
			$resultGetPermission->bind_param("s", $permission);	
			$resultGetPermission->execute();
			$resGetPermission = $resultGetPermission->get_result();
			$idPermissionResult = $resGetPermission->fetch_object();
			$permissionId = $idPermissionResult->id;	
					
			$sqlInsert = "INSERT INTO rolePermission (roleId, permissionId, dateAssigned) 
					  SELECT ?, ?, NOW() FROM DUAL WHERE NOT EXISTS 
					  (SELECT id FROM rolePermission WHERE roleId = ? AND permissionId = ?);";		
			$resultInsert = DB::$db->prepare($sqlInsert);
			$resultInsert->bind_param("ssss", $roleId, $permissionId, $roleId, $permissionId);	
			$resultInsert->execute();
			$resInsert = $resultInsert->get_result();
		
			return $resultInsert->affected_rows;
			
			}

	}
