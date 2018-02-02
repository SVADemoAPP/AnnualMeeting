//点击更改密码
$("#item_advance_pw").click(function() {
	location.href = '../weixin/changePwd?openid=' + myopenid;
})
//点击查询中奖信息
$("#item_advance_prz").click(function() {
	location.href = '../weixin/wininfo?openid=' + myopenid;
})
//退出登录
$("#login_out").click(function() {
	loginOut();
})

function loginOut() {
	$.ajax({
		type : "post",
		url : "../weixin/logout",
		data : {
			openid : myopenid,
		},
		success : function(data) {
			if (data.resultCode == 200) {
				showToast("退出登录成功2");
				account == null;
//				$("#div_login_all").show();
//				$("#div_login").show();
//
//				$(".value_jobnum").html("-");
//				$(".value_pnum").html("-");
//				$(".value_dptmt").html("-");
				clearInterval(timer);
				weixinClosePage();

			} else if (data.resultCode == 400) {
				showToast("退出失败");
			}
		}
	});
}

//关闭微信页面
function weixinClosePage() {
    if (typeof WeixinJSBridge == "undefined") {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', weixin_ClosePage, false);
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', weixin_ClosePage);
            document.attachEvent('onWeixinJSBridgeReady', weixin_ClosePage);
        }
    } else {
        weixin_ClosePage();
    }
    showToast("退出")
}

function startInit() {
	// 页面高度
	var h = window.innerHeight;
	// var w = window.innerWidth;
	$("#baseInfo").css("height", h / 4);
	$("#advanceInfo").css("height", h / 6);
	$("#login_out").css("height", h / 13);
//	$("#change_pwd").css("height", h / 13);
};

function notloginInit() {
	$(".value_jobnum").html("-");
	$(".value_pnum").html("-");
	$(".value_dptmt").html("-");
};

function loginInit() {
	userInfoInit();
};

function userInfoInit() {
	$(".value_jobnum").html(account.username);
	$(".value_pnum").html(account.phoneNo);
	$(".value_dptmt").html(account.dept);
}