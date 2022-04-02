<?php
session_start();
require './db.php';
if(isset($_POST['log'])){
    $username=$_POST['username'];
    $password=$_POST['password'];

    $search=$con->prepare("SELECT * FROM admin WHERE name=?");
    $search->bindValue(1,$username);
    $search->execute();
    if($search->rowCount()>=1){
        $pass=$search->fetch(PDO::FETCH_ASSOC);
        if(password_verify($password,$pass['password'])){
            header("Location: ./index.php");
            $_SESSION['login']=true;
        }else{header("Location: ./login.php");}
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
        <link rel="stylesheet" href="../css/login.css">
    </head>
    <body id="particles-js">
        <form method="post">
            <input type="text" name="username" id="" placeholder="username">
            <br><br>
            <input type="password" name="password" id="" placeholder="password">
            <br><br>
            <button type="submit" name="log">Login</button>
            <span style="clear: both;"></span>
        </form>
    </body>
    <script src="../js/particles.js-master/particles.js"></script>
    <script src="../js/particles.js-master/demo/js/app.js"></script>
</html>