<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour'; // change

//post = send/save data to mydql db 
//get = retrieve/read data from db,

$conn = mysqli_connect($servername, $db_username, $db_password, $dbname);
if (!$conn) {
  $response = ['error' => true, 'message' => 'Connection failed: ' . mysqli_connect_error()];
  header('Content-Type: application/json');
  echo json_encode($response);
  exit();
}
$sql = "SELECT * FROM users WHERE cata";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) == 1) {
  $row = mysqli_fetch_assoc($result);
  $response = [
    'id' => $row['id'],
    'fullname' => $row['fullname'],
    'email' => $row['email'],
    'photo_url' => $row['photo_url']
  ];
  header('Content-Type: application/json');
  echo json_encode($response);
} else {
  $response = ['error' => true, 'message' => 'Invalid username or password'];
  header('Content-Type: application/json');
  echo json_encode($response);
}
mysqli_close($conn);




?>
