 <?php 
header("Access-Control-Allow-Origin: *");
header("Contence-Type: application/json; charset=utf-8"); 
header("Access-Control-Allow-Methods: POST, OPTIONS");
include '../dp.php';
$data = json_decode(file_get_contents("php://input"));

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    echo json_encode(array("status" => "Error"));
    die();
}
try {
    $stmt = $dbh->prepare("INSERT INTO user (fname, lname, email, avatar) VALUES (?, ?, ?, ?)");
    $stmt->bindParam(1, $data->fname);
    $stmt->bindParam(2, $data->lname);
    $stmt->bindParam(3, $data->email);
    $stmt->bindParam(4, $data->avatar);

    if($stmt->execute()){
        echo json_encode(array("status" => "ok"));
    }else{
        echo json_encode(array("status" => "Error"));
    }


} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
$dbh = null;
?>