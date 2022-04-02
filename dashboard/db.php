<?php
    $servername="localhost";
    $username="parswebd_arya";
    $password="([tYG)N1M@LC";

try {
    $con= new PDO("mysql:host=$servername;dbname=parswebd_pwd;charset=utf8",$username,$password);
    $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    echo "Connected failed: ".$e->getMessage();
}