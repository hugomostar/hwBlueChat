<?php

require_once '/etc/chat/db_config.php';
require_once 'DB.php';

new DB($dbCfg['host'], $dbCfg['username'], 
	$dbCfg['password'], $dbCfg['db']);


