<%@page import="com.sva.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../shared/taglib.jsp"%>
<%
AccountModel accountModel=(AccountModel)request.getSession().getAttribute("accountModel");
%>
<html>
<head></head>
<body>
介绍      ${accountModel.openid}      ${accountModel.id}
</body>
</html>