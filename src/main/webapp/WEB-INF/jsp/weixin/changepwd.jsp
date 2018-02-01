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
%>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/weixin/myinfo.css">
<script type="text/javascript" src="../plugins/jquery.js"></script>
<title>更改密码</title>
</head>
<body>
	<div id="baseInfo">
		<div id="item_baseinfo">
			<p class="p_title">旧密码</p>
			<input class="value_old_pwd" />
		</div>
		<div class="line"></div>
		<div id="item_baseinfo">
			<p class="p_title">密码</p>
			<input class="value_new_pwd" />
		</div>
		<div class="line"></div>
		<div id="item_baseinfo">
			<p class="p_title">确认密码</p>
			<input class="value_new_check_pwd" />
		</div>
	</div>
	<div id="change_pwd">
		<img alt="" src="../images/136.png">
		<p class="">确认修改</p>
	</div>
	<script type="text/javascript" src="../js/weixin/changepwd.js"></script>
	<script type="text/javascript" src="../js/weixin/all.js"></script>
	<script type="text/javascript">
	var account=<%=accountJson%>;
	var myopenid='<%=openid%>';
	var fromNews='<%=fromNews%>';
	</script>
</body>
</html>