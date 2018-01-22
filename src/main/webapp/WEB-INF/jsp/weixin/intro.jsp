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
%>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../css/weixin/page.css" />
<script type="text/javascript" src="../plugins/jquery.js"></script>
<script type="text/javascript"
	src="../plugins/jquery-migrate-1.2.1.min.js"></script>
<title>活动介绍</title>
</head>
<body>
	<img src="../images/top_bg.png" width="100%" />
	<div id="prize">
		<img src="../images/prize.png" width="100%" /> <img
			src="../images/prize_set.png"
			style="margin-left: 2%; margin-top: 5%; width: 30%;" /> <img id="bt_myprize" src="../images/my_prize_info.png"
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

	<script type="text/javascript" src="../js/weixin/intro.js"></script>

	<script type="text/javascript">
	var account=<%=accountJson%>;
	var myopenid='<%=openid%>';
	</script>
</body>
<html>