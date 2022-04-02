-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 02, 2022 at 12:31 PM
-- Server version: 5.7.36
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parswebd_pwd`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(2) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'arya', '$2y$10$mmOX5xaQd.OepSWPalONWOz0YWaZhZnXJ4uF5jp5YzJ3bs6B3xkje');

-- --------------------------------------------------------

--
-- Table structure for table `code-mode`
--

CREATE TABLE `code-mode` (
  `id` int(4) NOT NULL,
  `modeName` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `modeSrc` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `modePre` varchar(255) COLLATE utf8mb4_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `code-mode`
--

INSERT INTO `code-mode` (`id`, `modeName`, `modeSrc`, `modePre`) VALUES
(1, 'shell', '.\\js\\codemirror\\mode\\shell\\shell.js', NULL),
(2, 'xml', '.\\js\\codemirror\\mode\\xml\\xml.js', NULL),
(3, 'css', '.\\js\\codemirror\\mode\\css\\css.js', NULL),
(4, 'javascript', '.\\js\\codemirror\\mode\\javascript\\javascript.js', NULL),
(5, 'htmlmixed', '.\\js\\codemirror\\mode\\htmlmixed\\htmlmixed.js', '[2,3,4]');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `courseName` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `courseImg` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `prerequisites` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `courseKeyword` text COLLATE utf8mb4_persian_ci NOT NULL,
  `courseDescription` text COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `courseName`, `courseImg`, `prerequisites`, `courseKeyword`, `courseDescription`) VALUES
(1, 'Git', 'Git.png', 'این دوره هیچ پیشنیازی ندارد!', 'آموزش گیت,آموزش Git ورژن کنترل', 'گیت یک ابزار کنترل ورژن هست. یعنی انجام دادن پروژه‌ها به صورت تیمی، داشتن تاریخچه تغییرات، انجام تغییرات بدون هیچ تغییری در پروژه و خیلی از موارد دیگر که به لطف این ابزار، در اختیار داریم امکان پذیر است.');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `lessontitle` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `courseId` int(11) NOT NULL,
  `seasonId` int(11) NOT NULL,
  `lessonStatus` int(11) NOT NULL DEFAULT '0',
  `lessonKeyword` varchar(255) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `lessonDescription` varchar(255) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `lessonContent` text COLLATE utf8mb4_persian_ci,
  `codebox` text COLLATE utf8mb4_persian_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `lessontitle`, `courseId`, `seasonId`, `lessonStatus`, `lessonKeyword`, `lessonDescription`, `lessonContent`, `codebox`) VALUES
(1, 'نصب گیت', 1, 1, 1, 'آموزش دانلود و نصب git ورژن کنترل,آموزش دستورات گیت کنترل ورژن', 'برای نصب گیت کافیه به سایت رسمی گیت بریم.بعد از دانلود گیت، فایل نصبی رو اجرا میکنیم، و گزینه‌ها رو به صورت پیشفرض باقی میذاریم و فقط next را میزنیم.', '<h2>آموزش نصب Git -version control system</h2><p>&nbsp;</p><p>برای نصب گیت کافیه به <a href=\"https://git-scm.com/downloads\"><strong>سایت رسمی گیت</strong></a> بریم.</p><p>بعد از اون با تصویر زیر رو به رو میشیم که داخل کادر زرد نسخه مناسب سیستم ما رو شناسایی میکنه و فقط کافیه روی دکمه دانلود کلیک کنیم. اگر هم &nbsp;برای سیستم عامل دیگه‌ایی میخوایم، از کادر سمت چپش میتونیم دانلود بکنیم.</p><figure class=\"image\"><img src=\"http://parswebdesigners.ir/ckfinder/userfiles/files/git-scm_com_downloads.png\" alt=\"روش دانلود و نصب گیت در ویندوز\"></figure><p>بعد از دانلود گیت، فایل نصبی رو اجرا میکنیم، و گزینه‌ها رو به صورت پیشفرض باقی میذاریم و فقط next را میزنیم.</p><p>بعد از اتمام نصب کافیه در منو استارت سرچ کنیم <code>git bash</code> &nbsp;که خط فرمان ارائه شده گیت هست یا <code>cmd</code> که خط فرمان &nbsp;خود ویندوز هست. با هر دو میتونیم کار کنیم ولی &nbsp;گیت بَش سیستم رنگ بندی بهتری نسبت به کامند لاین ویندوز داره.</p><p><mark class=\"marker-yellow\">در لینوکس از ترمینال خود لینوکس هم میتونی استفاده بکنی!</mark></p><p>خب حالا در خط فرمانی که انتخاب کردیم دستور پایین رو وارد میکنیم تا از نصب بودن گیت مطمئن بشیم، در واقع اولین دستور ما در این دوره هست:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$ git --version\",\"mode\":\"shell\"}}'),
(2, 'کانفیگ گیت', 1, 1, 1, 'کانفیگ لوکال گیت,کانفیگ گلوبال گیت,کانفیگ نام و ایمیل به صورت گلوبال یا لوکال در گیت', 'با گیت میشه به صورت تیمی روی پروژه کار کرد و اونجایی که بخواهیم بدونیم که هر فرد چه کار‌هایی انجام میده باید اسمش رو بدونیم و اگه نیاز بود ایمیلش رو هم داشته باشیم', '<h2>کانفیگ نام و ایمیل به صورت گلوبال یا لوکال در گیت</h2><p>&nbsp;</p><p>کانفیگ یعنی بیایم یه سری موارد رو شخصی سازی یا پیاده سازی و آماده کنیم.</p><p>با گیت میشه به صورت تیمی روی پروژه کار کرد و اونجایی که بخواهیم بدونیم که سهم هر فرد در انجام پروژه چقدر هست یا هر فرد چه کار‌هایی انجام میده باید اسمش رو بدونیم، و اگه هم مایل به ارتباط با اون بودیم میتونیم از ایمیل ثبت شده‌اش استفاده کنیم.</p><p>&nbsp;</p><h3>کانفیگ گلوبال گیت</h3><p>&nbsp;</p><p>گلوبال یعنی پیشفرض &nbsp;و جامع.</p><p>کافیه در ترمینال، در هر مسیری که هستی از دستور زیر برای نام مثلا طاها</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>و برای ایمیل &nbsp;parswebdesigners@gmail.com &nbsp;از دستور زیر</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>استفاده بکنی؛ بعداً هر وقت بخوای هرجا و توی هر مسیری از گیت استفاده بکنی، این مشخصات به صورت پیشفرض برای اون پروژه استفاده میشه.</p><p>&nbsp;</p><h3>کانفیگ لوکال گیت</h3><p>&nbsp;</p><p>خب توی لوکال همه چی شخصی میشه یا به نوعی نمیخوایم اون مشخصات پیشفرض باشه به جاش میایم یه سری مشخصات جدید مخصوص همون پروژه مطابق میل خودمون درست میکنیم.</p><p>&nbsp;</p><p>مثلا به ترتیب دو مثال بالا برای نام و ایمیل:</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div>\n<br>\n<div class=\"codebox\"></div></div><p>&nbsp;</p><p>&nbsp;</p><p><mark class=\"marker-yellow\">به عنوان آخرین کانفیگ از دستور زیر استفاده بکن تا در حین کار با تاریخچه کامیت‌ها که در درس بعدی یاد میگیری مشکلی برات پیش نیاد!</mark></p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$ git config --global user.name \\\"taha\\\"\",\"mode\":\"shell\"},\"1\":{\"code\":\"$ git config --global user.email \\\"parswebdesigners@gmail.com\\\"\",\"mode\":\"shell\"},\"2\":{\"code\":\"$ git config user.name \\\"example\\\"\",\"mode\":\"shell\"},\"3\":{\"code\":\"$ git config user.email \\\"test@gmail.com\\\"\",\"mode\":\"shell\"},\"4\":{\"code\":\"$ git config --global core.pager cat\",\"mode\":\"shell\"}}'),
(3, 'متدوال ترین کارها با گیت', 1, 2, 1, 'git status, git add, git commit -m, git log,گیت کامیت,تاریخچه کامیت‌ها,آموزش گیت', 'git status, git add, git commit -m, git log چهار دستور پرکاربرد در گیت برای دیدن وضعیت فایل‌ها در گیت، اضافه‌ کردن فایل، کامیت کردن و دیدن تاریخچه کامیت‌ها.', '<h2>status, add, commit, log</h2><p>توی این پست قراره چهار دستور بالا که توسط گیت اجرا میشن و به محض راه اندازی گیت در فولدر در اختیار هستند رو قراره یاد بگیریم.</p><p>&nbsp;</p><h3>git status چیست؟</h3><p>این دستور برای دیدن وضیعت فایل‌ها هست.</p><p>فایل‌ها و تغییرات انجام شده در آنها به سه دسته تقسیم میشوند.</p><p>&nbsp;</p><ol><li>پیش از صحنه</li><li>در صحنه</li><li>بعد از صحنه</li></ol><p>&nbsp;</p><p>صحنه همون stage هست.</p><p>به عنوان مثال در فولدر که حاوی فایل هست بعد از راه اندازی گیت در اون فولدر به محض وارد کردن دستور زیر:</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>تمام فایل‌ها به رنگ قرمز نمایش داده میشن که به معنی پشت stage هستند.</p><p>&nbsp;</p><h3>git add چیست؟</h3><p>حالا برای اینکه این فایل ها برن به stage از این دستور استفاده میکنیم. که بعد از این اگر دستور <code>git status</code></p><p>رو وارد بکنیم تمام فایل‌ها به رنگ سبز نمایش داده میشوند.</p><p>استفاده از دستور git add چندین نوع دارد که هر کدوم رو توضیح میدم.</p><p>&nbsp;</p><p><i><u>اگر بخواهیم تمام فایل‌ها اضافه بشن!</u></i></p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p><i><u>اگر بخواهیم فایل مد نظری رو اضافه بکنیم!</u></i></p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p><i><u>اگر بخواهیم فولدری رو اضافه بکنیم!</u></i></p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>میرسیم به آخرین مورد که دوست دارم بیشتر توضیحش بدم تا بیشتر جا بیفته!</p><p>ببین فکر کن سه فایل با این نام‌ها داری:</p><p>&nbsp;</p><pre><code class=\"language-plaintext\">tstaval.txt\r\ntstdovom.txt\r\nsevom.txt</code></pre><p>&nbsp;</p><p>حالا ما میخواهیم فقط دو فایل اول که اولشون tst و آخرشون هم txt. هست رو add بکنیم.چطور میتونیم؟</p><p>&nbsp;</p><p>خب ببین بزار از لول پایین توضیح بدم من میخوام همه فایل‌ها با تیکه کلمه txt. رو add بکنم &nbsp;الان چیکار کنم؟</p><p>باید بیام بنویسم&nbsp;</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>پس علامت * معنی هرچی رو میده!</p><p>&nbsp;</p><p>حالا در جواب سوال اول که میخواهیم دو فایل که اولشون tst هست و آخرشون در txt. &nbsp;مشترک هستند رو add بکنیم باید بیایم این دستور رو بنویسیم</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>در آخر هم اگر <code>git status</code> بزنیم فایل‌های اضافه شده سبز هستند.</p><p>&nbsp;</p><h3>git commit چیست؟</h3><p>حالا ما فایل‌ها رو به stage بردیم؛ حالا باید چیکار بکنیم؟</p><p>باید ثبتشون کنیم تا به یه تاریخچه تبدیل بشن و بعدا هر وقت نیاز بود که به محتویات فایلی که در فلان تاریخ موجود بود و &nbsp;هنوز هیچ تغییری نکرده دست پیدا بکنیم!(در پست‌های پایانی این مورد رو یاد میگیریم، بهش میگیم گذر در زمان)</p><p>&nbsp;</p><p>برای ثبت باید یه پیامی هم بنویسیم تا بعدا که با تاریخچه‌ایی از کامیت‌ها یا ثبت تغییرها روبه‌رو شدیم بتونیم تشخیص بدیم هر کامیت برای چه بوده است!</p><p><mark class=\"marker-yellow\">حتما پیامهای کوتاه و معنی دار بنویس!</mark></p><p>نمونه‌ایی از کامیت:</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>که مسیج ما مشخص میکنه این کامیت، اولین کامیت بعد از راه اندازی گیت در این پروژه هست.</p><p>&nbsp;</p><h3>git log چیست؟</h3><p>گفتم که تاریخچه!</p><p>اگه میخوای به تاریخچه‌ کامیت‌ها و کارهایی که کردی نگاه بندازی باید دستور:</p><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><p>رو وارد بکنی. به همین راحتی!</p>', '{\"0\":{\"code\":\"$ git status\",\"mode\":\"shell\"},\"1\":{\"code\":\"$ git add .\",\"mode\":\"shell\"},\"2\":{\"code\":\"$ git add index.html\",\"mode\":\"shell\"},\"3\":{\"code\":\"$ git add css/\",\"mode\":\"shell\"},\"4\":{\"code\":\"$ git add *.txt\",\"mode\":\"shell\"},\"5\":{\"code\":\"$ git add tst*.txt\",\"mode\":\"shell\"},\"6\":{\"code\":\"$ git commit -m \\\"init commit\\\"\",\"mode\":\"shell\"},\"7\":{\"code\":\"$ git log\",\"mode\":\"shell\"}}'),
(4, 'نسخه نویسی', 1, 2, 1, 'git tag,آموزش ورژن نویسی در گیت', 'ورژن نویسی یا نسخه نویسی در گیت، در این قسمت میخواهیم با استفاده از اصول سمانتیک ورژنینگ در گیت نسخه نویسی بکنیم!', '<h2>ورژن نویسی یا نسخه نویسی در گیت</h2><p>در این قسمت میخواهیم با استفاده از اصول سمانتیک ورژنینگ در گیت نسخه نویسی بکنیم!</p><p>&nbsp;</p><p>برای شروع میخواهیم لیست ورژن‌های نوشته شده رو ببینیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>معلومه که چون تا حالا هیچ نسخه‌ایی ننوشتیم چیزی برای ما برنمیگردونه!</p><p>حالا برای اینکه یه نسخه بنویسیم کافیه &nbsp;در ادامه همین دستور ورژن خودمون رو بنویسیم (بهتره که اصول سمانتیک ورژنینگ رعایت بشه).</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$ git tag\",\"mode\":\"shell\"},\"1\":{\"code\":\"$ git tag 1.0.0-beta\",\"mode\":\"shell\"}}'),
(5, 'ساخت شاخه فرعی', 1, 3, 1, 'برنچینگ در گیت,branch در گیت,شاخه شاخه کردن در گیت', 'اگه بخواهیم اصل پروژه حفظ بشه و از طرفی در یک جا اون پروژه رو توسعه بدیم نیاز به درست کردن شاخه فرعی داریم. در ادامه روند کار با شاخه‌های فرعی رو یاد میگیریم.', '<h2>توسعه نرم افزار با شاخه شاخه کردن پروژه</h2><p>اگه بخواهیم اصل پروژه حفظ بشه و از طرفی در یک جا اون پروژه رو توسعه بدیم نیاز به درست کردن شاخه فرعی داریم. در ادامه روند کار با شاخه‌های فرعی رو یاد میگیریم.</p><p>در ابتدا برای دیدن شاخه‌ها (branch) از دستور زیر استفاده میکنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>پس از وارد کردن دستور یک شاخه به نام master (شاخه اصلی) &nbsp;وجود داره که در حال حاضر ما در داخل اون هستیم.</p><p>حالا برای درست کردن برنچ مثلا test:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>رو وارد میکنیم و &nbsp;اگه دستور <code>git branch</code> رو بزنیم برنچ ما در کنار برنچ اصلی قرار داره.</p><p>&nbsp;</p><p>همونطور که گفتم الان در برنچ اصلی هستیم و اگه بخواهیم بریم به برنچی که ساختیم و در اونجا فعالیت بکنیم نیازه که دستور:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p><mark class=\"marker-yellow\">نکته مهم اینجاست که برای برگشت به برنچ اصلی یا رفتن به هر برنچ دیگه‌ایی کافیه همین دستور و اسم اون برنچ رو وارد بکنیم.</mark></p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p><mark class=\"marker-yellow\">همیشه قبل از جابه‌جا شدن بین برنچ‌ها آخرین تغییرات رو کامیت کن، چون اون تغییرات با تو به هر برنچ دیگه‌ایی میان!</mark></p>', '{\"0\":{\"code\":\"$git branch\",\"mode\":\"shell\"},\"1\":{\"code\":\"$git branch test\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git checkout test\",\"mode\":\"shell\"},\"3\":{\"code\":\"$git checkout master\",\"mode\":\"shell\"}}'),
(6, 'ادغام شاخه فرعی', 1, 3, 1, 'git merge,ادغام دو برنچ در گیت', 'برای استفاده از این دستور  به  شاخه‌ایی که میخواهیم برنچ مثلا test رو با اون ادغام کنیم، میریم  و فرایند ادغام رو انجام میدیم.', '<h2>git merge</h2><p>دستور ادغام دو شاخه!</p><p>برای استفاده از این دستور &nbsp;به &nbsp;شاخه‌ایی که میخواهیم برنچ مثلا test رو با اون ادغام کنیم، میریم &nbsp;و فرایند ادغام رو انجام میدیم.</p><p>برای مثال میخواهیم &nbsp;به شاخه اصلی master برگردیم و شاخه test رو با این شاخه ادغام کنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>اگر <code>git log</code> بزنیم آخرین کامیت‌های برنچ test به آخرین کامیت‌های برنچ master &nbsp;اضافه شده است.</p><p>&nbsp;</p><p>در آخر برای پاک کردن برنچ فرعی میتونیم از دستور پایین استفاده بکنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>برای دیدن نتیجه اگه <code>git branch</code> رو بزنیم میبینیم که هیچ اثری از برنچ test نیست!&nbsp;</p>', '{\"0\":{\"code\":\"$git checkout master\",\"mode\":\"shell\"},\"1\":{\"code\":\"$git merge test\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git branch -d test\",\"mode\":\"shell\"}}'),
(7, 'ارسال و دریافت سورس کد', 1, 3, 0, '', '', '<p>ططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططططط</p>', '{}'),
(8, 'ریپوزیتوری آنلاین', 1, 4, 1, 'ساخت اکانت گیت‌هاب,ارسال کد به گیت‌هاب,ساخت ریپوزیتوری,تغییر نام برنچ در گیت', 'یک منبع عالی برای قرار دادن پروژه‌ها، استفاده از پروژه‌های دیگران، مشارکت در اون‌ها و ذخیره سازی پروژه‌های خودمون و خیلی موارد دیگه. ', '<h2>GitHub چیست؟</h2><p>یک منبع عالی برای قرار دادن پروژه‌ها، استفاده از پروژه‌های دیگران، مشارکت در اون‌ها و ذخیره سازی پروژه‌های خودمون و خیلی موارد دیگه. مشابه گیت‌هاب، GitLab هست که در یه سری موارد با گیت‌هاب فرق میکنه مثلا جامعیت گیت‌هاب بیشتره!</p><p>ولی در کل ما از گیت‌هاب برای آموزش استفاده میکنیم چون اگه بتونیم با گیت‌هاب کار کنیم قطعا میتونیم با گیت‌لب هم کار کنیم و از طرفی مهم‌تر اینه که واقعا اکثر سورس‌کدهای اپن سورس در گیت‌هاب هستند.</p><p>&nbsp;</p><h3>ساخت ریپوزیتوری گیت‌هاب</h3><p>برای درست کردن ریپوزیتوری گیت‌هاب نیاز به اکانت گیت‌هاب هست (رایگانه!)</p><p>بعد از درست کردن و لاگین کردن اقدام به ساخت یک ریپوزیتوری جدید میکنیم. اسم ریپوزیتوری رو بهتره اسم پروژه بزاریم (اسم فولدر پروژه!) و در ادامه یه جزئیات ریزی براش مینویسیم.</p><p>&nbsp;</p><p>به عنوان آخرین موضوع این پست باید بدونیم که گیت‌هاب برنچ اصلیش به نام main هست در حالی که برنچ اصلی گیت master هست. حالا اگه بدون تغییرات که در ادامه میگیم در پست‌های بعدی برنچ مستر رو به گیت‌هاب ارسال کنیم، برای دیدن برنچ مستر باید از برنچ main به برنچ master برویم. خب برای اینکه این مرحله رو &nbsp;حذف کنیم کافیه برنچ master رو در گیت به برنچ main تغییر نام بدیم</p><p>&nbsp;</p><p>طبق این دستور:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$git branch -M main\",\"mode\":\"shell\"}}'),
(9, 'ریموت در گیت', 1, 4, 1, 'ریموت گیت,ساخت ریموت در گیت', 'به زبان ساده لینک‌های ریپوزیتوری آنلاین هستند که به عنوان ریموت در گیت ذخیره و از طریق اونها کدها ارسال و یا دریافت میشوند.', '<h2>ریموت در گیت چیست؟</h2><p>به زبان ساده لینک‌های ریپوزیتوری آنلاین هستند که به عنوان ریموت در گیت ذخیره و از طریق اونها کدها ارسال و یا دریافت میشوند.</p><h3>&nbsp;</h3><h3>نحوه ساخت ریموت در گیت</h3><p>مثل برنچ میتونیم برای دیدن کل ریموت‌ها از دستور:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>استفاده بکنیم که در ابتدای کار هیچ ریموتی ثبت نیست!</p><p>حالا برای ساخت اولین ریموت باید لینک مخزن آنلاین مد نظرمون رو داشته باشیم.</p><p><mark class=\"marker-yellow\">بعد از ساخت ریپوزیتوری در گیت‌هاب لینک ریپوزیتوری در صفحه همان ریپوزیتوری در اختیار ما قرار داده میشود.</mark></p><p>در این جا لینک مد نظر ما مثلا URL هست و اسمی که برای اون در نظر میگیریم origin هست</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>برای حذف ریموت هم از دستور زیر استفاده میکنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$git remote\",\"mode\":\"shell\"},\"1\":{\"code\":\"$git remote add origin URL\",\"mode\":\"shell\"},\"2\":{\"code\":\"//delete origin remote\\n$git remote remove origin\",\"mode\":\"shell\"}}'),
(10, 'ارسال و دریافت کد', 1, 4, 1, 'ارسال تگها به صورت دستی در گیت,استفاده از upstream,pull در گیت,push در گیت', 'ارسال تگها به صورت دستی در گیت و استفاده از upstream یا u- و pull در گیت و push در گیت', '<h2>push در گیت</h2><p>در پست قبلی یک ریموت ساختیم حالا وقت استفاده از این ریموت هست.</p><p>برای ارسال پروژه &nbsp;به دو تا چیز نیاز داریم.</p><p>مورد اول ریموت هست که ساختیم.</p><p>مورد دوم برنچی هست که میخواهیم ارسال بشه. چون میخواهیم استاندارد کار کنیم در دستور پایین برنچی که ارسال میشه برنچ main یا همون برنچ اصلی ماست.</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><h2>pull در گیت</h2><p>حالا برعکس، اگه به صورت تیمی کار کنیم &nbsp;مجبوریم همیشه آخرین نسخه تغییر پروژه رو داشته باشیم. یعنی جز من کس دیگه‌ایی هم هست که کاری که روی &nbsp;پروژه انجام میده رو به مخزن پوش کنه (بفرسته!)، و در اینجا اگر بخواهیم پروژه رو نگاه کنیم یا کار کنیم نیازه که از مخزن آنلاین آپدیتش کنیم به این صورت:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><h3>&nbsp;</h3><h3>استفاده از upstream&nbsp;</h3><p>اگر میخواهیم به صورت پیش فرض مثلا در مثال‌های بالا همیشه برنچ main به ریموت origin ارسال و دریافت بشه میتونیم از <code>u-</code> استفاده بکنیم. به طوریکه اولین باری که از &nbsp;پوش یا پول استفاده میکنیم وقتی اسم برنچ و ریموت مد نظر رو با برچسب u- &nbsp;به عنوان دستور وارد میکنیم &nbsp;این ریموت و برنچ به صورت پیش فرض ذخیره شده &nbsp;و بعدا برای استفاده از پوش یا پول نه به ریموت نیاز هست نه به برنچ، مگه اینکه بخواهیم به صورت دستی یه برنچ خاص رو ارسال کنیم.</p><p>به عنوان مثال اولین دستور رو پوش &nbsp;و در اون ریموت origin و برنچ main مد نظر ماست. به این ترتیب برای در نظر گرفتن این مسیر به صورت پیش‌فرض از دستور زیر استفاده میکنیم و البته پروژه ما نیز به همراه این تنظیمات به مخزن پوش میشود.</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>از این پس اگه بخواهیم از پوش پول برای ریموت origin و برنچ &nbsp;main استفاده کنیم میتونیم فقط از این دستور استفاده کنیم.</p><div class=\"raw-html-embed\"> <div class=\"codebox\"></div></div><p>&nbsp;البته میشه &nbsp;از دستور &nbsp;پایین استفاده کرد:</p><div class=\"raw-html-embed\"> <div class=\"codebox\"></div></div><p>و یا upstream رو تغییر داد:</p><div class=\"raw-html-embed\"> <div class=\"codebox\"></div></div><p>&nbsp;</p><h2>ارسال تگها به صورت دستی در گیت</h2><p>تگ‌ها به صورت خودکار با دستور پوش به مخزن ارسال نمیشوند. برای ارسال باید به صورت دستی دستور:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>وارد کنیم.</p>', '{\"0\":{\"code\":\"$git push origin main\",\"mode\":\"shell\"},\"1\":{\"code\":\"$git pull origin main\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git push -u origin main\",\"mode\":\"shell\"},\"3\":{\"code\":\"#PUSH\\n$git push\\n#PULL\\n$git pull\",\"mode\":\"shell\"},\"4\":{\"code\":\"#PUSH\\n$git push origin main\\n#PULL\\n$git pull origin main\",\"mode\":\"shell\"},\"5\":{\"code\":\"$git push -u remoteName branchName\",\"mode\":\"shell\"},\"6\":{\"code\":\"$git push --tags\",\"mode\":\"shell\"}}'),
(11, 'دیدن تفاوت', 1, 5, 1, 'git diff,دیدن تغییرات در گیت', 'در گیت میتوان تفاوت دو برنچ، لاگ، فایل‌های استیج شده، فایل‌های تغییر داده شده، و یا یک فایل خاص و یک برنچ با یک ریموت رو دید.', '<h2>git diff</h2><p>در گیت میتوان تفاوت دو برنچ، لاگ، فایل‌های استیج شده، فایل‌های تغییر داده شده، و یا یک فایل خاص رو دید. همچنین میتوان تفاوت یک برنچ با یک ریموت رو هم مشاهده کرد ولی این بحث رو برای پست بعدی میذاریم!</p><p>&nbsp;</p><h3>تفاوت دو لاگ!</h3><p>برای دیدن تفاوت دو لاگ کافیه <code>git log</code> &nbsp;رو بزنیم و دو لاگ رو انتخاب کنیم!</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>برای مثال لاگ اول:</p><p>یه مقدار از ابتدای این هش رو برمیداریم لازم به کپی کردن همش نیست!</p><p><code>a57b73e9e04</code></p><p>و در دستور زیر قرار میدیم(این دستور هنوز تکمیل نشده!)</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p><mark class=\"marker-yellow\">بین دو تا لاگ دو تا نقطه باید قرار بدیم!</mark></p><p>و برای لاگ دوم به همین صورت عمل میکنیم:</p><p>که یه مقدارش رو از ابتدا کپی میکنیم</p><p><code>3a824d5aac6</code></p><p>و برای تکمیل دستور بالا در دستور پایین قرار میدیم (ادامه‌ی دستور بالا):</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p><mark class=\"marker-yellow\">ترتیب قرار دادن لاگ اول و دوم &nbsp;فقط در قرمز و سبز کردن موارد افزوده شده و حذف شده تاثیر داره!</mark></p><p>&nbsp;</p><h3>آخرین تغییرات از آخرین کامیت!</h3><p>یعنی بدون اینکه تغیرات جدید رو کامیت کنیم بتونیم تغییرات اونها رو ببینیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><h3>تغییرات فایل‌هایی که در استیج هستند!</h3><p>فایل‌هایی که با دستور git add &nbsp;استیج شده‌اند رو میتوان با دستور زیر تغییرات آنها رو مشاهده کرد:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>&nbsp;</p><h3>دیدن تغییرات فایل یا فایل‌های خاص!</h3><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"commit 3a824d5aac69b42da9a4afef730c57326aef736f\\nAuthor: Anonymous <ParsWebDesigners@gmail.com>\\nDate:   Wed Feb 9 11:04:51 2022 +0330\\n\\n    second commit\\n\\ncommit a57b73e9e04f017b3e637b1b19d6da1440197b27\\nAuthor: Anonymous <ParsWebDesigners@gmail.com>\\nDate:   Tue Feb 8 07:24:14 2022 +0330\\n\\n    first commit\",\"mode\":\"shell\"},\"1\":{\"code\":\"$git diff a57b73e9e04..\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git diff a57b73e9e04..3a824d5aac6\",\"mode\":\"shell\"},\"3\":{\"code\":\"$git diff head\",\"mode\":\"shell\"},\"4\":{\"code\":\"$git diff --staged\",\"mode\":\"shell\"},\"5\":{\"code\":\"//SEE INDEX.HTML CHANGES\\n$git diff index.html\\n\\n//SEE JS FILE CHANGES\\n$git diff *.js\",\"mode\":\"shell\"},\"6\":{\"code\":\"\",\"mode\":\"shell\"}}'),
(12, 'فتچ کردن اطلاعات', 1, 5, 1, 'Fetch کردن اطلاعات در گیت,تفاوت fetch با pull', 'وقتی پول میکنیم، گیت اهمیتی نمیده که آیا کامیت جدیدی وجود داره یا نه و فقط همه چیز رو به روزرسانی میکنه ولی فتچ آخرین تغییرات رو به ما میگه', '<h2>Fetch کردن اطلاعات در گیت!</h2><p>فتچ کردن مثل پول هست ولی با یک تفاوت مهم!</p><p>وقتی پول میکنیم، گیت اهمیتی نمیده که آیا کامیت جدیدی وجود داره یا نه و فقط همه چیز رو به روزرسانی میکنه.</p><p>در صورتی که فتچ میاد میگه چندتا کامیت شده، در این کامیت‌ها چه تغییراتی هست، و اگر مایل بودیم این تغییرات رو به پروژه اضافه کنیم.</p><p>در ادامه این سه روند رو با هم یاد میگیریم.</p><p>&nbsp;</p><p>خب به عنوان مثال ما اصلا نمیدونم که در ریپوزیتوری کسی کامیت کرده یا نه برای همین میایم از دستور زیر استفاده میکنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p><mark class=\"marker-yellow\">اگر قبلا از upstream استفاده کردیم برای ریموت origin &nbsp;میتونیم از دستور اول استفاده کنیم، در غیر اینصورت باید به صورت دستی از نام ریموت استفاده کنیم.</mark></p><p>بعد از دستور بالا با زدن <code>git status</code> این پیام رو میبینیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>این پیام میگه که در یک برنچ فرضی (remote/origin) یک کامیت وجود دارد. برای دریافت اطلاعات از دستور پول استفاده کن!</p><p>خب نکته اینجاست!</p><p>مگه نمیگه که برنچ؟</p><p>پس ما میتونیم تغییرات رو ببینیم</p><p>این برنچ فرضی اسمش fetch_head هست. با دانستن این مورد کار مثل کار با برنچ‌هاست.</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>خب تغییرات رو دیدیم، در صورت تمایل میتونیم در برنچی که هستیم ادغام کنیم مثل دستور زیر:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"//use upstream\\n$git fetch\\n\\n//manual\\n$git fetch remoteName\",\"mode\":\"shell\"},\"1\":{\"code\":\"On branch main\\nYour branch is behind \'origin/main\' by 1 commit, and can be fast-forwarded.\\n  (use \\\"git pull\\\" to update your local branch)\\n\\nnothing to commit, working tree clean\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git diff fetch_head\",\"mode\":\"shell\"},\"3\":{\"code\":\"$git merge fetch_head\",\"mode\":\"shell\"}}'),
(13, 'کار با لاگ', 1, 5, 1, 'رفتن به کامیت در گیت,فیلتر کردن git log', 'آموزش کار با لاگ و سفارشی و فیلتر کردن لیست لاگ‌ها و رفتن به کامیت‌های قبلی', '<h2>git log سفارشی!</h2><p>در این دستور آپشن‌های زیادی برای سفارشی یا فیلتر کردن لیست لاگ‌ها هست ولی پرکاربردترینشون اینه که وقتی با تعداد زیادی از لاگ‌ها مواجه میشیم و مجبوریم خیلی اسکرول کنیم تا به بالا برویم و آخرین کامیت‌ها رو ببینیم.</p><p>برای رفع این مورد کافیه &nbsp;یه خط تیره (-) به همراه تعداد کامیت &nbsp;از آخر &nbsp;رو به آخر دستور وارد کنیم.</p><p>مثلا میخواهیم فقط ۵ تا لاگ آخر رو ببینیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><h2>&nbsp;</h2><h2>سفر در زمان!</h2><p>فکرش رو بکن، در یک موقعیتی هستی که دوست داری در فلان تاریخ که کامیت زدی ببینی که پروژه به چه شکل بوده.</p><p>تنها چیزی که لازم داری هش اون کامیت هست مثلا میخواهیم به این کامیت برویم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>حالا برای رفتن به این کامیت این دستور رو وارد میکنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div><p>حالا میتونیم پروژه در این لاین زمانی &nbsp;رو ببینیم و برای برگشت هم کافیه اسم برنچ اصلی رو به جای هش کامیت وارد کنیم:</p><div class=\"raw-html-embed\"><div class=\"codebox\"></div></div>', '{\"0\":{\"code\":\"$git log -5\",\"mode\":\"shell\"},\"1\":{\"code\":\"commit f5922545e48f8f3bdd48867accdb41ecc3611514\\nAuthor: Anonymous <ParsWebDesigners@gmail.com>\\nDate:   Tue Feb 8 07:01:47 2022 +0330\\n\\n    init commit & plain design\",\"mode\":\"shell\"},\"2\":{\"code\":\"$git checkout f5922545e4\",\"mode\":\"shell\"},\"3\":{\"code\":\"//main branch\\n$git checkout main\",\"mode\":\"shell\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `id` int(11) NOT NULL,
  `seasonName` varchar(255) COLLATE utf8mb4_persian_ci NOT NULL,
  `seasonCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`id`, `seasonName`, `seasonCourse`) VALUES
(1, 'نصب گیت', 1),
(2, 'ثبت تغییرات در گیت', 1),
(3, 'توسعه برنامه با گیت', 1),
(4, 'تبادل کد با فضای ابری', 1),
(5, 'نکات و ترفند‌های گیت', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code-mode`
--
ALTER TABLE `code-mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `code-mode`
--
ALTER TABLE `code-mode`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `season`
--
ALTER TABLE `season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
