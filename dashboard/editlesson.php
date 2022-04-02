<?php
session_start();
require './db.php';
if(!(isset($_SESSION['login']))){
    header("Location: ./login.php");
    exit();
}
if (!(isset($_GET['ID']))) {
    header("Location: ./index.php");
}else{
    $fetchlesson=$con->prepare("SELECT * FROM lesson WHERE id=?");
    $fetchlesson->bindValue(1,$_GET['ID']);
    $fetchlesson->execute();
    $lesson=$fetchlesson->fetch(PDO::FETCH_ASSOC);
    $codevalues=json_decode($lesson['codebox']);
    $_SESSION['editID']=$_GET['ID'];

}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title><?= $lesson['lessontitle']; ?></title>
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
            <?=$lesson['lessonContent'];?>
        </textarea>
    </section>

    <span onclick="addcodevalue(this)" id="addcodevalue">افزودن جعبه کد</span>

    <br><br><br>

    <section>
        <section id="codevalues" style="width: 80%;margin: auto;">
            <?php
            $fetchmode = $con->prepare("SELECT * FROM `code-mode`");
            $fetchmode->execute();
            $modes = $fetchmode->fetchAll(PDO::FETCH_ASSOC);
            $count=1; foreach ($codevalues as $codevalue){ ?>
                <div class="codevalue">
                    <b>جعبه کد <?=$count++;?></b>
                    <select class="mode">
                        <?php foreach ($modes as $mode) {?>
                        <option value="<?=$mode['modeName']?>" <?= ($codevalue->mode == $mode['modeName']) ? 'selected':'';?> ><?=$mode['modeName']?></option>
                        <?php } ?>
                    </select>
                    <textarea class="code" style="width: 80%;" rows="5"><?=$codevalue->code;?></textarea>
                </div>
                <br>
            <?php } ?>
        </section>
        <br>
        <div class="seobox">
            <textarea id="keyword" rows="2"><?=$lesson['lessonKeyword'];?></textarea>
            <textarea oninput="checklength(this)" id="description" rows="8"><?=$lesson['lessonDescription'];?></textarea>
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
<script src="../js/editlesson.js"></script>
</body>

</html>