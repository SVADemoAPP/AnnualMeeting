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
<link rel="stylesheet" type="text/css" href="../css/weixin/all.css">
<link rel="stylesheet" type="text/css" href="../css/weixin/myinfo.css">
<script type="text/javascript" src="../js/weixin/all.js"></script>
<script type="text/javascript" src="../js/weixin/myinfo.js"></script>
<title>我的信息</title>
</head> 
<body>
	<div id="baseInfo">
		<div id="item_baseinfo">
			<p class="p_title">工号</p>
			<p class="value_jobnum">123456</p>
		</div>
		<div class="line"></div>
		<div id="item_baseinfo">
			<p class="p_title">电话</p>
			<p class="value_pnum">13689082222</p>
		</div>
		<div class="line"></div>
		<div id="item_baseinfo">
			<p class="p_title">部门</p>
			<p class="value_dptmt">无线</p>
		</div>
	</div>
	
	<div id="advanceInfo">
		<div id="item_advance_pw">
			<p class="p_title">修改密码</p>
			<img src="../images/137.png"/>
		</div>
		<div class="line"></div>
		<div id="item_advance_prz">
			<p class="p_title">中奖信息</p>
			<img src="../images/137.png"/>
		</div>
	</div>
	
	<div id="login_out">
	<img alt="" src="../images/135.png">
	<p class="">退出登录</p>
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
	</script>
</body>
<html>