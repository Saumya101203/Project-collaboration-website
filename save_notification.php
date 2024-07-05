<?php
// Database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "institute_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get data from POST request
$data = json_decode(file_get_contents('php://input'), true);
$projectId = $data['projectId'];
$loggedInUserEmail = $data['loggedInUserEmail'];

// Fetch project owner email from 'projects' table
$sql_owner_email = "SELECT email FROM projects WHERE id = ?";
$stmt_owner_email = $conn->prepare($sql_owner_email);
$stmt_owner_email->bind_param("i", $projectId);
$stmt_owner_email->execute();
$result_owner_email = $stmt_owner_email->get_result();

if ($result_owner_email->num_rows > 0) {
    $row_owner_email = $result_owner_email->fetch_assoc();
    $ownerEmail = $row_owner_email['email'];

    // Save notification to notifications table
    $sql_insert_notification = "INSERT INTO notifications (project_id, user_email, owner_email) VALUES (?, ?, ?)";
    $stmt_insert_notification = $conn->prepare($sql_insert_notification);
    $stmt_insert_notification->bind_param("iss", $projectId, $loggedInUserEmail, $ownerEmail);

    $response = array();

    if ($stmt_insert_notification->execute()) {
        $response['success'] = true;
        $response['message'] = "Notification saved successfully.";
    } else {
        $response['success'] = false;
        $response['message'] = "Error saving notification: " . $conn->error;
    }

    echo json_encode($response);
} else {
    $response['success'] = false;
    $response['message'] = "Project owner not found.";
    echo json_encode($response);
}

$stmt_owner_email->close();
$stmt_insert_notification->close();
$conn->close();
?>
