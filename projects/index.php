<?php
$host = 'db';
$user = 'devuser';
$password = 'devpass';
$db = 'mydb';

$conn = new mysqli($host, $user, $password, $db);
if ($conn->connect_error){
    echo 'connection failed' . $conn->connect_error;
} else {
    echo 'Welcome, Successfully connected to MySql, Check <a href="?a=server_info">Server info</a>';
}

if (isset($_GET['a'])) {
	if ($_GET['a'] == 'server_info') {
		echo phpinfo();	
	}
}

?>