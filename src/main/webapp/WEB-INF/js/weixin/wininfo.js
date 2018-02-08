function startInit() {

};

function notloginInit() {

};

function loginInit() {
	$.ajax({
		type : "post",
		url : "../weixin/getWinInfoByAccount",
		data : {
			openid : myopenid
		},
		success : function(data) {
			if (data.resultCode == 200) {
				$('#all_win_info').empty();
				var prizeArr = data.resultMsg;
				console.log(prizeArr);
				var html = '';
				if (prizeArr.length == 0) {
					$('#all_win_info').append(account.username + ",暂无你的中奖信息");
					return;
				}
				for (i = 0; i < prizeArr.length; i++) {
//					$('#all_win_info')
//							.append(
//									'<p class="prizename">' + prizeArr[i].name
//											+ '</p>');
					$('#all_win_info')
							.append(
									'<p class="prizedesc">' + prizeArr[i].name
											+ '</p>');
				}

			} else if (data.resultCode == 301) {
				reLogin();
			}
		}
	});
};