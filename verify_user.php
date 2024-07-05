<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "institute_db";

// Get data from POST request
$data = json_decode(file_get_contents('php://input'), true);
$userEmail = $data['email'];
$userPassword = $data['password'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Validate user credentials
$sql = "SELECT * FROM users WHERE email = ? AND password = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $userEmail, $userPassword);
$stmt->execute();
$result = $stmt->get_result();

$response = array();
if ($result->num_rows > 0) {
    $response['authenticated'] = true;
} else {
    $response['authenticated'] = false;
}

echo json_encode($response);

$stmt->close();
$conn->close();
?>
