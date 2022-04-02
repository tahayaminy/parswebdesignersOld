<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
    $tar="../img/upload/";
    $fetchCourse=$con->prepare("SELECT id,courseName FROM course");
    $fetchCourse->execute();
    $courses=$fetchCourse->fetchAll(PDO::FETCH_ASSOC);

    if(isset($_POST['newcourse'])){
        $addCourse=$con->prepare("INSERT INTO course SET courseName=?,courseImg=?,prerequisites=?,courseKeyword=?,courseDescription=?");
        $courseImg=basename($_FILES['courseImg']['name']);
        $TMP=$_FILES['courseImg']['tmp_name'];
        if(move_uploaded_file($TMP, $tar.$courseImg)){
            $addCourse->bindValue(1,$_POST['courseName']);
            $addCourse->bindValue(2,$courseImg);
            $addCourse->bindValue(3,$_POST['prerequisites']);
            $addCourse->bindValue(4,$_POST['courseKeyword']);
            $addCourse->bindValue(5,$_POST['courseDescription']);
            $addCourse->execute();
            header("Location: index.php");
            exit();
        }else{
            echo $_FILES['courseImg']['error'];
        }
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
    <link rel="stylesheet" href="../css/dash-index.css">
    <script src="../js/dash-index.js"></script>
    <script src="../js/character.js"></script>
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
    <form method="post" enctype="multipart/form-data">
        <input name="courseName" type="text" class="input2" placeholder="نام دوره">
        <div>
            <div>
                <input name="courseImg" onchange="choose(this)" type="file" class="inputFile">
                <div
                    style="height: 70px;width: 70px;background-color: #67513e;border: 2px solid #201a14;display: block;border-radius: 50%;">
                    <img id="vue" style="display: none;width: 100%;height: 100%;border-radius: 50%;">
                </div>
            </div>
        </div>
        <br><br>
        <select name="prerequisites" class="input2" style="height: 40px;">
            <option value="این دوره هیچ پیشنیازی ندارد!" selected>این دوره هیچ پیشنیازی ندارد!</option>
            <?php foreach ($courses as $course){?>
                        <option value="<?=$course['id'];?>"><?=$course['courseName'];?></option>
            <?php } ?>
        </select>
        <input name="courseKeyword" type="text" class="input" placeholder="کلمات کلیدی">
        <br><br>
        <textarea oninput="checklength(this)" name="courseDescription" id="" placeholder="توضیحات دوره"></textarea>
        <p>کاراکتر: <span id="length">0</span></p>
        <br><br>
        <div style="width: 100%;">
            <button onclick="submit()" type="submit" name="newcourse" class="newcourse bold">دوره جدید</button>
            <span style="clear: both;"></span>
        </div>
    </form>
    <table>
        <tr>
            <th>نام دوره</th>
            <th>فصل‌ها و قسمت‌ها</th>
            <th>ویرایش دوره</th>
        </tr>
        <?php foreach ($courses as $course){?>
                <tr class="tr">
                    <td><?=$course['courseName']?></td>
                    <td>
                        <a href="./course.php?ID=<?=$course['id']?>">
                            <i class="fas fa-folder-open"></i>
                        </a>
                    </td>
                    <td>
                        <a href="./editcourse.php?ID=<?=$course['id']?>">
                            <i class="fas fa-pencil-alt"></i>
                        </a>
                    </td>
                </tr>
            <?php } ?>
    </table>
    <br><br><br>
</body>

</html>