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

	}
