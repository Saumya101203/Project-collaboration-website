<?php
session_start();

if (!isset($_SESSION['email'])) {
    echo json_encode(['email' => null]);
    exit();
}

error_log('Current session email: ' . $_SESSION['email']); // Log session email
echo json_encode(['email' => $_SESSION['email']]);
?>

