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
});

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
				warmAndExit("修改完成");
			} else if (data.resultCode == 400) {
				warmAndExit("旧密码不正确");
			} else if (data.resultCode == 301) {
				warmAndExit("你的账号已在其他设备登录");
			}

		}
	});
};

function warmAndExit(msg, duration) {
	duration = 1000;
	var m = document.createElement('div');
	m.innerHTML = msg;
	m.style.cssText = "width: 80%;opacity: 0.6;height: 15%;color:#fff;line-height: 30px;text-align: center;border-radius: 5px;position:fixed ;top: 40%;left: 10%;z-index: 999999;background: rgb(0,0,0);font-size: 18px;display: -webkit-flex;display: flex;-webkit-align-items: center;align-items: center;-webkit-justify-content: center;justify-content: center;";
	document.body.appendChild(m);
	setTimeout(function() {
		// var d = 1;
		// m.style.webkitTransition = '-webkit-transform ' + d
		// + 's ease-in, opacity ' + d + 's ease-in';
		// m.style.opacity = '0';
		// setTimeout(function() {
		// document.body.removeChild(m);
		// }, d * 1000);
		history.back();
	}, duration);
};

function startInit() {
	// 页面高度
	var h = window.innerHeight;
	// var w = window.innerWidth;
	$("#baseInfo").css("height", h / 4);
	// $("#advanceInfo").css("height", h / 6);
	// $("#login_out").css("height", h / 13);
	$("#change_pwd").css("height", h / 13);
};

function notloginInit() {
};

function loginInit() {
};