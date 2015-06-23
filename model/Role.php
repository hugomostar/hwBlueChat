<?php
	class Role {
		private $permissions;
		private $name;
		private $status;

		public function __construct($data,$required) {

			$this->permissions = array();
			for ($i = 0; $i < count($required); $i++) {
				$this->$required[$i] = $data["$required[$i]"];
			}

		}

		public function addRole() {
			$sql = "INSERT INTO role (name) VALUES (?)";
			$result = DB::$db->prepare($sql);
			$result->bind_param("s", $this->name);
			
			if (!$result->execute()) {
			echo "Execute failed: (" . $result->errno . ") " . $result->error; 
			die();
			}
			
			$this->status = 'active';
			self::changeRoleStatus();
			return $this->name;
		}

		public function changeRoleStatus() {
			$sql = "UPDATE role set status = ? WHERE name = ?";
			$result = DB::$db->prepare($sql);
			$result->bind_param("ss", $this->status, $this->name);
			$result->execute();
			return $this->name;
		}
		
		public static function grantUserRole($userId, $name) {		
			
		$sqlGet = "SELECT id FROM role WHERE name = ?";		
		$resultGet = DB::$db->prepare($sqlGet);
		$resultGet->bind_param("s", $name);	
		$resultGet->execute();
		$res = $resultGet->get_result();
		$idResult = $res->fetch_object();
		$roleId = $idResult->id;

		$sqlInsert = "INSERT INTO userRole (roleId, userId, dateAssigned) 
					  SELECT ?, ?, NOW() FROM DUAL WHERE NOT EXISTS 
					  (SELECT id FROM userRole WHERE roleId = ? AND userId = ?);";		
		$resultInsert = DB::$db->prepare($sqlInsert);
		$resultInsert->bind_param("ssss", $roleId, $userId, $roleId, $userId);	
		$resultInsert->execute();
		
		}

	}
