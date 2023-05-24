<?php
    header('Content-Type: text/json;charset=utf-8');

    $code=0;
    $data=[];
    $msg=["修改失败","修改成功"];

    include("conn.php");
    include("functions.php");

    $content=$_POST["content"];
    $origin=$_POST["origin"];
    // $content="1234";
    // $origin="我的第一条评论";

    $sql="select message_id from messages where message_content='$origin'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$i);
    while(mysqli_stmt_fetch($stmt)){$id=$i;}
    $sql="update messages set message_content='$content' where message_id='$id'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    $sql="select message_content from messages where message_id='$id'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$con);
    while(mysqli_stmt_fetch($stmt)){
        if($con==$content){
            $code=1;
            $data=$con;
        }
    }
    getApiResult($code,$msg[$code],$data);

?>