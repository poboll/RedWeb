<?php
session_start();
header('Content-Type: text/json;charset=utf-8');

include("conn.php");
include("functions.php");

$code=0;
$data="用户不存在，请先注册";
$msg=["登陆失败","登陆成功"];

//$userName="kiyoshi";
$userName=$_POST["userName"];
//$userPwd="123456";
$userPwd= $_POST["userPwd"];

$sql="select user_pwd from users where user_name=?";
$stmt=mysqli_prepare($conn,$sql);
mysqli_stmt_bind_param($stmt,"s",$userName);
mysqli_stmt_execute($stmt);
mysqli_stmt_bind_result($stmt,$pwd);
while(mysqli_stmt_fetch($stmt)){
    if($userPwd==$pwd){
        $_SESSION["username"]=$userName;
        $_SESSION["logFlag"]=1;
        $code=1;
        $data="欢迎,".$userName;
        break;
    }
    else if($pwd!=$userPwd){
        $data="对不起，您的信息有误，请再次确认";
        break;
    }
};

getApiResult($code,$msg[$code],$data);

?>