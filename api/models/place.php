<?php

$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour'; 


$conn= new mysqli('localhost','root','','tour');

if(!$conn)
{
    die("connection Failed:". $conn -> connect_error );  
}
else{
    echo"connection successfully";
}

$table_name = 'places';
include('./user/reviews.php');
function getPlaces() {
  global $table_name;
  $query = 'SELECT * from ' . $table_name;
  $result = execQuery($query);

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
}
function getplaceById($id) {
    global $conn;
    global $table_name;
    $sql = "SELECT * FROM ".$table_name." WHERE id = " . $id;
    echo($sql);
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
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
                // 'review_info' => getReviewByPlaceId($id)['data']
            ];
        }
        return $place;
    }

}


function addPlace($id,$name, $descriction, $latitude,$longitude, $image,$catagory) {
  global $conn;
  global $table_name;
  $sql = 'INSERT INTO ' . $table_name . ' (name, description, coordinates, imageUrl) value(?,?,?,?)';
  $stmt = $conn->prepare($sql);
  $stmt->bind_param('sssssss', $id,$name, $descriction, $latitude,$longitude, $image,$catagory);
  $stmt->execute();
  $response = [
    "status" => 200,
    "message" => "Added successfully"
  ];
  echo(json_encode($response));
}

function updatePlace($name, $desc, $coord, $imageUrl, $id)
{
  global $conn;
  global $table_name;
  $sql = 'UPDATE ' . $table_name . ' SET name = ?, description = ?, coordinates = ?, imageUrl = ? WHERE id = ?';
  $stmt = $conn->prepare($sql);
  $stmt->bind_param('ssssi', $name, $desc, $coord, $imageUrl, $id);
  $stmt->execute();
  $response = [
    "status" => 200,
    "message" => "Updated successfully"
  ];
  echo (json_encode($response));
}

function deletePlace($id)
{
  global $conn;
  global $table_name;
  $sql = 'DELETE FROM ' . $table_name . ' WHERE id = ?';
  $stmt = $conn->prepare($sql);
  $stmt->bind_param('i', $id);
  $stmt->execute();
  $response = [
    "status" => 200,
    "message" => "Deleted successfully"
  ];
  echo (json_encode($response));
}
?>
