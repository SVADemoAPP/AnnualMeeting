<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.sva.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
<%
    String openid = (String) request.getSession().getAttribute("openid");
			//	String openid="aaa";
			AccountModel accountModel = (AccountModel) request.getSession().getAttribute("accountModel");
			String accountJson = JSONObject.fromObject(accountModel).toString();
			String fromNews = (String) request.getSession().getAttribute("fromNews");

			request.setAttribute("parentPath", request.getContextPath());
%>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<script type="text/javascript" src="../plugins/jquery.js"></script>
<script type="text/javascript"
	src="../plugins/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../plugins/jQueryRotate.js"></script>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/weixin/all.css">
<link rel="stylesheet" type="text/css" href="../css/weixin/foka.css">


<title>集福卡</title>
</head>
<body>
	<div id="container" style="display: none;">
		<div class="bg-header">
			<img src="../images/89.png" alt="" />
			<div class="lottery_times">
				<div class="lottery_box"></div>
				<img src="../images/90.png" alt="" />
				<p class="lottery_time_info"></p>
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
			<div class="start_lottery" alt="" />
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
				<p class="qing">0</p>
			</div>
			<div class="foka_num">
				<img src="../images/71.png" class="card_xiao" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p class="xiao">0</p>
			</div>
			<div class="foka_num">
				<img src="../images/72.png" class="card_zhan" alt="" /> <img
					src="../images/77.png" class="num_bg" alt="" />
				<p class="zhan">0</p>
			</div>
		</div>
	</div>
	<div id="flop_tag" style="display: none;">
		<div class="flop_layer"></div>
		<div id="flop_bg"></div>
		<img class="flop_card" alt="" src="../images/78.png">
	</div>

	<div id="flop_send_tag" style="display: none;">
		<div class="flop_layer"></div>
		<div id="flop_send_bg">
			<img class="flop_send_card" alt="" src="../images/82.png"> <input
				class="frend_input" placeholder="请输入好友工号"> <img
				class="flop_send" alt="" src="../images/87.png">
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
					style="margin-top: 30%;" placeholder="请输入您的8位华为工号" /> <input
					id="password" type="password" class="login_input"
					style="margin-top: 48%;" placeholder="请输入您的密码" /> <img
					id="login_submit" src="../images/login_submit.png" style="" />
			</div>

		</div>
	</div>
	
	<div id="div_confirm" style="display: none;">
		<img id="img_confirm" src="../images/img_confirm.png" />
		<p>恭喜您获得</p>
		<img id="img_prizecode" src="../images/prize_code2.png" />
		<button id="bt_confirm" type="button">确认领奖（60s）</button>
	</div>
	<script type="text/javascript" src="../js/weixin/all.js"></script>
	<script type="text/javascript" src="../js/weixin/foka.js"></script>
	<script type="text/javascript">
	var account=<%=accountJson%>;
	var myopenid='<%=openid%>';
	var fromNews='<%=fromNews%>';
	</script>
</body>
<html>