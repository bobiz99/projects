<?php
session_start();


require_once "head.php";

if (isset($_SESSION['user'])) {
    $user = $_SESSION['user'];
}

require_once "header.php";

$page = "";

if (isset($_GET['page'])) {
    $page = $_GET['page'];
}

switch ($page) {

    case "home":
        include 'home.php';
        break;
    case "shop":
        include 'shop.php';
        break;
    case "about":
        include 'about.php';
        break;
    case "contact":
        include 'contact.php';
        break;
    case "admin":
        include 'admin.php';
        break;
    case "login":
        include 'login.php';
        break;
    case "register":
        include 'register.php';
        break;
    case "logout":
        include 'logic/logout.php';
        break;
    case "admin Panel":
        include 'adminpanel.php';
        break;
    default:
        include 'home.php';
}


require_once "footer.php";

require_once "scripts.php";
