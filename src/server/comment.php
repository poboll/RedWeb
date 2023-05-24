<?php
    //输出页头
    header('Content-Type: text/json;charset=utf-8');
    //连接数据库
    include("conn.php");
    include("functions.php");

    //初始参数设置
    $code=0;
    $data="";
    $msg=["评论失败","评论成功"];

    //测试数据
    // $userName="wywy221";
    // $userComment="御手洗洁";
    // $passageId=2;

    //获取客户端数据
    $passageId=$_POST["passageId"];
    $userName=$_POST["userName"];
    $userComment=$_POST["userComment"];

    $sql="select user_id from users where user_name='$userName'";
    $stmt=mysqli_prepare($conn,$sql);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result($stmt,$id);
    while(mysqli_stmt_fetch($stmt)){
        $ID=$id;
    }
    mysqli_stmt_close($stmt);
    $insertSql="insert into messages(passage_id,user_id,message_content) VALUES($passageId,$ID,'$userComment')";
    $insertStmt=mysqli_prepare($conn,$insertSql) or die(mysqli_error($conn));
    mysqli_stmt_execute($insertStmt);
    if($insertStmt!=null)
    {
        $code=1;
        $data=$userName;
    }
    mysqli_stmt_close($insertStmt);
    mysqli_close($conn);
    getApiResult($code,$msg[$code],$data);
?>