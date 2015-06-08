<?php

class Role
{	
	private $id;
	private $name;
	private $status;
	
	public function __construct($data,$required) {
		
		for ($i = 0; $i < count($required); $i++) { 
			$this->$required[$i] = $data["$required[$i]"];
		}
		
		return $this;
	}
}
