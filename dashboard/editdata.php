<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
if (isset($_SESSION['editID'],$_POST['Data'], $_POST['CodeData'],$_POST['keyword'], $_POST['description'], $_POST['status'])) {
        $send = $con->prepare("UPDATE lesson SET lessonContent=?,codebox=?,lessonKeyword=?,lessonDescription=?,lessonStatus=? WHERE id=?");
        $send->bindValue(1, $_POST['Data']);
        $send->bindValue(2, $_POST['CodeData']);
        $send->bindValue(3, $_POST['keyword']);
        $send->bindValue(4, $_POST['description']);
        $send->bindValue(5, $_POST['status']);
        $send->bindValue(6, $_SESSION['editID']);
        $send->execute();
        unset($_SESSION['editID']);
}