<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tour";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
else {
    echo "Connected successfully";
}
// include('./models/place.php');
header('Content-Type: application/json');
// $sql2 = "SELECT * FROM places";
// $result2 = $conn->query($sql2);

// if (!$result2) {
//     echo "Error: " . mysqli_error($conn);
// } else {
//     if ($result2->num_rows > 0) {
//         while ($row2 = $result2->fetch_assoc()) {
//             $place = [
//                 "id" => $row2["id"],
//                 "name" => $row2["name"],
//                 "description" => $row2["description"],
//                 "region" => $row2["region"],
//                 "latitude" => $row2["latitude"],
//                 "longitude" => $row2["longitude"],
//                 "image" => $row2["image"],
//                 "catagory" => $row2["name"],
//             //    ' review' => getreviewByplaceid($row["id"]),
//             ];

            
//         }
//     } else {
//         echo "No results found";
//     }
// }

$query = "SELECT * FROM places";
$result = $conn->query($query);;

if ($result->num_rows > 0) {
  $data = [];
  while ($row = $result->fetch_assoc()) {
    $place = [
      'id' => $row['id'],
      'name' => $row['name'],
      'description' => $row['description'],
      'region' => $row['region'],
      'latitude' => $row['latitude'],
      'longitude' => $row['longitude'],
      'image' => $row['image'],
      'catagory' => $row['catagory'],
     
    ];
    array_push($data, $place);
  }
  $response = [
    'status' => 200,
    'data' => $data];
  echo (json_encode($response));
} else {
  $response = array(
    'status' => '400',
    'error' => 'No data found'
  );
  echo(json_encode($response));
}


$conn->close();

?>