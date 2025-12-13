<?php
$user = 'root';
$pass = '';
$dbh = null;
try{
    
    $dbh = new PDO('mysql:host=localhost;dbname=mydb', $user, $pass);
}catch(PDOException $e){
    die();
}
 
?>