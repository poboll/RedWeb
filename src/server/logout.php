<?php

    session_start();
    $code=0;
    $data="无法退出";
    $msg=["退出登陆失败","退出登陆成功"];
    include("functions.php");
    include("conn.php");
    if(isset($_SESSION['username'])){
        unset($_SESSION['username']);
        unset($_SESSION['logFlag']);
        session_destroy();
        $code=1;
        $data="";
    }
    
    getApiResult($code,$msg[$code],$data);
?>