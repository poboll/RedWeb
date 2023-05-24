<?php
    header('Content-Type: text/json;charset=utf-8');

    $code=0;
    $data=[];
    $msg=["文章获取失败","文章获取成功"];

    include("conn.php");
    include("functions.php");

    $sql="select * from passages where 1";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$id,$title,$source,$time,$content,$status,$thumbs);
    $i=0;
    while(mysqli_stmt_fetch($stmt)){
        $code=1;
        $data[$i]["id"]=$id;
        $data[$i]["title"]=$title;
        $data[$i]["source"]=$source;
        $data[$i]["time"]=$time;
        $data[$i]["content"]=$content;
        $data[$i]["status"]=$status;
        $data[$i]["thumbs"]=$thumbs;
        $i++;
    }
    getApiResult($code,$msg[$code],$data);

?>