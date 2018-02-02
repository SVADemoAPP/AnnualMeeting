var timer;

$(document).ready(function() {
	showLogin();
});

$("#login_submit").click(function() {
	if ($("#username").val() == '' || $("#password").val() == '') {
		showToast('用户名或密码不能为空', 1000);
		return;
	}
	$.ajax({
		type : "post",
		url : "../weixin/login",
		data : {
			username : $("#username").val(),
			password : $("#password").val(),
			openid : myopenid
		},
		success : function(data) {
			if (data.resultCode == 200) {
				showToast('登录成功', 1000);
				account = data.resultMsg;
				$('#div_login').hide();
				$('#div_login_all').hide();
				setInterval(heartbeat, 3000);
				loginInit();
			} else {
				showToast('登录错误', 1000);
			}
		}
	});
});

/**
 * 心跳以记录在线时长
 */
function heartbeat() {
	console.log(new Date());
	$.ajax({
		type : "post",
		url : "../weixin/heartbeat",
		data : {
			accountId : account.username
		},
		success : function(data) {
			console.log(data);
		}
	});
};

/**
 * 显示登录框
 */
function showLogin() {
	startInit();
	if (account == null) {
		notloginInit();
		$('#div_login_all').show();
		$('#div_login').show();
	} else {
		loginInit();
		if (fromNews == 'yes') {
			$("#bt_myprize").trigger("click");
		}
		timer = setInterval(heartbeat, 3000);
	}
};

/**
 * 重新登录
 */
function reLogin() {
	showToast('登录失效', 1000);
	account == null;
	$('#div_login_all').show();
	$('#div_login').show();
	clearInterval(timer);
};

function showToast(msg, duration) {
	duration = 3000;
	var m = document.createElement('div');
	m.innerHTML = msg;
	m.style.cssText = "width: 80%;opacity: 0.6;height: 15%;color:#fff;line-height: 30px;text-align: center;border-radius: 5px;position:fixed ;top: 40%;left: 10%;z-index: 999999;background: rgb(0,0,0);font-size: 18px;display: -webkit-flex;display: flex;-webkit-align-items: center;align-items: center;-webkit-justify-content: center;justify-content: center;";
	document.body.appendChild(m);
	setTimeout(function() {
		var d = 1;
		m.style.webkitTransition = '-webkit-transform ' + d
				+ 's ease-in, opacity ' + d + 's ease-in';
		m.style.opacity = '0';
		setTimeout(function() {
			document.body.removeChild(m)
		}, d * 1000);
	}, duration);
};

/**
 * 转化日期格式
 * 
 * @param format
 * @returns
 */
Date.prototype.format = function(format) {
	var date = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/i.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + '')
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in date) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? date[k]
					: ("00" + date[k]).substr(("" + date[k]).length));
		}
	}
	return format;
}
