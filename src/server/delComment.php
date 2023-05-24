<?php
    header('Content-Type: text/json;charset=utf-8');

    $code=0;
    $data=[];
    $msg=["删除失败","删除成功"];

    include("conn.php");
    include("functions.php");

    $content=$_POST["content"];
    // $content="1234";

    $sql="update messages set message_status=0 where message_content='$content'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    $sql="select message_status from messages where message_content='$content'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$status);
    while(mysqli_stmt_fetch($stmt)){
        if($status==0){
            $code=1;
            $data=$content."已删除";
        }
    }
    getApiResult($code,$msg[$code],$data);

?>