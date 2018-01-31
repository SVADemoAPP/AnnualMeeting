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
<title>我的中奖信息</title>
</head>
<body>
	<p id="all_win_info" style="color: green;">暂无中奖信息</p>

<script type="text/javascript" src="../plugins/jquery.js"></script>
<script type="text/javascript" src="../js/weixin/all.js"></script>
<script type="text/javascript" src="../js/weixin/myinfo.js"></script>
	
	<script type="text/javascript">
	var account=<%=accountJson%>;
	var myopenid='<%=openid%>';
	var fromNews='<%=fromNews%>';
	$.ajax({
		type : "post",
		url : "../weixin/getWinInfoByAccount",
		data : {
			openid : myopenid
		},
		success : function(data) {
			if (data.resultCode == 200) {
				$('#all_win_info').empty();
				var prizeArr=data.resultMsg;
				console.log(prizeArr);
				var html='';
				for(i=0;i<prizeArr.length;i++){
					$('#all_win_info').append('<p class="prizename">'+prizeArr[i].name+'</p>');
					$('#all_win_info').append('<p class="prizedesc">'+prizeArr[i].desc+'</p>');
				}
				

			} else if (data.resultCode == 301) {
				reLogin();
			}
		}
	});
	</script>
</body>
</html>