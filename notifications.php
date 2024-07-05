<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "institute_db";

// Get data from POST request
$data = json_decode(file_get_contents('php://input'), true);
$userEmail = $data['userEmail'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch notifications for the user
$sql = "SELECT notifications.user_email, projects.projectName 
        FROM notifications 
        INNER JOIN projects ON notifications.project_id = projects.id
        WHERE notifications.owner_email = '$userEmail'";
$result = $conn->query($sql);

$notifications = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Store each row in notifications array
        $notifications[] = $row;
    }
}

// Close connection
$conn->close();

// Output notifications as JSON
echo json_encode($notifications);
?>
