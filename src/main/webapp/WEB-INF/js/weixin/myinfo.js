// 点击更改密码
$("#item_advance_pw").click(function() {
	isLogin('changePwd');

})
// 点击查询中奖信息
$("#item_advance_prz").click(function() {
	isLogin('wininfo');
})
// 退出登录
$("#login_out").click(function() {
	loginOut();
})

function isLogin(str) {
	$.ajax({
		type : "post",
		url : "../weixin/isLogin",
		data : {
			openid : myopenid,
		},
		success : function(data) {
			if (data.resultCode == 200) {
					location.href = '../weixin/'+str+'?openid=' + myopenid;
			} else if (data.resultCode == 301) {
				showToast("你的账户已在其他地方登录");
				reLogin();
			}
		}
	});
}

function loginOut() {
	$.ajax({
		type : "post",
		url : "../weixin/logout",
		data : {
			openid : myopenid,
		},
		success : function(data) {
			if (data.resultCode == 200) {
				showToast("退出登录成功");
				account == null;
				// $("#div_login_all").show();
				// $("#div_login").show();
				//
				// $(".value_jobnum").html("-");
				// $(".value_pnum").html("-");
				// $(".value_dptmt").html("-");
				clearInterval(timer);
				WeixinJSBridge.call('closeWindow');

			} else if (data.resultCode == 400) {
				showToast("退出失败");
			}
		}
	});
}

function startInit() {
	// 页面高度
	var h = window.innerHeight;
	// var w = window.innerWidth;
	$("#baseInfo").css("height", h / 6);
	$("#baseInfo1").css("height", h / 4);
	$("#advanceInfo").css("height", h / 6);
	$("#login_out").css("height", h / 13);
	// $("#change_pwd").css("height", h / 13);
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
//	$(".value_dptmt").html(account.dept);
}