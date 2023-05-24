<?php
    //输出页头
    header('Content-Type: text/json;charset=utf-8');
    //连接数据库
    include("conn.php");
    include("functions.php");

    //初始参数设置
    $code=0;
    $data="";
    $msg=["积分更新失败","积分更新成功"];

    //测试数据
    // $userName="kiyoshi";
    // $userScore=0;
    //获取客户端数据
    $userName=$_POST["userName"];
    $userScore=$_POST["userScore"];

    $sql="update users set user_score=user_score+1 where user_name='$userName'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    $sql="select user_score from users where user_name='$userName'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$score);
    while(mysqli_stmt_fetch($stmt)){
        if($score>$userScore){
            $code=1;
            $data="当前积分".$score;
            break;
        }
    }

    getApiResult($code,$msg[$code],$data);

?>