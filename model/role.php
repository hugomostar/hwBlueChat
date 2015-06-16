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
			$result = Baza::$db->prepare($sql);
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
			$result = Baza::$db->prepare($sql);
			$result->bind_param("ss", $this->status, $this->name);
			$result->execute();
			return $this->name;
		}

	}
