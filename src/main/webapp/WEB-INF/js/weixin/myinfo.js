$(window).load(function() {
	// 页面高度
	var h = window.innerHeight;
	// var w = window.innerWidth;
	$("#baseInfo").css("height", h / 4);
	$("#advanceInfo").css("height", h / 6);
	$("#login_out").css("height", h / 13);
	$("#change_pwd").css("height", h / 13);
alert("12:"+myopenid);
	userInfoInit();
});
$(window).ready(function() {
	$("#item_advance_pw").click(function() {
		console.log("点击了");
		alert(myopenid);
		location.href = '../weixin/changePwd?openid='+myopenid;
	})
	$("#change_pwd").click(function() {
		var oldpwd = $(".value_old_pwd").val();
		var newpwd1 = $(".value_new_pwd").val();
		var newpwd2 = $(".value_new_check_pwd").val();
		if (oldpwd == "" || newpwd1 == "" || newpwd2 == "") {
			showToast("不能为空");
			return;
		}
		if (newpwd1 != newpwd2) {
			showToast("新密码两次输入不一致");
			return;
		}
		changePwd(oldpwd, newpwd2);
	})
	$("#item_advance_prz").click(function() {
		location.href = '../weixin/wininfo';
	})

	$("#login_out").click(function() {
		loginOut();
	})

});

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
				account==null;
				$("#div_login_all").show();
				$("#div_login").show();

				$(".value_jobnum").html("-");
				$(".value_pnum").html("-");
				$(".value_dptmt").html("-");
				clearInterval(timer);

			} else if (data.resultCode == 400) {
				showToast("退出失败");
			}
		}
	});
}

function changePwd(myoldPwd, mynewPwd) {
	$.ajax({
		type : "post",
		url : "../weixin/changePassword",
		data : {
			openid : myopenid,
			oldPwd : myoldPwd,
			newPwd : mynewPwd,
		},
		success : function(data) {
			if (data.resultCode == 200) {
				showToast("修改完成");
			} else if (data.resultCode == 400) {
				showToast("旧密码输入不对");
			}
		}
	});
}
function userInfoInit() {
	$(".value_jobnum").html(account.username);
	$(".value_pnum").html(account.phoneNo);
	$(".value_dptmt").html(account.username);
}

function dataInit() {
	if (account != null) {
		userInfoInit();
	}
};