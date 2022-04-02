<?php
if (!(isset($_GET['ID']))) {
    header("Location: ./courses.php");
}
require './dashboard/db.php';
$fetchCourse = $con->prepare("SELECT * FROM course WHERE id=?");
$fetchCourse->bindValue(1, $_GET['ID']);
$fetchCourse->execute();
$course = $fetchCourse->fetch(PDO::FETCH_ASSOC);
$fetchLessons = $con->prepare("SELECT * FROM lesson WHERE courseId=? AND lessonStatus=?");
$fetchLessons->bindValue(1, $_GET['ID']);
$fetchLessons->bindValue(2, 1);
$fetchLessons->execute();
$lessons = $fetchLessons->fetchAll(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="<?= $course['courseKeyword'] ?>">
    <meta name="description" content="<?= $course['courseDescription'] ?>">
    <title>آموزش رایگان و کامل <?= $course['courseName'] ?></title>

    <link rel="stylesheet" href="./css/all.min.css">
    <link rel="stylesheet" href="./css/fontawesome.min.css">
    <link rel="stylesheet" href="./css/course.css?v=122222">
    <link rel="icon" type="image/png" href="./pwdicon.png"/>
</head>

<body dir="rtl">
<p class="breadcrumb">
    <a href="./index.html">صفحه اصلی</a>
    <span style="font-weight: bold;">&gt;</span>
    <a href="courses.php">دوره‌های آموزشی</a>
    <span style="font-weight: bold;">&gt;</span>
    <a href="course.php?ID=<?= $_GET['ID'] ?>" style="font-weight: bold;" id="page"><?= $course['courseName'] ?></a>
</p>
<article>
    <section>
        <section id="courseinfo">
            <div>
                <img src="./img/upload/<?= $course['courseImg'] ?>"
                     alt="دوره رایگان و جامع<?= $course['courseName'] ?>">
            </div>
            <div>
                <h1>دوره <?= $course['courseName'] ?></h1>
                <p>پیشنیاز: <?= $course['prerequisites'] ?></p>
                <p><?php $countL = 0;
                    foreach ($lessons as $lesson) {
                        $countL++;
                    }
                    echo $countL; ?> درس</p>
                <p><?= $course['courseDescription'] ?></p>
            </div>
        </section>
        <?php
        $fetchSeason = $con->prepare("SELECT * FROM season WHERE seasonCourse=?");
        $fetchSeason->bindValue(1, $_GET['ID']);
        $fetchSeason->execute();
        $seasons = $fetchSeason->fetchAll(PDO::FETCH_ASSOC);
        ?>
        <section id="section">

            <?php $accordion=0; foreach ($seasons as $season) {
                $countstatus = 0;
                foreach ($lessons as $lessonstatus) {
                    if ($lessonstatus['seasonId'] == $season['id']) {
                        $countstatus++;
                    }
                }
                if ($countstatus > 0) {
                    ?>
                    <div>
                        <p style="user-select: none;" onclick="accordion(this,<?=$accordion++;?>)"><?= $season['seasonName'] ?>
                            <i style="display: none" class="fas fa-chevron-up"></i>
                            <i class="fas fa-chevron-down"></i>
                        </p>
                        <div>
                            <?php foreach ($lessons as $lesson) {
                                if ($lesson['seasonId'] == $season['id']) {
                                    ?>
                                    <a href="learn.php?ID=<?=$lesson['id']?>"><?= $lesson['lessontitle']?></a>
                                <?php }
                            } ?>
                        </div>
                    </div>
                    <?php
                }
            } ?>

        </section>

    </section>
</article>
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

<script src="./js/course.js"></script>
</body>

</html>