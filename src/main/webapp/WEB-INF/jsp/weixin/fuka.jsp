<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.sva.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
<%@ include file="../shared/weixinCss.jsp"%>
<%
	String openid=(String)request.getSession().getAttribute("openid");
//	String openid="aaa";
    AccountModel accountModel = (AccountModel)request.getSession().getAttribute("accountModel");
	String accountJson = JSONObject.fromObject(accountModel).toString(); 
%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<script type="text/javascript" src="../plugins/jquery.js"></script>
<script type="text/javascript" src="../plugins/jquery-migrate-1.2.1.min.js"></script>
<title>活动介绍</title>
</head> 
<body>
	<img src="../images/top_bg.png" width="100%" />
	<div id="prize">
		<img src="../images/prize.png" width="100%" /> <img src="../images/prize_set.png"
			style="margin-left: 2%; margin-top: 5%; width: 30%;" />
			 <img id="bt_myprize"  src="../images/my_prize_info.png"
			style="margin-top: -2%; float: right;; width: 45%;" />
		<p>一等奖：iphone X 一名</p>
		<p>二等奖：ipad mini4 三名</p>
		<p>三等奖：iwatch3 五名</p>
	</div>
	<div id="div_login_all" style="display: none;">
		<div class="div_login_layer"></div>
		<div class="div_login_bg">
			<div id="div_login" style="display: none;">
				<img id="img_login" src="../images/bg_login.png" /> <input
					id="username" type="text" class="login_input"
					style="margin-top: 30%;" placeholder="请输入您的华为工号" /> <input
					id="password" type="password" class="login_input"
					style="margin-top: 48%;" placeholder="请输入您的密码" /> <img
					id="login_submit" src="../images/login_submit.png" style="" />
			</div>

			<div id="div_prize"  style="display: none;">
					<img id="img_prizebg" src="../images/my_prize_dialog.png" /> 
			</div>
		</div>
	</div>
	
	<script type="text/javascript" >
	var account=<%=accountJson%>;
	var myopenid='<%=openid%>';
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
						showToast('登录成功',1000);
						account = data.resultMsg;
						$('#div_login').hide();
						$('#div_login_all').hide();
					} else {
						showToast('登录错误',1000);
					}
				}
			});
		});
		
		function showToast(msg,duration){
		    duration=isNaN(duration)?3000:duration;
		    var m = document.createElement('div');
		    m.innerHTML = msg;
		    m.style.cssText="width: 60%;min-width: 150px;opacity: 0.5;height: 30px;color: rgb(255, 255, 255);line-height: 30px;text-align: center;border-radius: 5px;position: fixed;top: 40%;left: 20%;z-index: 999999;background: rgb(0, 0, 0);font-size: 12px;";
		    document.body.appendChild(m);
		    setTimeout(function() {
		        var d = 0.5;
		        m.style.webkitTransition = '-webkit-transform ' + d + 's ease-in, opacity ' + d + 's ease-in';
		        m.style.opacity = '0';
		        setTimeout(function() { document.body.removeChild(m) }, d * 1000);
		    }, duration);
		}
	</script>
</body>
<html>