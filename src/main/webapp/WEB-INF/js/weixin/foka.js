var a, b, right, bottom;
$(window).load(function()
{
    init();
});

// 初始化界面
function init()
{
    // 页面高度
    var h = window.innerHeight;
    var w = window.innerWidth;
    // 最上层图片高度
    var imgh = $(".bg-header img").height();
    // 设置下面布局高度
    $(".bg-footer").css("height", $(".bg-footer .card_ran").height() + 20);
    // 最下层集福卡高度
    var p = $(".bg-footer").height();
    // 得到中间发牌层高度
    var g = h - imgh - p - 20;
    // 设置发牌层高度
    $(".bg-content").css("height", g);
    // 牌的高度
    var imageh = g / 2;
    // 设置牌的高度
    $(".mask img").css("height", imageh);
    // 得到牌的宽高
    var height = $(".back img").height();
    var width = $(".back img").width();
    // 设置上下边距
    var top = (g - height) / 2;
    var left = (w - width) / 2;
    $(".project").css("top", top).css("left", left);
    a = top;
    b = left;
    right = width + 30;
    bottom = height + 10;
}

// 初始化数据
function dataInit()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else
    {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            // document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            console.log("chenggong");
        }
        console.log("失敗");
        // 修改抽奖次数
        $(".count").html("3");
        // 修改抽奖时间
        $(".lottery_start_info").html("15:00开始抽奖");
        // 修改该用户福卡信息
        $(".ran").html("0");
        $(".qing").html("0");
        $(".xiao").html("0");
        $(".zhan").html("0");

    }
    xmlhttp.open("GET", "/try/ajax/ajax_info.txt", true);
    xmlhttp.send();
}
// 获取指定区间范围随机数，包括lowerValue和upperValue
function randomFrom(lowerValue, upperValue)
{
    return Math.floor(Math.random() * (upperValue - lowerValue + 1)
            + lowerValue);
}

var card;
// 获取中奖信息
function getWinInfo()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else
    {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            // document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            console.log("chenggong");
        }
        // 测试设置
        var back = randomFrom(129, 132);
        card = back - 51;
        $(".back img").attr('src', "../images/" + back + ".png");
        $(".flop_card").attr('src', "../images/" + card + ".png");
    }
    xmlhttp.open("GET", "/try/ajax/ajax_info.txt", true);
    xmlhttp.send();
}

// 获取中奖信息
function sendCardToFrend()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {
        // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
        xmlhttp = new XMLHttpRequest();
    } else
    {
        // IE6, IE5 浏览器执行代码
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            // document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            console.log("chenggong");
        }
        // 测试设置
        if (sendCardName == "card_ran")
        {
            $(".ran").html(parseInt($(".ran").html()) - 1);
        } else if (sendCardName == "card_qing")
        {
            $(".qing").html(parseInt($(".qing").html()) - 1);
        } else if (sendCardName == "card_xiao")
        {
            $(".xiao").html(parseInt($(".xiao").html()) - 1);
        } else if (sendCardName == "card_zhan")
        {
            $(".zhan").html(parseInt($(".zhan").html()) - 1);
        }
        console.log("change")
    }
    xmlhttp.open("GET", "/try/ajax/ajax_info.txt", true);
    xmlhttp.send();
}

var sendCardName;
$(window).ready(
        function()
        {
            dataInit();
            /*
             * $(".mask").click(function () { addMove(); });
             */
            $(".front img").click(
                    function()
                    {
                        if ($(".project .front img").hasClass('show')
                                && $(".active").length == 0)
                        {
                            $(this).addClass("active");
                            setTimeout(function()
                            {
                                $("#flop_tag").show();
                                // 更新卡片数量
                                if (card == 78)
                                {
                                    $(".ran").html(
                                            parseInt($(".ran").html()) + 1);
                                } else if (card == 79)
                                {
                                    $(".qing").html(
                                            parseInt($(".qing").html()) + 1);
                                } else if (card == 80)
                                {
                                    $(".xiao").html(
                                            parseInt($(".xiao").html()) + 1);
                                } else if (card == 81)
                                {
                                    $(".zhan").html(
                                            parseInt($(".zhan").html()) + 1);
                                }
                                // 设置次数
                                $(".count").html(
                                        parseInt($(".count").html()) - 1);

                                // 此处获取后台数据更改前台显示图片
                                // $(".flop_card").attr('src', "../images/82.png");
                            }, 800);
                        }
                    })

            $(".start_lottery").click(function()
            {
                if (parseInt($(".count").html()) > 0)
                {
                    $(this).hide();
                    $(".lottery_start_info").hide();
                    addMove();
                    // 获取中奖信息
                    getWinInfo();
                } else
                {
                    alert("你的次数已经用完了");
                }
            })
            $(".lottery_start_info").click(function()
            {
                if (parseInt($(".count").html()) > 0)
                {
                    $(this).hide();
                    $(".start_lottery").hide();
                    addMove();
                    // 获取中奖信息
                    getWinInfo();
                } else
                {
                    alert("你的次数已经用完了");
                }

            })

            $("#flop_tag").click(function()
            {
                $("#flop_tag").hide();
                init();
                // $(".project .front img").removeClass("active");
                $(".start_lottery").show();
                $(".lottery_start_info").show();
                subMove();

            })

            $(".flop_layer").click(function()
            {
                $("#flop_send_tag").hide();
            })

            $(".flop_send").click(function()
            {
                sendCardToFrend();
                $("#flop_send_tag").hide();
            })

            $("#flop_complete_tag").click(function()
            {
                $("#flop_complete_tag").hide();

            })

            $(".foka_num img").click(function()
            {
                if (this.className == "card_ran")
                {
                    sendCardName = "card_ran";
                    $(".flop_send_card").attr('src', "../images/82.png");
                    $("#flop_send_tag").show();
                } else if (this.className == "card_qing")
                {
                    sendCardName = "card_qing";
                    $(".flop_send_card").attr('src', "../images/83.png");
                    $("#flop_send_tag").show();
                } else if (this.className == "card_xiao")
                {
                    sendCardName = "card_xiao";
                    $(".flop_send_card").attr('src', "../images/84.png");
                    $("#flop_send_tag").show();
                } else if (this.className == "card_zhan")
                {
                    sendCardName = "card_zhan";
                    $(".flop_send_card").attr('src', "../images/85.png");
                    $("#flop_send_tag").show();
                }

            })

            // $(".start_lottery").click(function(){
            // $(this).hide();
            // addMove();
            // })
        });
function addMove()
{
    $('.project').each(function(index, item)
    {
        setTimeout(function()
        {
            $(item).css("top", "").css("left", "");
            $(item).addClass('ani' + index);
            $(".ani1").css("right", right);
            $(".ani2").css("bottom", bottom);
            $(".ani3").css("right", right).css("bottom", bottom);
            $(".project .front img").addClass("show")
        }, index * 300);
    })
}
function subMove()
{
    $('.project').each(function(index, item)
    {
        $(item).removeClass('ani' + index);
        $(item).removeClass("active");
        $(".project .front img").removeClass("show").removeClass("active");

    })
}
