<?php
    $servername = "mariadb";
    $username = "root";
    $password = "rootpassword";
    $dbname = "your_db_name_here";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("connection failed: " . $conn->connect_error);
    }
?>
