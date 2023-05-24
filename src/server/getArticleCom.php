<?php
 //输出页头
 header('Content-Type: text/json;charset=utf-8');
 //连接数据库
 include("conn.php");
 include("functions.php");

$code=0;
$data=[];
$msg=["获取失败","获取成功"];

$passageId=$_POST["pas_id"];
// $passageId=1;
$sql="select message_content,message_thumbs,user_name from messages,users where users.user_id=messages.user_id and passage_id='$passageId'";
// $sqlName="select users.user_name from users,messages where users.user_id=messages.user_id and passage_id='$passageId'";
$stmt=mysqli_prepare($conn,$sql);
// $stmtName=mysqli_prepare($conn,$sqlName);
mysqli_stmt_execute($stmt);
// mysqli_stmt_execute($stmtName);
mysqli_stmt_bind_result($stmt,$comment,$thumbs,$name);
// mysqli_stmt_bind_result($stmtName,$name);
$index=0;
while(mysqli_stmt_fetch($stmt)){
    $data[$index]["content"]=$comment;
    $data[$index]["thumbs"]=$thumbs;
    $data[$index]["user"]=$name;
    $index++;
}
$code=$index>0;
getApiResult($code,$msg[$code],$data);

?>