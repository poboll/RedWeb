

var logName, logPwd, logSex, pasTitle, originText;

var articleData = [];

var questionData = [];

var userData = [];

var comData = [];

var str = "简介：这位客户很懒，还未留下自己的签名";

window.localStorage.setItem('cnt_click', 0);
window.localStorage.setItem('ans_score', 0);
window.localStorage.setItem('ans_correct', "");

function init() {
    logName = null;
    logPwd = null;
    logSex = null;
    pasTitle = null;
    originText = null;
}

//用户名、密码合法判断
function ifLegal() {
    if (logName.length < 4 || logName.length > 20) {
        $("input.name").attr('placeholder', '用户名不合法,用户名长度应在4~20个字符之间').val("").focus();
    }
    if (logPwd.length < 6 || logPwd.length > 20) {
        $("input.pwd").attr('placeholder', '密码不合法,密码长度应在6~20个字符之间').val("");
    } else if (logName.length >= 4 && logPwd.length >= 6) {
        $("input.name").attr('placeholder', '请输入用户名');
        $("input.pwd").attr('placeholder', '请输入密码');
        return true;
    }
    return false;
}

function onclickLogin(obj) {
    $(document).on("click", obj, function () {
        $('#loginModal').modal('show');
    })
}

//登陆判断
function log_Check() {
    $.ajax({
        url: "src/server/loginCheck.php",
        type: "GET",
        dataType: "json",
        success: function (data) {
            var html = "";
            if (data[0].code == 1) {
                userData = data[0].data;
                $(".init").hide();
                $(".loged").show();
                console.log(data);
                if (data[0].data["user_sex"] == '男') {
                    $("img.photo").attr('src', 'static/image/男.png');
                } else {
                    $("img.photo").attr('src', 'static/image/女.png');
                }
                $(".name").html("<p>" + data[0].data["user_info"] + "</p>");
                $(".score").html("<p>" + "积分：" + data[0].data["user_score"] + "</p>");
                $(".user-sign").html("<p>" + str + "</p>");
                $.each(data[0].data["user_content"], function (index, content) {
                    console.log(index);
                    if (content["status"] == 1) {
                        html += "<div class='person-mes'>" +
                            "<p>" + content["content"] + "</p>" +
                            "<div class='control'>" +
                            "<span class='glyphicon glyphicon-pencil edit-com' aria-hidden='true'></span>" + "<span class='glyphicon glyphicon-trash del-com' aria-hidden='true'></span>" +
                            "</div>" + "<div class='edit-Box'>" +
                            "<textarea class='editContent' cols=20>" + content + "</textarea>" +
                            "<button class='edit-btn'>修改完成</button>" +
                            "</div>" +
                            "</div>";
                    }
                });
                $(".function").append(html);
                $(".person-mes").each(function (index) {
                    $(this).delay(200 * index).fadeIn("slow").css('display', 'flex');
                })

            } else
            //游客控制
            {
                console.log(data);
                onclickLogin(".clickToLog");
                onclickLogin(".glyphicon-thumbs-up");
                onclickLogin(".btn-get");

            }
        },
        error: function (error) {
            console.log(error);
        }
    })
}

log_Check();

//登陆控制
$(document).on('click', '.log', function () {
    logName = $(".items .name").val();
    logPwd = $(".items .pwd").val();
    $.ajax({
        url: "src/server/login.php",
        type: "POST",
        data: {
            "userName": logName,
            "userPwd": logPwd
        },
        dataType: "json",
        success: function (data) {
            if (data[0].code == 1) {
                $("#loginModal").modal("hide");
                $(".items .name").val("");
                $(".items .pwd").val("");
                window.location.reload();
            } else {
                alert(data[0].data);
                $(".items .name").val("").focus();
                $(".items .pwd").val("");
                if (data[0].data == "用户不存在，请先注册") {
                    $(".sex-form").show().css("display", "flex");
                }
            }
        },
        error: function () {
            console.log("false");
        }
    })
});

// 注册控制
$(document).on('click', '.sign', function () {
    logName = $(".items .name").val();
    logPwd = $(".items .pwd").val();
    logSex = $("input[class='sex']:checked").val();
    console.log(logSex);
    //用户名、密码合法判断
    if (ifLegal()) {
        $.ajax({
            url: "src/server/register.php",
            type: "POST",
            data: {
                "userName": logName,
                "userPwd": logPwd,
                "userSex": logSex
            },
            dataType: "json",
            success: function (data) {
                if (data[0].code == 1) {
                    alert(data[0].data);
                    $("input.sex").removeAttr("checked");
                    $(".sex-form").hide();
                    $(".items .name").val("");
                    $(".items .pwd").val("");
                    init();
                    logFlag = 1;
                } else {
                    alert(data[0].msg);
                }
            },
            error: function () {
                alert("失败");
            }
        })
    }
});

//退出登陆
$(document).on("click", ".logout-btn", function () {
    $.ajax({
        url: "src/server/logout.php",
        type: "POST",
        data: {
            "username": logName,
            "userpwd": logPwd
        },
        dataType: "json",
        success: function (data) {
            if (data[0].code == 1) {
                init();
                window.location.reload();
            }
            alert(data[0].msg);
        },
        error: function (error) {
            console.log(error);
        }
    });
});


// 获取党史要闻内容
$(document).on("click", ".chapter", function () {
    pasTitle = $(this).find("h3.title").text()
    window.localStorage.setItem('title', pasTitle);
});

//储存数据库中的党史要闻数据
$.ajax({
    url: "src/server/getArticles.php",
    type: "POST",
    dataType: "json",
    success: function (data) {
        $.each(data[0].data, function (index, content) {
            articleData[index] = content;
        });
        var addStr = "";
        $.each(articleData, function (index, content) {
            addStr += "<a class='chapter' href='Read.html' target='_blank'>";
            addStr += "<h3 class='title'>" + content.title + "</h3>";
            addStr += "<p class='brief'>" + "<span>" + "来源：" + content.source + "</span>" + "<span>" + "发表时间:" + content.time + "</span></p>" + "</a>";
            //显示党史要闻内容
            if (content['title'] == localStorage.getItem('title')) {
                $(".pas-title h1").text(content['title']);
                $(".pas-content").html(content['content']);
                $(".thumbs").text(content['thumbs']);
                var str = "";
                $.ajax({
                    url: "src/server/getArticleCom.php",
                    type: "POST",
                    data: {
                        "pas_id": content['id']
                    },
                    success: function (data) {
                        if (data[0].code == 1) {
                            $.each(data[0].data, function (i, cnt) {
                                str += "<div class='User-comt'>" + "<p class='com-text'>" + cnt["content"] + "</p>" + "<div class='info-con'>" + "<p class='com-user' style='font-size:14px'>" + "From:" + cnt["user"] + "</p>" +
                                    "<div class='control'>" + "<span id='give' class='glyphicon glyphicon-thumbs-up thumbs-com' aria-hidden='true'>" +
                                    cnt.thumbs + "</span>" + "</div>" + "</div>" + "</div>";
                            });
                            $(".comment-info").append(str);
                            $(".User-comt").fadeIn("slow").css("display", "flex");

                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
                localStorage.setItem('pas_id', content['id']);
            }
        })
        $(".catalogue").append(addStr);
        console.log(articleData);
    },
    error: function (error) {
        console.log(error);
    }
})

// 储存问题数据
$.ajax({
    url: "src/server/getQuestion.php",
    type: "POST",
    dataType: "json",
    success: function (data) {
        if (data[0].code == 1) {
            questionData = data[0].data;
        } else console.log(data);
    },
    error: function (error) {
        console.log(error);
    }
})

//获取问题信息
$(document).on("click", ".btn-get", function () {
    $(".option").removeClass("selected");
    if ($(this).text() != "提交答案") {
        $(".question-Box").fadeIn().css("display", "flex");
        var i = window.localStorage.getItem('cnt_click');
        $(".question-content").html(questionData[i].content);
        $("button#A").text(questionData[i].option[0]);
        $("button#B").text(questionData[i].option[1]);
        $("button#C").text(questionData[i].option[2]);
        $("button#D").text(questionData[i].option[3]);
        window.localStorage['ans_correct'] = questionData[i].answer;
        window.localStorage['cnt_click']++;
        if (window.localStorage.getItem('cnt_click') == questionData.length)
            $(this).text("提交答案");
        else $(this).text("下一题");
    } else {
        //刷新网页
        window.location.reload();
        //提示总分
        alert("本次总分为：" + window.localStorage.getItem('ans_score'));
        //销毁localstorage['cnt_click']和localstorage['score']
        localStorage.clear();
    }
})

//回答问题
$(document).on("click", ".option", function () {
    var myAns = $(this).text();
    $(this).addClass("selected");
    // alert("您的选择是"+myAns);
    if (myAns == window.localStorage['ans_correct']) {
        $.ajax({
            url: "src/server/getscore.php",
            type: "POST",
            data: {
                "userName": userData['user_info'],
                "userScore": userData['user_score']
            },
            dataType: "json",
            success: function (data) {
                if (data[0].code == 1) {
                    window.localStorage['ans_score']++;
                }
            },
            error: function (error) {
                console.log(error);
            }
        })
    }
})

// 文章评论
$("#subx").click(function () {
    var comment_content = $(".comment").val();
    var comment_passageId = localStorage.getItem('pas_id');
    var user_name = userData['user_info'];
    console.log(comment_passageId, user_name);
    $.ajax({
        url: "src/server/comment.php",
        type: "POST",
        data: {
            "passageId": comment_passageId,
            "userName": user_name,
            "userComment": comment_content
        },
        dataType: "json",
        success: function (data) {
            alert(data[0].msg);
            str = "<div class='User-comt'>" + "<p>" + comment_content + "</p>" + "<div class='info-con'>" + "<p class='com-user' style='font-size:14px'>" + "From:" +user_name+ "</p>" +
            "<div class='control'>" + "<span id='give' class='glyphicon glyphicon-thumbs-up thumbs-com' aria-hidden='true'>" +
            0 + "</span>" + "</div>" + "</div>" + "</div>";
            $(".comment-info").append(str);
            $(".User-comt").fadeIn("slow").css("display", "flex");
            $(".comment").val("");

        },
        error: function (error) {
            console.log(error);
        }
    });
});

//编辑评论
$(document).on("click", ".edit-com", function () {
    originText = $(this).parent().siblings("p").text();
    $(this).parent().hide().siblings().hide();
    $(this).parent().siblings(".edit-Box").css('display', 'flex').show();
});

$(document).on("click", ".edit-btn", function () {
    var content = $(this).siblings().val();
    console.log(originText, content);
    $.ajax({
        url: "src/server/editComment.php",
        type: "POST",
        data: {
            "content": content,
            "origin": originText
        },
        dataType: "json",
        success: function (data) {
            if (data[0].code == 1) {
                $(".person-mes").each(function () {
                    if ($(this).find("textarea").val() == content) {
                        $(this).find(".edit-Box").siblings().show();
                        $(this).find(".edit-Box").hide();
                        $(this).find("p").text(content);
                        originText = null;
                    }
                })
            } 
                alert(data[0].msg);
            
        }
    })
})

//删除评论
$(document).on("click", ".del-com", function () {
    originText = $(this).parent().siblings("p").text();
    $.ajax({
        url: "src/server/delComment.php",
        type: "POST",
        data: {
            "content": originText
        },
        dataType: "json",
        success: function (data) {
            if (data[0].code == 1) {
                $(".person-mes").each(function () {
                    if ($(this).find("p").text() == originText) {
                        $(this).hide();
                    }
                })
            } 
                alert(data[0].msg);
        }
    })
})

init();