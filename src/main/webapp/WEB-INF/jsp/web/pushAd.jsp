<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../shared/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广告推送</title>
<style>
.table{
    width:100%;
}
</style>
</head>
<body>
    <div style="text-align: center;">
        <form id="usrform" action="/sva/pushAd/uploadAndPush" method="post" enctype="multipart/form-data">
	        <div>
	            <textarea id="text" rows="10" cols="60" name="txt"></textarea>
	        </div>
        
            <div>
                <input id="img" name="image" type="file" style="width: 442px;margin: 30px;"/>
            </div>
            <div>
                <input id="submit" type="submit" value="提交"/>
                <input id="clear" type="button" value="清空"/>
            </div>
        </form>
        <div id="console" style="margin-top: 30px;color: red;"></div>
    </div>
<script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/util.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/web/pushAd.js'/>" type="text/javascript"></script>
</body>
</html>