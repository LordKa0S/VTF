<?php
$servername = "sql12.freemysqlhosting.net:3306";
$username = "sql12280463";
$password = "QiCdU6XAks";
$db="sql12280463";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $db);


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
// else
// 	echo "Connected successfully";
?>