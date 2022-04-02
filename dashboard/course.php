<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
if (!(isset($_GET['ID']))) {
    header("Location: ./index.php");
} else {
    $fetchCourse = $con->prepare("SELECT * FROM course WHERE id=?");
    $fetchCourse->bindValue(1, $_GET['ID']);
    $fetchCourse->execute();
    $course = $fetchCourse->fetch(PDO::FETCH_ASSOC);

    $fetchSeason = $con->prepare("SELECT seasonName,id FROM season WHERE seasonCourse=?");
    $fetchSeason->bindValue(1, $_GET['ID']);
    $fetchSeason->execute();
    $seasons = $fetchSeason->fetchAll(PDO::FETCH_ASSOC);
}

if (isset($_POST['addSeason'])) {
    $addSeason = $con->prepare("INSERT INTO season SET seasonName=?,seasonCourse=?");
    $addSeason->bindValue(1, $_POST['seasonName']);
    $addSeason->bindValue(2, $_GET['ID']);
    $addSeason->execute();
    header("Location: course.php?ID=" . $_GET['ID']);
    exit();
}
if(isset($_POST['addLesson'])){
    $_SESSION['COURSEID']=$_GET['ID'];
    $_SESSION['TITLE']=$_POST['lessonName'];
    header('Location: ./addlesson.php?courseId='.$_GET['ID'].'&seasonId='.$_POST['seasonId']);
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
    <link rel="stylesheet" href="../css/dash-course.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/fontawesome.min.css">
</head>

<body dir="rtl">
<header>
    <a href="./index.php">
        <i class="fas fa-tachometer-alt"></i>
    </a>
    <a href="./logout.php">
        <i class="fas fa-door-open"></i>
    </a>
</header>
<section class="add">
    <br><br>
    <div
            style="height: 170px;width: 170px;padding: 0;background-color: #67513e;border: 2px solid #201a14;display: inline-block;border-radius: 50%;">
        <img src="../img/upload/<?= $course['courseImg']; ?>" style="width: 100%;height: 100%;border-radius: 50%;">
    </div>
    <h1 style="text-align: center;"><?= $course['courseName']; ?></h1>
    <br><br>
    <form method="POST">
        <input type="text" name="seasonName" id="" placeholder="نام فصل">
        <br><br>
        <button type="submit" name="addSeason">افزودن فصل</button>
        <span style="clear: both;"></span>
        <br>
    </form>
    <form method="POST">
        <input type="text" name="lessonName" placeholder="نام قسمت">
        <br><br>
        <select name="seasonId" id="selectseason">
            <?php
            foreach ($seasons as $season) { ?>
                <option value="<?=$season['id']?>"><?= $season['seasonName'] ?></option>
            <?php } ?>
        </select>
        <button type="submit" name="addLesson">افزودن قسمت</button>
        <span style="clear: both;"></span>
        <br>
    </form>
</section>
<br>
<section class="SE">
    <?php foreach ($seasons as $season) { ?>
        <div>
            <p><?= $season['seasonName'] ?></p>
            <?php
                $fetchlessons=$con->prepare("SELECT id,lessontitle,lessonStatus FROM lesson WHERE courseId=? AND seasonId=?");
                $fetchlessons->bindValue(1,$_GET['ID']);
                $fetchlessons->bindValue(2,$season['id']);
                $fetchlessons->execute();
                $lessons=$fetchlessons->fetchAll(PDO::FETCH_ASSOC);
                foreach ($lessons as $lesson){
            ?>
            <div>
                <b><?= $lesson['lessontitle']; ?></b>
                <a href="editlesson.php?ID=<?=$lesson['id'];?>" id="edit">
                    <i class="fas fa-pencil-alt"></i>
                </a>
                <span id="eye">
                    <?php
                        if($lesson['lessonStatus']==1){
                    ?>
                            <i class="fas fa-eye"></i>
                    <?php }else if($lesson['lessonStatus']==0){ ?>
                            <i class="fas fa-eye-slash"></i>
                    <?php } ?>
                </span>
            </div>
                <?php }?>
        </div>
    <?php } ?>
</section>
<br>
</body>

</html>