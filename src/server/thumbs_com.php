<?php
    header('Content-Type: text/json;charset=utf-8');

    include("conn.php");
    include("functions.php");

    $code=0;
    $data="";
    $msg=["点赞失败","点赞成功"];

    //测试数据

    $content=$_POST["com_content"];

    $upsql="update messages set message_thumbs=message_thumbs+1 where message_content='$content'";
    $stmt=mysqli_prepare($conn,$upsql);
    if($stmt)
    {
        mysqli_stmt_execute($stmt);
        $code=1;
        $data=$content;
        getApiResult($code,$msg[$code],$data);
    }
    else getApiResult($code,$msg[$code],$data);
?>