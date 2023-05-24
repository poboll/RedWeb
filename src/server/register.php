<?php

header('Content-Type: text/json;charset=utf-8');

include("conn.php");
include("functions.php");

$reg_name=$_POST["userName"];
$reg_pwd=$_POST["userPwd"];
$reg_sex=$_POST["userSex"];
// $reg_name="sherry";
// $reg_pwd="14124869";
// $reg_sex="女";

$code=0;
$data=$reg_name."抱歉，无法注册";
$msg=["注册失败","注册成功"];

$sql="insert into users (user_name,user_sex,user_pwd) values(?,?,?)";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_bind_param($stmt,"sss",$reg_name,$reg_sex,$reg_pwd);
mysqli_stmt_execute($stmt);
mysqli_stmt_close($stmt);
$sql="select user_id from users where user_name='$reg_name'";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt,$id);
while(mysqli_stmt_fetch($stmt)){
    if($id){
        $code=1;
        $data=$reg_name.",欢迎成为我们的一员"."请登录";
        break;
    }
}

getApiResult($code,$msg[$code],$data);

?>