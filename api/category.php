<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$database = "tour";
header('Content-Type: application/json');
include('./models/reviews.php');
$con = new mysqli($serverHost, $user, $password, $database);
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}

$query = "SELECT * FROM categories";
$result = $con->query($query);

$categories = array();

while ($row = $result->fetch_assoc()) {
    $category = array(
        "id" => $row["id"],
        "name" => $row["name"],
        "places" => array()
    );

    $placesQuery = "SELECT * FROM places WHERE catagory = " . $row["id"];
    $placesResult = $con->query($placesQuery);

    while ($placeRow = $placesResult->fetch_assoc()) {
        $place = array(
            'id' => $placeRow["id"],
            "name" => $placeRow["name"],
            "description" => $placeRow["description"],
            "region" => $placeRow["region"],
            "latitude" => $placeRow["latitude"],
            "longitude" => $placeRow["longitude"],
            "pictures" => array(),
            "catagory" => $row["name"],
            "review_info" => getReviewByPlaceId($placeRow["id"])['data']
        );

        // $picturesQuery = "SELECT * FROM pictures WHERE place_id = " . $placeRow["id"];
        // $picturesResult = $con->query($picturesQuery);

        // while ($pictureRow = $picturesResult->fetch_assoc()) {
        //     array_push($place["pictures"], $pictureRow["url"]);
        // }

        // $reviewsQuery = "SELECT * FROM reviews WHERE id = " . $placeRow["id"];
        // $reviewsResult = $con->query($reviewsQuery);

        // $totalRating = 0;
        // $numReviews = 0;

        // while ($reviewRow = $reviewsResult->fetch_assoc()) {
        //     $totalRating += $reviewRow["rating"];
        //     $numReviews++;
        // }

        // if ($numReviews > 0) {
        //     $place["rating"] = $totalRating / $numReviews;
        // }

    
        array_push($category["places"], $place);
        
    }
    array_push($categories, $category);
}


header('Content-Type: application/json');
echo json_encode($categories);