var a, b, right, bottom, nextRandomTime;
var sendAble = true;// 可送福卡状态
var timer;
var card;
var winData;
// 获取中奖信息
function getWinInfo() {
	$.ajax({
		type : "post",
		url : "../weixin/randomFu",
		data : {
			openid : myopenid
		},
		success : function(data) {
			console.log("获取成功")
			if (data.resultCode == 200) {
				// 更新界面
				$(".lottery_start_info").hide();
				$(".start_lottery").hide();
				addMove();

				card = data.nowFu;
				console.log("抽到的福字:" + card);
				$(".back img").attr('src',
						"../images/" + (128 + parseInt(card)) + ".png");
				$(".flop_card").attr('src',
						"../images/" + (77 + parseInt(card)) + ".png");
				winData = data;
			} else if (data.resultCode == 301) {
				reLogin();
			}/*
				 * else if (data.resultCode == 303) { var nextTime = new
				 * Date(data.nextRandomTime).format("hh:mm");
				 * $(".lottery_start_info").html(nextTime + "再次抽奖");
				 * showToast('抽奖时间未到,下次抽奖时间为' + nextTime, 3000); } else if
				 * (data.resultCode == 305) { showToast('活动已结束', 1000);
				 * $(".lottery_start_info").html("活动已结束"); }
				 */
		}
	});
}

// 送福卡给好友
function sendCardToFrend(myToUserName, myFuId) {
	$.ajax({
		type : "post",
		url : "../weixin/giveFu",
		data : {
			openid : myopenid,
			fromUsername : account.username,
			toUsername : myToUserName,
			fuId : myFuId,
		},
		success : function(data) {
			console.log(data);
			if (data.resultCode == 200) {
				// setViewData(account);
				switch (myFuId) {
				case 1:
					winData.fu1--;
					break;
				case 2:
					winData.fu2--;
					break;
				case 3:
					winData.fu3--;
					break;
				case 4:
					winData.fu4--;
					break;
				default:
					break;

				}
				setViewData();
				$("#flop_send_tag").hide();
				showToast("成功送出");
			} else if (data.resultCode == 301) {
				$("#flop_send_tag").hide();
				reLogin();
			} else if (data.resultCode == 302) {
				showToast("用户名不存在", 1000);
			}
			sendAble = true;
		}
	});
}

var sendCardName;
// 翻牌
$(".front img").click(function() {
	if ($(".project .front img").hasClass('show') && $(".active").length == 0) {
		$(this).addClass("active");
		setTimeout(function() {
			$("#flop_tag").show();
			rotation();
			// 更新卡片数量
			if (winData.nextRandomTime != null) {
				nextRandomTime = new Date(winData.nextRandomTime);
			} else {
				nextRandomTime = null;
			}

		}, 800);
	}
})
var rotation = function() {
	var angle = 0;
	timer = setInterval(function() {
		angle += 3;
		$('#flop_bg').rotate(angle);
	}, 50);
}

// 点击开始抽奖按钮
// $(".start_lottery").click(function() {
// getWinInfo();
// })
// $(".lottery_start_info").click(function() {
// // getWinInfo();
// })
// 点击翻牌后的背景回复原始状态
$("#flop_tag").click(function() {
	setViewData();
	reInit();
	clearInterval(timer);
})
// 隐藏送好友界面
$(".flop_layer").click(function() {
	$("#flop_send_tag").hide();
})
// 点击送好友按钮
$(".flop_send").click(function() {
	if ($(".frend_input").val() == "") {
		showToast("工号不能为空", 1000);
		return;
	}
	// 是否送的好友为自己
	if ($(".frend_input").val() == account.username) {
		showToast("不能送给自己", 1000);
		return;
	}
	// 如果可送
	if (sendAble) {
		sendAble = false;
		var card;
		switch (sendCardName) {
		case "card_ran":
			card = 1;
			break;
		case "card_qing":
			card = 2;
			break;
		case "card_xiao":
			card = 3;
			break;
		case "card_zhan":
			card = 4;
			break;
		}
		sendCardToFrend($(".frend_input").val(), card);
	} else {
		showToast("请稍后...");
	}
})

$("#flop_complete_tag").click(function() {
	$("#flop_complete_tag").hide();

})
// 点击福卡
$(".foka_num img").click(function() {
	switch (this.className) {
	case "card_ran":
		if ($(".ran").html() == 0) {
			showToast("暂未获取该卡");
			return;
		}
		sendCardName = "card_ran";
		$(".flop_send_card").attr('src', "../images/82.png");
		break;
	case "card_qing":
		if ($(".qing").html() == 0) {
			showToast("暂未获取该卡");
			return;
		}
		sendCardName = "card_qing";
		$(".flop_send_card").attr('src', "../images/83.png");
		break;
	case "card_xiao":
		if ($(".xiao").html() == 0) {
			showToast("暂未获取该卡");
			return;
		}
		sendCardName = "card_xiao";
		$(".flop_send_card").attr('src', "../images/84.png");
		break;
	case "card_zhan":
		if ($(".zhan").html() == 0) {
			showToast("暂未获取该卡");
			return;
		}
		sendCardName = "card_zhan";
		$(".flop_send_card").attr('src', "../images/85.png");
		break;
	}
	$("#flop_send_tag").show();

})
// 重新初始化
function reInit() {
	subMove();
}
// 发牌
function addMove() {
	$('.project').each(function(index, item) {
		setTimeout(function() {
			$(item).css("top", "").css("left", "");
			$(item).addClass('ani' + index);
			$(".ani1").css("right", right);
			$(".ani2").css("bottom", bottom);
			$(".ani3").css("right", right).css("bottom", bottom);
			$(".project .front img").addClass("show")
		}, index * 300);
	})
}
// 收牌
function subMove() {
	$("#flop_tag").hide();
	init();
	$(".start_lottery").show();
	$(".lottery_start_info").show();
	$('.project').each(function(index, item) {
		$(item).removeClass('ani' + index);
		$(item).removeClass("active");
		$(".project .front img").removeClass("show").removeClass("active");

	});
};

// 初始化数据
var lastFu5;
function dataInit() {
	if (account != null) {
		winData = new Object();
		winData.fu1 = account.fu1;
		winData.fu2 = account.fu2;
		winData.fu3 = account.fu3;
		winData.fu4 = account.fu4;
		winData.fu5 = account.fu5;
		lastFu5 = winData.fu5;
		winData.nextRandomTime = account.nextRandomTime;
		winData.remainRandomCount = account.remainRandomCount;
		// console.log(winData.nextRandomTime.time);
		if (winData.nextRandomTime != null) {
			if (winData.nextRandomTime.time) {
				nextRandomTime = new Date(winData.nextRandomTime.time);
			} else {
				nextRandomTime = new Date(winData.nextRandomTime);
			}
		} else {
			nextRandomTime = null;
		}
		setViewData();
	}
};
// 设置界面数据
function setViewData() {
	var fu5 = winData.fu5;
	if (fu5 == 1 && lastFu5 == 1) {
		$("#flop_complete_tag").show();
		lastFu5 = 2;
	}

	var fu1 = winData.fu1;
	var fu2 = winData.fu2;
	var fu3 = winData.fu3;
	var fu4 = winData.fu4;

	// 修改该用户福卡信息
	$(".ran").html(fu1);
	$(".qing").html(fu2);
	$(".xiao").html(fu3);
	$(".zhan").html(fu4);
	//
	// console.log(nextRandomTime);
	// // $(".lottery_time_info").html(nextRandomTime.format('hh:mm') + "开始抽奖");
	// $(".lottery_time_info").html("剩余抽奖次数:" + winData.remainRandomCount);
	// console.log(winData);
	//
	// if (nextRandomTime == null) {
	// $(".lottery_start_info").html("活动已结束");
	// return;
	// }
	//
	// if (nextRandomTime > new Date()) {
	// var nextTime = new Date(nextRandomTime).format("hh:mm");
	// $(".lottery_start_info").html(nextTime + "再次抽奖");
	// } else {
	// $(".lottery_start_info").html("开始抽奖");
	// }

};

function init() {
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
function startInit() {
	setTimeout(function() {
		$("#container").show();
		init();
	}, 150);
	fukaSse(myopenid);
};

function notloginInit() {
};

function loginInit() {
	dataInit();
};

var clickAble=true;
function fukaSse(openid) {
	if (typeof (EventSource) !== "undefined") {
		$('.start_lottery').bind('click', function() {
			getWinInfo();
		});
		eventSource = new EventSource("../weixin/fukaSse?openid=" + openid);
		eventSource.onmessage = function(event) {
			console.log(event.data);
			var key = parseFloat(event.data);
			if (key > 0) {

				$(".lottery_time_info").html("剩余抽奖次数:" + parseInt(key));
				if (!clickAble) {
					clickAble = true;
					$(".start_lottery").css("backgroundImage",
							"url('../images/44.png')");
					$('.start_lottery').bind('click', function() {
						getWinInfo();
					});
				}

			} else if (key == -2) {
				if (clickAble) {
					clickAble = false;
					$(".lottery_time_info").html("活动已结束");
					$(".start_lottery").css("backgroundImage",
							"url('../images/67.png')");
					$('.start_lottery').unbind('click');
				}
			} else {

				if (clickAble) {
					clickAble = false;
					var nextTime = new Date(-key).format("hh:mm");
					$(".lottery_time_info").html("下次抽奖时间:" + nextTime);
					$(".start_lottery").css("backgroundImage",
							"url('../images/67.png')");
					$('.start_lottery').unbind('click');
				}
			}
		};
	} else {
		alert("您的浏览器版本过低，不支持SSE！");
	}
};
