<?php

include("../config/db.php");

if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    header('HTTP/1.1 405 Method Not Allowed');
    exit;
}


$place_id = $_POST['place_id'];
$rating = $_POST['rating'];
$comment = $_POST['comment'];


if (!isset($_SESSION['user'])) {
    header('HTTP/1.1 401 Unauthorized');
    echo json_encode([
        'message' => 'You must be logged in to post a review.'
    ]);
    exit;
}


$user_id = $_SESSION['user']['id'];


$sql = 'INSERT INTO reviews (place_id, user_id, rating, comment) VALUES (?, ?, ?, ?)';
$stmt = $conn->prepare($sql);
$stmt->bind_param('iiii', $place_id, $user_id, $rating, $content);
$stmt->execute();


if ($stmt->affected_rows > 0) {
    header('HTTP/1.1 200 OK');
    echo json_encode([
        'message' => 'Review posted successfully.'
    ]);
    exit;
} else {
   
    header('HTTP/1.1 400 Bad Request');
    echo json_encode([
        'message' => 'Failed to post review.'
    ]);
    exit;
}

?>
