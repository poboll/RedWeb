<?php

    //输出页头
    header("Content-Type: text/json;charset=utf-8");
    //连接数据库
    include("conn.php");
    include("functions.php");
    //初始参数设置
    $code=0;
    $data=[];
    $msg=["获取问题信息失败","获取问题信息成功"];

    $sql="select * from questions where 1";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$id,$content,$answer,$answer_A,$answer_B,$answer_C,$answer_D);
    $index=0;
    while(mysqli_stmt_fetch($stmt)){
        $data[$index]["id"]=$id;
        $data[$index]["content"]=$content;
        $data[$index]["answer"]=$answer;
        $data[$index]["option"]=array($answer_A,$answer_B,$answer_C,$answer_D);
        $index=$index+1;
    }
    $code=$index>0;

    getApiResult($code,$msg[$code],$data);
?>