<?php
include_once('./models/user.php');
$serverHost = "localhost";
$user = "root";
$password = "";
$database = 'tour';



$conn= new mysqli('localhost','root','','tour');

  function averageCal($rate_counter) {
    $five = $rate_counter["5"];
    $four = $rate_counter["4"];
    $three = $rate_counter["3"];
    $two = $rate_counter["2"];
    $one = $rate_counter["1"];
    $total_review = ($five) + ($four) + ($three) + ($two) + $one;
    $sum = ($five * 5) + ($four * 4) + ($three * 3) + ($two * 2) + $one;
    $average = $sum / $total_review;
    return number_format($average, 2);
  }

  function getReviewByPlaceId($placeId) {
    global $conn;
    $table_name = 'reviews';
    $query = 'SELECT * from ' . $table_name . ' WHERE place_id = ' . $placeId;
    
    $result = $conn->query($query);
    
    if ($result->num_rows > 0) {
      $data = [];
      $rate_counter = [
        "5" => 0,
        "4" => 0,
        "3" => 0,
        "2" => 0,
        "1" => 0
      ];
      while ($row = $result->fetch_assoc()) {
        $current_value = $rate_counter[''. $row['rating']];
        $rate_counter['' . $row['rating']] = $current_value + 1;
        $reviews = [
          'id' => $row['id'],
          'rating' => $row['rating'],
          'content' => $row['content'],
          'user' => getUserById($row['user_id'])
        ];
        array_push($data, $reviews);
      }
      $average = averageCal($rate_counter);
      $response = [
        "status" => 200,
        "data" => [
          "average" => $average,
          "counts" => $rate_counter,
          "reviews" => $data
        ]
        ];
      return $response;
    } else {
      return [];
    }
  }

  function reviewPlaceById($rating, $comment, $placeId, $userId) {
    global $conn;
    $table_name = 'review';
    $sql = 'INSERT INTO ' . $table_name . ' (rating, comment, placeId, userId) value(?,?,?,?)';
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('ssss', $rating, $comment, $placeId, $userId);
    $stmt->execute();
    $response = [
      "status" => 200,
      "message" => "Reviewed successfully"
    ];
    return $response;
  }
?>