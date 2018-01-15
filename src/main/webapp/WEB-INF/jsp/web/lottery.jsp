<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../shared/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>幸运大抽奖</title>
<style>
    html,body{
        margin:0;
        padding:0;
        overflow:hidden;
    }
    
    #back{
        background:url(../images/back.png) no-repeat;
    }
    
    .main_bg{
        background:url(../images/mainBg.png) top center no-repeat;
        height:1080px;
    }
    
    .main{
        width:1120px;
        height:1080px;
        position:relative;
        margin:0 auto;
    }
    
    .mask{
        background:url(../images/blinkLeft.png) no-repeat;
        width:1048px;
        height:364px;
        position:absolute;
        top: 638px;
        margin-left: 35px;
        overflow:hidden;
        text-align:center;
        z-index:8;
    }
    
    .num_box{
        background:url(../images/numBox.png) no-repeat;
        width:1119px;
        height:435px;
        position:absolute;
        top:608px;
        overflow:hidden;
        text-align:center;
        padding: 92px 0 0 80px;
    }
    
    .num{
        background:url(../images/num.png) top center repeat-y;
        width:160px;
        height:230px;
        float:left;
    }
    
    .handle{
        background:url(../images/handleOff.png) 0px 0px no-repeat;
        width:110px;
        height:296px;
        position:absolute;
        right:-70px;
        bottom:200px;
        cursor:pointer;
        clear:both;
    }
</style>
</head>
<body>
    <div class="main_bg">
        <div id="back"></div>
        <div class="main">
            <div class="mask"></div>
            <div class="num_box">
                <div class="num"></div>
                <div class="num"></div>
                <div class="num"></div>
                <div class="num"></div>
                <div class="num"></div>
                <div class="num"></div>
            </div>
            <div class="handle"></div>
        </div>
    </div>
    <script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/plugins/easing.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/web/lottery.js'/>" type="text/javascript"></script>
</body>
</html>