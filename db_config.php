<?php
$servername = "localhost";
$username = "root";
$password = ""; // Wprowadź swoje hasło do bazy danych
$dbname = "mydatabase";

// Utworzenie połączenia
$conn = new mysqli($servername, $username, $password, $dbname);

// Sprawdzenie połączenia
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
