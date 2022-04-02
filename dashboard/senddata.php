<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
if (isset($_SESSION['TITLE'], $_POST['courseId'], $_POST['seasonId'], $_POST['Data'], $_POST['CodeData'], $_POST['InsertUpdate'])) {
    if ($_POST['InsertUpdate'] == 'true') {
        $send = $con->prepare("INSERT INTO lesson SET lessontitle=?,courseId=?,seasonId=?,lessonContent=?,codebox=?");
        $send->bindValue(1, $_SESSION['TITLE']);
        $send->bindValue(2, $_POST['courseId']);
        $send->bindValue(3, $_POST['seasonId']);
        $send->bindValue(4, $_POST['Data']);
        $send->bindValue(5, $_POST['CodeData']);
        $send->execute();
        $reserve = $con->prepare("SELECT id FROM lesson ORDER BY id DESC LIMIT 1");
        $reserve->execute();
        $previousID = $reserve->fetch(PDO::FETCH_ASSOC);
        $_SESSION['previousID'] = $previousID['id'];
    } else {
        $send = $con->prepare("UPDATE lesson SET lessonContent=?,codebox=? WHERE id=?");
        $send->bindValue(1, $_POST['Data']);
        $send->bindValue(2, $_POST['CodeData']);
        $send->bindValue(3, $_SESSION['previousID']);
        $send->execute();
    }

    if (isset($_POST['keyword'], $_POST['description'], $_POST['status'])) {
        $send = $con->prepare("UPDATE lesson SET lessonContent=?,codebox=?,lessonKeyword=?,lessonDescription=?,lessonStatus=? WHERE id=?");
        $send->bindValue(1, $_POST['Data']);
        $send->bindValue(2, $_POST['CodeData']);
        $send->bindValue(3, $_POST['keyword']);
        $send->bindValue(4, $_POST['description']);
        $send->bindValue(5, $_POST['status']);
        $send->bindValue(6, $_SESSION['previousID']);
        $send->execute();
        unset($_SESSION['editID']);
    }
}