<?php
    header('Content-Type: text/json;charset=utf-8');

    include("conn.php");
    include("functions.php");

    $code=0;
    $data="";
    $msg=["点赞失败","点赞成功"];

    //测试数据
    // $title="李大钊：中国共产党的创始人之一";
    //获取客户端数据
    $title=$_POST["textGive_title"];
    $nums=$_POST["nums"];

    $upsql="update passages set passage_thumbs=passage_thumbs+1 where passage_title='$title'";
    $stmt=mysqli_prepare($conn,$upsql);
    if($stmt)
    {
        mysqli_stmt_execute($stmt);
        $code=1;
        $data=$title;
        getApiResult($code,$msg[$code],$data);
    }
    else getApiResult($code,$msg[$code],$data);
?>