var timer, eventSource, winnerCode,showConfirm;

$(document).ready(function() {

	showLogin();
});

/**
 * Server推送逻辑
 * 
 * @param id
 * @param openid
 */
function startSse(id, openid) {
	showConfirm=false;
	if (typeof (EventSource) !== "undefined") {
		eventSource = new EventSource("../weixin/pushSse?id=" + id + "&openid="
				+ openid);
		eventSource.onmessage = function(event) {
			console.log(event.data);
			var key = event.data;
			if ("notlogin" == key) {
				reLogin();
				showToast('账号在其他设备登录', 1000);
			}else if("notshow"==key){
				if (showConfirm) {
					showConfirm=false;
					$("#div_confirm").animate({
						marginBottom : "-60%"
					});
					$('#div_login_all').hide();
				}
			} else if ("overtime" == key) {
				showToast('确认领奖超时', 1000);
			} else {
				var strArr = key.split("_");
				if (strArr.length == 3) {
					var temp = $('#div_prize');
					if (temp && temp.is(':visible')) {
						$('.div_login_bg').unbind("click");
						temp.hide();
						$('#div_login_all').hide();
					}
					if (!showConfirm) {
						showConfirm=true;
						winnerCode = strArr[2];
						$('#img_prizecode').attr("src",
								"../images/prize_code" + winnerCode + ".png");
						$('#div_login_all').show();
						$('#div_confirm').show();
						$("#div_confirm").animate({
							marginBottom : "0%"
						});
						$('#bt_confirm').one("click", function() {
							$.ajax({
								type : "post",
								url : "../weixin/saveWinningRecord",
								data : {
									accountId : account.id,
									prizeCode : winnerCode,
									received : '1',
									time : new Date()
								},
								success : function(data) {
									showToast('领奖成功', 1000);
									$("#div_confirm").animate({
										marginBottom : "-60%"
									});
									$('#div_login_all').hide();
								}
							});
						})
					}
					$('#bt_confirm').html("确认领奖（" + strArr[1] + "s）");

				}
			}
		};
	} else {
		alert("您的浏览器版本过低，不支持SSE！");
	}
};

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
				startSse(account.id, account.openid);
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
	// console.log(new Date());
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
		showLoginDialog();
	} else {
		startSse(account.id, account.openid);
		loginInit();
		 if (fromNews == 'yes') {
			 showPrizeDialog();
		 }
		 timer = setInterval(heartbeat, 3000);
	}
};

/**
 * 重新登录
 */
function reLogin() {
	var temp = $('#div_prize');
	if (temp && temp.is(':visible')) {
		$('.div_login_bg').unbind("click");
		temp.hide();
		$('#div_login_all').hide();
	}
	// showToast('登录失效', 1000);
	account == null;
	showLoginDialog();
	clearInterval(timer);
	eventSource.close();
};
function showLoginDialog() {
	$('#div_login_all').show();
	$('#div_login').show();
	// 初始化登录框高度
	setTimeout(function() {
		$("#img_login").css("height", $("#img_login").height());
		$(".login_input").css("height", $("#img_login").height() / 8);
		$("#login_submit").css("height", $("#img_login").height() / 10);
	}, 300);
}

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
