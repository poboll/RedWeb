<?php
    //输出页头
    header('Content-Type: text/json;charset=utf-8');
    //连接数据库
    include("conn.php");
    include("functions.php");

    //初始参数设置
    $code=0;
    $data=[];
    $msg=["获取失败","获取成功"];

    $sql="select * from messages";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$mesId,$pasId,$useId,$content,$status,$thumbs);
    $index=0;
    while(mysqli_stmt_fetch($stmt)){
        $data[$index]["mesId"]=$mesId;
        $data[$index]["pasId"]=$pasId;
        $data[$index]["userId"]=$useId;
        $data[$index]["content"]=$content;
        $data[$index]["status"]=$status;
        $data[$index]["thumbs"]=$thumbs;
        $index++;
    }
    $code=$index>0;
    getApiResult($code,$msg[$code],$data);
?>