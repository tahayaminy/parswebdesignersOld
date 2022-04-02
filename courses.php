<?php
require './dashboard/db.php';
$fetchCourse=$con->prepare("SELECT * FROM course");
$fetchCourse->execute();
$courses=$fetchCourse->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php
            foreach($courses as $course){
                    $keywords="";
                    $description="";
                    $keywords .='آموزش '.$course['courseName'].',';
                    $description .='دوره رایگان و کامل '.$course['courseName'].'|';
                ?>
                <meta name="keywords" content="<?=$keywords?>">
                <meta name="description" content="<?=$description?>">
            <?php }
        ?>
        <title>دوره‌های رایگان و جامع طراحی و برنامه نویسی وب</title>


        <link rel="stylesheet" href="./css/courses.css?v=111">
        <link rel="icon" type="image/png" href="./pwdicon.png"/>
    </head>
    <body dir="rtl">
        <p class="breadcrumb">
            <a href="./index.html">صفحه اصلی</a>
            <span style="font-weight: bold;">&gt;</span>
            <a href="courses.php" id="page">دوره‌های آموزشی</a>
        </p>
        <article>
            <?php
                foreach ($courses as $course){?>
                    <a href="course.php?ID=<?=$course['id']?>" class="course">
                        <div>
                            <img src="./img/upload/<?=$course['courseImg']?>" alt="دوره رایگان و جامع<?=$course['courseName']?>">
                        </div>
                        <h1><?=$course['courseName']?></h1>
                    </a>

            <?php } ?>
        </article>
        <footer>
            <p>شماره تماس: 09300805515</p>
            <br>
            <p>لینک‌های تماس مستقیم</p>
            <div class="socialmedia">
                <a href="https://api.WhatsApp.com/send?phone=989300805515" target="_blank"><img src="./img/whatsapp.png"></a>
                <a href="https://t.me/parswebdesigners" target="_blank"><img src="./img/telegram.png"></a>
                <a href="mailto:parswebdesigners@gmail.com" target="_blank"><img src="./img/gmail.png"></a>
                <a href="https://www.instagram.com/parswebdesigners/" target="_blank"><img src="./img/instagram.png"></a>
                <a href="https://www.linkedin.com/in/arya-yaminy" target="_blank"><img src="./img/linkedin.png"></a>
                <a href="https://www.youtube.com/channel/UCqETI6yPthdZq1aOGPH5ucQ" target="_blank"><img src="./img/youtube.png"></a>
                <a href="https://github.com/ParsWebDesigners" target="_blank"><img src="./img/git.png"></a>
            </div>
            <br><br>
            <div class="location">
                <img src="./img/map.png">
                <p>گیلان، لنگرود، خیابان مهندس</p>
            </div>
            <p id="cr">&copy; کلیه حقوق این وبسایت برای ParsWebDesigners.ir محفوظ است، و هرگونه کپی برداری فقط با ذکر نام این مجموعه امکان پذیر است.</p>
        </footer>
    </body>
</html>