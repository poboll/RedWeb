
//点击红点

$(".loader").click(function () {
    $.getJSON("src/server/history.php", function (data) {
        $(".years").append("<ul id='year'></ul>");
        var str = "";
        $.each(data[0].data, function (index, content) {
            str += "<li>" + "<h3 class='timeYear'>" + content["year"] + "</h3>" + "<h4 class='textName'>" +
                content["name"] + "</h4>" + "<p class='text'>" + content["text"] + "</p>" + "</li>";
        });
        $(".years ul").append(str);
        $(".loader").hide();
        $("ul#year li").each(function (i) {
            $(this).delay(600 * i).fadeIn("slow");
        });
    });

});


$.ajax({
    url: "src/server/loginCheck.php",
    type: "GET",
    dataType: "json",
    success: function (data) {
        if (data[0].code == 1) {
            // 文章点赞
            $(document).on("click", "span.thumbs", function () {
                var textGive_title = $(".pas-title h1").text();
                var nums = $(this).text();
                console.log(nums);
                $.ajax({
                    url: "src/server/thumbs_pas.php",
                    type: "POST",
                    data: {
                        "textGive_title": textGive_title,
                        "nums": nums
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data[0].msg);
                        nums++;
                        console.log(nums)
                        $("#give").text(nums);
                    },
                    error: function () {
                        alert("点赞失败");
                    }
                });

            });

            // 评论点赞
            $(document).on("click", ".thumbs-com", function () {
                var content = $(this).parent().siblings("p").text();
                console.log(content);
                var nums = $(this).text();
                console.log(nums);
                $.ajax({
                    url: "src/server/thumbs_com.php",
                    type: "POST",
                    data: {
                        "com_content": content,
                        "nums": nums
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data[0].msg);
                        nums++;
                        console.log(nums)
                        $(".thumbs-com").each(function () {
                            if ($(this).parent().siblings("p").text() == content)
                                $(this).text(nums);
                        })
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });
        }
    }
})

function scroll() {
    var top = $(".bg-imag").innerHeight(); //获取导航栏变色的位置距顶部的高度
    var Height = $(window).scrollTop();
    // console.log(top, Height);
    if (Height > top / 5) {
        $("nav.navbar").css('background-color', 'rgba(0,0,0,0.6)');
        $("p.navbar-brand,p.navbar-brandE,a").css('color', 'white');
        $(".block-content").fadeIn("slow").css('display', 'flex');
    } else {
        $("nav.navbar").css('background-color', 'rgba(0,0,0,0)');
        $("p.navbar-brand,p.navbar-brandE,a").css('color', 'black');
    }
}
$(document).on('scroll', function () {
    scroll()
});