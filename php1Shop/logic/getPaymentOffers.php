<?php
require_once 'connection.php';


try {
    $query = $connection->query("SELECT * FROM paymentoffers")->fetchAll();
    echo json_encode($query);
} catch (PDOException $e) {
    echo $e->getMessage();
}
