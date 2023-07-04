<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour'; // change

//post = send/save data to mydql db 
//get = retrieve/read data from db,

$conn= new mysqli('localhost','root','','tour');

if(!$conn)
{
    die("connection Failed:". $conn -> connect_error );  
}
else{
    echo"connection successfully";
}
?>