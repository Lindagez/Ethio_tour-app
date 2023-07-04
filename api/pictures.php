<?php
session_start();
if (!isset($_SESSION['user_id'])) {
  $response = ['error' => true, 'message' => 'User not logged in'];
  header('Content-Type: application/json');
  echo json_encode($response);
  exit();
}
$user_id = $_SESSION['user_id'];
if (isset($_FILES['image1']) && isset($_FILES['image2'])) {
  $file_name1 = $_FILES['image1']['name'];
  $file_tmp1 = $_FILES['image1']['tmp_name'];
  $file_type1 = $_FILES['image1']['type'];
  $file_size1 = $_FILES['image1']['size'];
  $allowed_types = ['image/jpeg', 'image/png'];
  if (!in_array($file_type1, $allowed_types)) {
    $response = ['error' => true, 'message' => 'Invalid file type for image 1'];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
  }
  $file_name2 = $_FILES['image2']['name'];
  $file_tmp2 = $_FILES['image2']['tmp_name'];
  $file_type2 = $_FILES['image2']['type'];
  $file_size2 = $_FILES['image2']['size'];
  if (!in_array($file_type2, $allowed_types)) {
    $response = ['error' => true, 'message' => 'Invalid file type for image 2'];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
  }
  $target_dir = "uploads/";
  $target_file1 = $target_dir . basename($file_name1);
  $target_file2 = $target_dir . basename($file_name2);
  if (!move_uploaded_file($file_tmp1, $target_file1)) {
    $response = ['error' => true, 'message' => 'Error uploading image 1'];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
  }
  if (!move_uploaded_file($file_tmp2, $target_file2)) {
    $response = ['error' => true, 'message' => 'Error uploading image 2'];
    header('Content-Type: application/json');
    echo json_encode($response);
    exit();
  }
  $response = ['success' => true, 'message' => 'Images uploaded successfully'];
  header('Content-Type: application/json');
  echo json_encode($response);
} else {
  $response = ['error' => true, 'message' => 'No files uploaded'];
  header('Content-Type: application/json');
  echo json_encode($response);
}
?>
