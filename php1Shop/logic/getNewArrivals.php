<?php
require_once 'connection.php';


try {
    $query = $connection->query('SELECT * FROM products ORDER BY dateofadd DESC LIMIT 3')->fetchAll();
    echo json_encode($query);
} catch (PDOException $e) {
    echo $e->getMessage();
}
