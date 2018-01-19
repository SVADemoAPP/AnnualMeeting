$(document).ready(function() {
	if (account == null) {
		$('#div_login_all').show();
		alert('我的界面');
	}
});

$("#login_submit").click(function() {
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
				account = data.resultMsg;
				$('#div_login_all').hide();
			} else {

			}
		}
	});
});