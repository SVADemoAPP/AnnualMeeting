<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
<%
String openid=(String)request.getSession().getAttribute("openid");
%>
<html>
<head></head>
<body>
集福卡1 ${openid}
</body>
</html>