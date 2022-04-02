<?php
require './dashboard/db.php';
$fetchContent = $con->prepare("SELECT * FROM lesson WHERE id=?");
$fetchContent->bindValue(1, $_GET['ID']);
$fetchContent->execute();
$content = $fetchContent->fetch(PDO::FETCH_ASSOC);

$fetchAllLessons = $con->prepare("SELECT * FROM lesson WHERE courseId=? AND lessonStatus=?");
$fetchAllLessons->bindValue(1, $content['courseId']);
$fetchAllLessons->bindValue(2, 1);
$fetchAllLessons->execute();
$allLesson = $fetchAllLessons->fetchAll(PDO::FETCH_ASSOC);

$prev = $allLesson[0]['id'];
$next = $allLesson[count($allLesson) - 1]['id'];

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="<?= $content['lessonKeyword'] ?>">
    <meta name="description" content="<?= $content['lessonDescription'] ?>">
    <title><?= $content['lessontitle'] ?></title>

    <link rel="stylesheet" href="./css/learn.css">

    <script src="./js/codemirror/lib/codemirror.js"></script>
    <link rel="stylesheet" href="./js/codemirror/lib/codemirror.css">

    <script src="./js/codemirror/mode/javascript/javascript.js"></script>
    <script src="./js/codemirror/mode/htmlmixed/htmlmixed.js"></script>
    <script src="./js/codemirror/mode/xml/xml.js"></script>
    <script src="./js/codemirror/mode/css/css.js"></script>
    <script src="./js/codemirror/mode/shell/shell.js"></script>

    <script src="./js/codemirror/addon/scroll/simplescrollbars.js"></script>
    <link rel="stylesheet" href="./js/codemirror/addon/scroll/simplescrollbars.css">


    <link rel="stylesheet" href="./js/codemirror/theme/material-palenight.css">
    <link rel="icon" type="image/png" href="./pwdicon.png"/>
</head>

<body onresize="closemenu()" dir="rtl">
<p class="breadcrumb">
    <a href="./index.html">صفحه اصلی</a>
    <span style="font-weight: bold;">&gt;</span>
    <a href="courses.php">دوره‌های آموزشی</a>
    <span style="font-weight: bold;">&gt;</span>
    <a href="course.php?ID=<?= $content['courseId'] ?>" style="font-weight: bold;" id="page"><?php
        $fetchcourse = $con->prepare("SELECT * FROM course WHERE id=?");
        $fetchcourse->bindValue(1, $content['courseId']);
        $fetchcourse->execute();
        $course = $fetchcourse->fetch(PDO::FETCH_ASSOC);
        echo $course['courseName'];
        ?></a>
</p>
<section id="menuicon" onclick="menuicon()">
    <div>
        <div id="top"></div>
    </div>
    <div>
        <div id="bottom"></div>
    </div>
</section>
<?php
$fetchSeason = $con->prepare("SELECT * FROM season WHERE seasonCourse=?");
$fetchSeason->bindValue(1, $course['id']);
$fetchSeason->execute();
$Seasons = $fetchSeason->fetchAll(PDO::FETCH_ASSOC);

?>
<section id="menu">
    <?php
    foreach ($Seasons as $season) {
        $countstatus = 0;
        foreach ($allLesson as $lessonstatus) {
            if ($lessonstatus['seasonId'] == $season['id']) {
                $countstatus++;
            }
        }
        if ($countstatus > 0) {
            ?>
            <div>
            <p><b><?= $season['seasonName']; ?></b></p>
            <ul>
            <?php
            foreach ($allLesson as $lesson) {
                if ($lesson['seasonId'] == $season['id']) { ?>
                    <a href="learn.php?ID=<?= $lesson['id'] ?>"><?= $lesson['lessontitle'] ?></a>
                    <hr>
                <?php }
            }
        }
        ?>
        </ul>
        </div>
    <?php } ?>
</section>
<main>
    <article class="container">
        <section>
            <?= $content['lessonContent'] ?>


            <!--btns-->
            <br><br><br>
            <section style="width: 100%;color:#fff;">
                <a href="./learn.php?ID=<?= $_GET['ID'] - 1; ?>"
                   style="float: right;background-color: #db3069;border-radius: 5px;padding: 10px;color:inherit;<?= ($_GET['ID'] == $prev) ? 'display:none;' : ''; ?>">درس
                    قبلی</a>
                <a href="./learn.php?ID=<?= $_GET['ID'] + 1; ?>"
                   style="float: left;background-color: #138a36;border-radius: 5px;padding: 10px;color:inherit;<?= ($_GET['ID'] == $next) ? 'display:none;' : ''; ?>">درس
                    جدید</a>
                <div style="clear: both;"></div>
            </section>
        </section>

    </article>
</main>
<footer>
    <p>شماره تماس: 09300805515</p>
    <br>
    <p>لینک‌های تماس مستقیم</p>
    <div class="socialmedia">
        <a href="https://api.WhatsApp.com/send?phone=989300805515" target="_blank"><img
                    src="./img/whatsapp.png"></a>
        <a href="https://t.me/parswebdesigners" target="_blank"><img src="./img/telegram.png"></a>
        <a href="mailto:parswebdesigners@gmail.com" target="_blank"><img src="./img/gmail.png"></a>
        <a href="https://www.instagram.com/parswebdesigners/" target="_blank"><img src="./img/instagram.png"></a>
        <a href="https://www.linkedin.com/in/arya-yaminy" target="_blank"><img src="./img/linkedin.png"></a>
        <a href="https://www.youtube.com/channel/UCqETI6yPthdZq1aOGPH5ucQ" target="_blank"><img
                    src="./img/youtube.png"></a>
        <a href="https://github.com/ParsWebDesigners" target="_blank"><img src="./img/git.png"></a>
    </div>
    <br><br>
    <div class="location">
        <img src="./img/map.png">
        <p>گیلان، لنگرود، خیابان مهندس</p>
    </div>
    <p id="cr">&copy; کلیه حقوق این وبسایت برای ParsWebDesigners.ir محفوظ است، و هرگونه کپی برداری فقط با ذکر نام
        این مجموعه امکان پذیر است.</p>
</footer>

</body>
<script src="./js/learn.js"></script>
<script>
    var codevalues =<?=str_replace('/script', '\/script', $content['codebox'])?>;
    var codebox = document.getElementsByClassName('codebox');
    for (var i = 0; i < codebox.length; i++) {
        var value = codevalues[i].code;
        var mode = codevalues[i].mode;
        CodeMirror(codebox[i], {
            mode: mode,
            value: value,
            lineNumbers: true,
            theme: "material-palenight",
            tabSize: 4,
            readOnly: "nocursor",
            scrollbarStyle: "simple"
        });
    }
</script>

</html>