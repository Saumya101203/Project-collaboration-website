<?php
// Simulated retrieval of logged-in user's email (replace with your authentication mechanism)
session_start(); // Start session if not already started

if (isset($_SESSION['user_email'])) {
    $loggedInUserEmail = $_SESSION['user_email']; // Assuming user email is stored in session
    echo json_encode(array('email' => $loggedInUserEmail));
} else {
    // Handle case where user is not logged in or email is not set
    echo json_encode(array('error' => 'User email not found'));
}
?>
