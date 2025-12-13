 <?php 
header("Access-Control-Allow-Origin: *");
header("Contence-Type: application/json; charset=utf-8"); 
include '../dp.php';
$data = json_decode(file_get_contents("php://input"));

if($_SERVER['REQUEST_METHOD'] !== 'DELETE'){
    echo json_encode(array("status" => "Error"));
    die();
}
try {
    $stmt = $dbh->prepare("DELETE FROM user WHERE id=?");
  
    $stmt->bindParam(1, $data->id);

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