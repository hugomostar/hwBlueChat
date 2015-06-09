<?php
include "model/user.php";

class rolePermission
{
    private $roles;
    private $id;

	public function __construct($data,$required)
	{
		
		for ($i = 0; $i < count($required); $i++) { 
			$this->$required[$i] = $data["$required[$i]"];
		}
	}
 
    // override User method
    public static function getById($userId) {		
		
        if (!empty($userId)) {
            $privUser = new rolePermission($userId, array('id'));
			$privUser->initRoles();
            return $privUser;
        } else {
            return false;
        }
    }
 
    // populate roles with their associated permissions
    protected function initRoles() {

        $this->roles = array();
        $sql = "SELECT userRole.roleId, role.name FROM userRole JOIN role ON userRole.roleId = role.id WHERE userRole.userId = ?";
        $sth = Baza::$db->prepare($sql);  
        $sth->bind_param("i", $this->id);
        $sth->execute();  
        $result1 = $sth->get_result();
        while($row = $result1->fetch_array()) {
            $this->roles[$row["name"]] = Role::getRolePerms($row["roleId"]);
        }
    }
 
    // check if user has a specific privilege
    public function hasPrivilege($perm) {
        foreach ($this->roles as $role) {
            if ($role->hasPerm($perm)) {
                return true;
            }
        }
        return false;
    }
}
