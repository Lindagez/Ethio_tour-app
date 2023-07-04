<?php

// Include the database connection file.
include('db.php');
$categories = [];
$dir = 'categories';
if (is_dir($dir)) {
    $files = scandir($dir);
    foreach ($files as $file) {
        if ($file != '.' && $file != '..') {
            $category = [
                'id' => null,
                'name' => $file,
               
                'places' => [],
                'rating' => 0,

            ];

            $categories[] = $category;
        }
    }
}
// Get the category data from the API.
// $data = json_decode(file_get_contents('php://input'));

$category = [
  'name' => $data->name,
  'description' => $data->description,
  'region' => $data->region,
  'latitude' => $data->latitude,
  'longitude' => $data->longitude,
  'images' => $data->images,
  'categories' => $data->categories,
];
if (file_exists('categories/' . $name)) {
    // The category already exists
    $response = ['success' => false, 'message' => 'The category already exists.'];
    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    //  The category does not exist, so add it
    // file_put_contents('categories/' . $name, '');
    // file_put_contents('categories/' . $name . '.jpg', $image);
    // file_put_contents('categories/' . $name . '_profile_picture.jpg', $profile_picture);


$sql = 'INSERT INTO categories (name, description, region, latitude, longitude, image) VALUES (:name, :description, :region, :latitude, :longitude, :image)';
$stmt = $db->prepare($query);
$stmt->bindParam(':name', $category['name']);
$stmt->bindParam(':description', $category['description']);
$stmt->bindParam(':region', $category['region']);
$stmt->bindParam(':latitude', $category['latitude']);
$stmt->bindParam(':longitude', $category['longitude']);
$stmt->bindParam(':image', $category['image']);
$stmt->bindParam(':category', $category['category']);
$stmt->execute();
}
// Calculate rating
$rating = 0;
$reviews = $conn->query('SELECT rating FROM reviews WHERE category = ?', [$name]);
foreach ($reviews as $review) {
    $rating += $review['rating'];
}
$rating = $rating / count($reviews);


$sql = 'UPDATE categories SET rating = ? WHERE name = ?';
$stmt = $db->prepare($sql);
$stmt->execute([$rating, $name]);

$response = ['success' => true, 'message' => 'The category was added successfully.'];
header('Content-Type: application/json');
echo json_encode($response);

// Get category ID.
$category_id = $db->lastInsertId();


if ($category_id) {
 
  $response = ['error' => false, 'message' => 'Category inserted successfully'];
} else {

  $response = ['error' => true, 'message' => 'Error: ' . mysqli_error($conn)];
}

// Output the response.
header('Content-Type: application/json');
echo json_encode($response);

?>
