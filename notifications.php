<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "institute_db";

if (!isset($_SESSION['email'])) {
    echo json_encode([]);
    exit();
}

$userEmail = $_SESSION['email'];

error_log('Fetching notifications for email: ' . $userEmail); // Debugging

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT notifications.user_email, projects.projectName 
        FROM notifications 
        INNER JOIN projects ON notifications.project_id = projects.id
        WHERE notifications.owner_email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $userEmail);
$stmt->execute();
$result = $stmt->get_result();

$notifications = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $notifications[] = $row;
    }
}

$stmt->close();
$conn->close();

echo json_encode($notifications);
?>
