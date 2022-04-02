<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
if (!(isset($_GET['courseId'], $_GET['seasonId'], $_SESSION['TITLE']))) {
    header("Location: ./index.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title><?= $_SESSION['TITLE']; ?></title>
    <script src="../ckeditor/build/ckeditor.js"></script>
    <script src="../ckfinder/ckfinder.js"></script>
    <link rel="stylesheet" href="../css/addlesson.css">
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
<form method="post">
    <section onkeypress="autosave()" id="container-editor">
        <textarea id="editor" name="lessonContent" placeholder="شروع کن به نوشتن...">
        </textarea>
    </section>

    <span onclick="addcodevalue(this)" id="addcodevalue">افزودن جعبه کد</span>

    <br><br><br>

    <section>
        <section id="codevalues" style="width: 80%;margin: auto;"></section>
        <br>
        <div class="seobox">
            <textarea id="keyword" rows="2"></textarea>
            <textarea oninput="checklength(this)" id="description" rows="8"></textarea>
            <p>کاراکتر: <span id="length">0</span></p>
        </div>
        <br><br>
        <div>
            <span onclick="autosave(0)" id="draftbtn"><b>پیش نویس</b></span>
            <span onclick="autosave(1)" id="publishbtn"><b>انتشار</b></span>
        </div>
    </section>
</form>
<div style="display: none">
    <input type="text" id="courseId" value="<?= $_GET['courseId'] ?>">
    <input type="text" id="seasonId" value="<?= $_GET['seasonId'] ?>">
    <select id="selectmodes" class="mode">`+
        <?php
        $fetchmode = $con->prepare("SELECT * FROM `code-mode`");
        $fetchmode->execute();
        $modes = $fetchmode->fetchAll(PDO::FETCH_ASSOC);
        foreach ($modes as $mode) {?>
            <option value="<?=$mode['modeName']?>"><?=$mode['modeName']?></option>
        <?php } ?>
        
    </select>
</div>
<br><br>
<script src="../js/addlesson.js"></script>
</body>

</html>