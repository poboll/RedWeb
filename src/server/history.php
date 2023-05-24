<?php
 //输出页头
 header('Content-Type: text/json;charset=utf-8');
 //连接数据库
 include("conn.php");
 include("functions.php");

$code=0;
$data=[];
$msg=["获取失败","获取成功"];

$sql="select timeYear,textName,text from history";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt,$timeYear,$textName,$text);
$index=0;
while(mysqli_stmt_fetch($stmt)){
    $data[$index]["year"]=$timeYear;
    $data[$index]["name"]=$textName;
    $data[$index]["text"]=$text;
    $index++;
}

$code=$index>0;
getApiResult($code,$msg[$code],$data);

?>