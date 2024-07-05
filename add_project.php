<?php
session_start();

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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get logged-in user's email from session (replace with your session variable)
    // $userEmail = $_SESSION['email']; // Replace 'email' with your session variable name

    $projectName = $_POST['projectName'];
    $projectSubject = $_POST['projectSubject'];
    $projectDescription = $_POST['projectDescription'];
    $projectTopics = $_POST['projectTopics'];
    $userEmail = $_POST['userEmail']; // Retrieve user's email from form input

    if (empty($userEmail) || empty($projectName) || empty($projectSubject) || empty($projectDescription) || empty($projectTopics)) {
        echo json_encode(["success" => false, "message" => "All fields are required."]);
    } else {
        $sql = "INSERT INTO projects (projectName, projectSubject, projectDescription, projectTopics, email) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssss", $projectName, $projectSubject, $projectDescription, $projectTopics, $userEmail);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "Project added successfully."]);
        } else {
            echo json_encode(["success" => false, "message" => "Error adding project."]);
        }

        $stmt->close();
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}

$conn->close();
?>
