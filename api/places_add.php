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

$name = $data['name'];
$description = $data['description'];
$region = $data['region'];
$latitude = $data['latitude'];
$longitude = $data['longitude'];
$image = $data['photo_url_1'];
$catagory = $data['catagory'];
$rating = $data['rating'];

$sql = "INSERT INTO places (name, description, region, latitude, longitude, image, catagory, rating) VALUES ('$name', '$description', '$region', '$latitude','$longitude', '$image', '$catagory', '$rating')";

$result = mysqli_query($con, $sql);

if (!$result) {
    echo "Error: " . mysqli_error($con);
} else {
    echo "Entry Successful";
}


$con->close();
?>