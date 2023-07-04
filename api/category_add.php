<?php

if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    header('HTTP/1.1 405 Method Not Allowed');
    exit;
}



$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour';
// echo("data")
$jsonData = file_get_contents('php://input');
$data = json_decode($jsonData, true);
// $name = $data['name'];

$con = new mysqli("localhost", "root", "", "tour");
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
echo "Connected successfully" . "<br>";

$id = $data['id'];
$name = $data['name'];



$sql = "INSERT INTO category (id,name) VALUES ('$id', '$name')";

$result = mysqli_query($con, $sql);

if (!$result) {
    echo "Error: " . mysqli_error($con);
} else {
    echo "Entry Successful";
}


$con->close();
?>