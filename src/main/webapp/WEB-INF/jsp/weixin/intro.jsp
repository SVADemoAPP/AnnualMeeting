<%@page import="com.sva.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
<%
    AccountModel accountModel = (AccountModel) request.getSession().getAttribute("accountModel");
%>
<title>活动介绍</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #e6284a;
	width: 100%;
	height: 100%;
}

#prize {
	margin-right: 5%;
	margin-left: 5%;
	margin-top: -50%;
	margin-left: 5%;
}

p {
	margin-left: 2%;
	margin-top: 3%;
	color: #fff;
	font-size: 40px;
}

#div_intro {
	width: 100%;
	height: 100%;
}

#div_login_bg {
	background-color: #000000;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	opacity: 0.6;
}

#div_login {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
}
</style>
</head>
<body>
	<img src="../images/top_bg.png" width="100%" />
	<div id="prize">
		<img src="../images/prize.png" width="100%" /> <img
			src="../images/prize_set.png" style="margin-left: 2%; margin-top: 3%" />
		<img onclick='alert("我的中奖信息")' src="../images/my_prize_info.png"
			style="margin-top: -1%; float: right;" />
		<p>一等奖：iphone X 一名</p>
		<p>二等奖：ipad mini4 三名</p>
		<p>三等奖：iwatch3 五名</p>
	</div>
	<div id="div_login_bg">
	</div>
	
	<div id="div_login">
		<img src="../images/bg_login.png" > 
		</img>
	</div>
</body>
<html>