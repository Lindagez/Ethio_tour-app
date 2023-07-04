<?php
// include('../config.php');

$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour';


$conn= new mysqli('localhost','root','','tour');


$table_name = 'user';

function getUsers() {

}

function getUserById($id) {
    global $conn;
    global $table_name;
    $sql = "SELECT * FROM ".$table_name." WHERE id = " . $id;
   
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $user = [
                "id" => $row["id"],
                "fullname" => $row["fullname"],
                "photo_url" => $row["photo_url"]
            ];
        }
        return $user;
    }

}

?>