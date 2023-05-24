<?php

    //输出页头
    header('Content-Type: text/json;charset=utf-8');
    //连接数据库
    include("conn.php");
    include("functions.php");
    //初始参数设置
    $code=0;
    $data=[];
    $msg=["个人信息获取失败","个人信息获取成功"];
    //测试数据
    $name='kiyoshi';

    $sql="select user_id,user_sex,user_score from users where user_name='$name'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$id,$sex,$score);
    while(mysqli_stmt_fetch($stmt)){
        $data["id"]=$id;
        $data["sex"]=$sex;
        $data["score"]=$score;
        $code=1;
    }
    mysqli_stmt_close($stmt);
    $userId=$data['id'];
    $sql="select message_content from messages where user_id='$userId'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$content);
    $index=0;
    while(mysqli_stmt_fetch($stmt)){
        $data["content"][$index]=$content;
        $index=$index+1;
    }
    getApiResult($code,$msg[$code],$data);
?>