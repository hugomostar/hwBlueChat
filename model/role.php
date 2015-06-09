<?php
class Role
{
    protected $permissions;
	
    protected function __construct() {
        $this->permissions = array();
    }
 
    // return a role object with associated permissions
    public static function getRolePerms($role_id) {
        $role = new Role();
        $sql = "SELECT permission.permission FROM rolePermission 
                JOIN permission ON rolePermission.permissionId = permission.id
                WHERE rolePermission.roleId = ?";
        $sth = Baza::$db->prepare($sql);          
        $sth->bind_param("i", $role_id);
        $sth->execute();  
        $result1 = $sth->get_result();
        while($row = $result1->fetch_array()){
            $role->permissions[$row["permission"]] = true;
        }
        return $role;
    }
 
    // check if a permission is set
    public function hasPerm($permission) {
        return isset($this->permissions[$permission]);
    }
    
    
}
