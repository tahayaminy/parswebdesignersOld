<?php
session_start();
    require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
    if(!(isset($_GET['ID']))){
        header("Location: ./index.php");
    }else{
        $fetchCourse=$con->prepare("SELECT * FROM course WHERE id=?");
        $fetchCourse->bindValue(1,$_GET['ID']);
        $fetchCourse->execute();
        $course=$fetchCourse->fetch(PDO::FETCH_ASSOC);
    }
    if(isset($_POST['edit'])){
        $editCourse=$con->prepare("UPDATE course SET courseKeyword=?,courseDescription=? WHERE id=?");
        $editCourse->bindValue(1,$_POST['courseKeyword']);
        $editCourse->bindValue(2,$_POST['courseDescription']);
        $editCourse->bindValue(3,$course['id']);
        $editCourse->execute();
        header("Location: ./index.php");
    }
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/editcourse.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/fontawesome.min.css">
    <script src="../js/character.js"></script>
</head>

<body onload="checklength(false)" dir="rtl">
<header>
    <a href="./index.php">
        <i class="fas fa-tachometer-alt"></i>
    </a>
    <a href="./logout.php">
        <i class="fas fa-door-open"></i>
    </a>
</header>
    <form method="post" enctype="multipart/form-data">
        <div style="height: 100px;width: 100px;background-color: #67513e;border: 2px solid #201a14;display: inline-block;border-radius: 50%;">
            <img src="../img/upload/<?=$course['courseImg'];?>" style="width: 100%;height: 100%;border-radius: 50%;">
        </div>
        <br><br><br>
        <input type="text" name="courseKeyword" id="" value="<?=$course['courseKeyword'];?>">
        <br><br>
        <textarea id="description" oninput="checklength(this)" name="courseDescription" rows="5"><?=$course['courseDescription'];?></textarea>
        <p>کاراکتر: <span id="length">0</span></p>
        <br><br>
        <div style="width: 90%;"><button type="submit" name="edit" class="bold edit">ویرایش</button><span style="clear: both;"></span></div>
    </form>
    <br>
</body>

</html>