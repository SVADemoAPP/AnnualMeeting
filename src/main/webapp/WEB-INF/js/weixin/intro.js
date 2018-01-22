$(document).ready(function() {
	if (account == null) {
		$('#div_login_all').show();
		$('#div_login').show();
	}
});

$("#bt_myprize").click(function() {
	$('#div_login_all').show();
	$('#div_prize').show();
	$("#div_prize").animate({marginTop:"-40%"},function(){
		$('.div_login_bg').one("click", function(){
			$("#div_prize").animate({marginTop:"-180%"},function(){
				$('#div_prize').hide();
				$('#div_login_all').hide();
				
			})
		});
		
	});
});

//$(".div_login_bg").click(function() {
//	$("#div_prize").animate({marginTop:"-180%"},function(){
//		$('#div_prize').hide();
//		$('#div_login_all').hide();
//	})
//});


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
				$('#div_login').hide();
				$('#div_login_all').hide();
			} else {

			}
		}
	});
});