<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$db = "lib";
	
	$conn = mysqli_connect($servername, $username, $password, $db);
	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error($conn));
	}


	function sanitize($conn, $str){
		return mysqli_real_escape_string($conn, $str);
	}
	// var_dump(function_exists('mysqli_connect'));
	date_default_timezone_set("Asia/Kolkata");
?>