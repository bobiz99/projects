<?php
require_once 'connection.php';


try {
    $query = $connection->query("SELECT * FROM galleryimages g INNER JOIN purposes p ON g.purpose=p.id ")->fetchAll();
    echo json_encode($query);
} catch (PDOException $e) {
    echo $e->getMessage();
}
