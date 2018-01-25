<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.sva.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
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

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/weixin/all.css">
<link rel="stylesheet" type="text/css" href="../css/weixin/foka.css">
<script type="text/javascript" src="../js/weixin/all.js"></script>
<script type="text/javascript" src="../js/weixin/foka.js"></script>

<title>活动介绍</title>
</head> 
<body>
	<div id="container">
		<div class="bg-header">
			<img src="../images/89.png" alt="" />
			<div class="lottery_times">
				<div class="lottery_box"></div>
				<img src="../images/90.png" alt="" />
				<p class="lottery_time_info">
					剩余次数 <span class="count">5</span> 次
				</p>
			</div>
		</div>
		<div class="bg-content">
			<div id="projects">
				<div class="project ">
					<div class="mask">
						<div class="back">
							<img src="../images/129.png" alt="" />
						</div>
						<div class="front">
							<img src="../images/68.png" alt="" />
						</div>
					</div>
				</div>
				<div class="project ">
					<div class="mask">
						<div class="back">
							<img src="../images/130.png" alt="" />
						</div>
						<div class="front">
							<img src="../images/68.png" alt="" />
						</div>
					</div>
				</div>
				<div class="project ">
					<div class="mask">
						<div class="back">
							<img src="../images/131.png" alt="" />
						</div>
						<div class="front">
							<img src="../images/68.png" alt="" />
						</div>
					</div>
				</div>
				<div class="project ">
					<div class="mask">
						<div class="back">
							<img src="../images/132.png" alt="" />
						</div>
						<div class="front">
							<img src="../images/68.png" alt="" />
						</div>
					</div>
				</div>
			</div>
			<img class="start_lottery" src="../images/44.png" alt="" />
			<p class="lottery_start_info">开始抽奖</p>
		</div>
		<div class="bg-footer contentspace">
			<div class="foka_num">
				<img src="../images/69.png" class="card_ran" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p1 class="ran">0
				</p>
			</div>
			<div class="foka_num">
				<img src="../images/70.png" class="card_qing" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p class="qing">10</p>
			</div>
			<div class="foka_num">
				<img src="../images/71.png" class="card_xiao" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p class="xiao">8</p>
			</div>
			<div class="foka_num">
				<img src="../images/72.png" class="card_zhan" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p class="zhan">6</p>
			</div>
		</div>
	</div>
	<div id="flop_tag" style="display: none;">
		<div class="flop_layer"></div>
		<div id="flop_bg">
			<img class="flop_card" alt="" src="../images/78.png">
		</div>
	</div>

	<div id="flop_send_tag" style="display: none;">
		<div class="flop_layer"></div>
		<div id="flop_send_bg">
			<img class="flop_send_card" alt="" src="../images/82.png"> <input
				class="frend_input" placeholder="请输入好友工号">
				<img class="flop_send" alt="" src="../images/87.png">
		</div>
	</div>
	
	<div id="flop_complete_tag" style="display: none;">
		<div class="flop_layer"></div>
		<div id="flop_complete_bg">
			<img class="flop_complete_card" alt="" src="../images/88.png">
		</div>
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