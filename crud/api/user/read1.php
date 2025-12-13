<?php 
header("Access-Control-Allow-Origin: *");
header("Contence-Type: application/json; charset=utf-8"); 
include '../dp.php';
try {
   $stmt = $dbh->prepare("SELECT * FROM user where id = ?");
    $stmt->execute([$_GET['id']]);
    foreach ($stmt as $row) {
    $user = array(
        'id' => $row['id'],
            'fname' => $row['fname'],
            'lname' => $row['lname'],
            'email' => $row['email'],
            'avatar' => $row['avatar'],
    );
    echo json_encode($user);
    break; 
}
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
$dbh = null;
?>