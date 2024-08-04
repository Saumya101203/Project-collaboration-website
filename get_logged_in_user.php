<?php
session_start(); // Start session if not already started

if (isset($_SESSION['email'])) {
    $loggedInUserEmail = $_SESSION['email']; // Correct session key
    echo json_encode(array('email' => $loggedInUserEmail));
} else {
    echo json_encode(array('error' => 'User email not found'));
}
?>
