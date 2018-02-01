$("#bt_myprize").click(function() {
	$.ajax({
		type : "post",
		url : "../weixin/getWinInfoByAccount",
		data : {
			openid : myopenid
		},
		success : function(data) {
			if (data.resultCode == 200) {
				$('#div_wininfo').empty();
				var prizeArr=data.resultMsg;
				console.log(prizeArr);
				var html='';
				for(i=0;i<prizeArr.length;i++){
					$('#div_wininfo').append('<p class="prizename">'+prizeArr[i].name+'</p>');
					$('#div_wininfo').append('<p class="prizedesc">'+prizeArr[i].desc+'</p>');
				}
				$('#div_login_all').show();
				$('#div_prize').show();
				$("#div_prize").animate({
					marginTop : "-40%"
				}, function() {
					$('.div_login_bg').one("click", function() {
						$("#div_prize").animate({
							marginTop : "-180%"
						}, function() {
							$('#div_prize').hide();
							$('#div_login_all').hide();

						})
					});

				});

			} else if (data.resultCode == 301) {
				reLogin();
			}
		}
	});

});

function startInit() {
};

function notloginInit() {
};

function loginInit() {
};