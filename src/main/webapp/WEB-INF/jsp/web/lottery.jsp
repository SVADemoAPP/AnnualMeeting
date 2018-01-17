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
        /* overflow:hidden; */
    }
    
    #back{
        background:url(<c:url value='/images/back.png'/>) no-repeat;
        width: 150px;
        height: 70px;
        position:absolute;
        top: 50px;
        left: 30px;
        cursor:pointer;
    }
    #back:active{
        background:url(<c:url value='/images/backActive.png'/>) no-repeat;
    }
    
    .main_bg{
        background:url(<c:url value='/images/mainBg.png'/>) top center no-repeat;
        height:1080px;
    }
    
    .main{
        width:1120px;
        height:1080px;
        position:relative;
        margin:0 auto;
    }
    
    .mask{
        background:url(<c:url value='/images/blinkLeft.png'/>) no-repeat;
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
        background:url(<c:url value='/images/numBox.png'/>) no-repeat;
        width:1119px;
        height:435px;
        position:absolute;
        top:608px;
        overflow:hidden;
        text-align:center;
        padding: 92px 0 0 80px;
    }
    
    .num{
        background:url(<c:url value='/images/num.png'/>) top center repeat-y;
        width:160px;
        height:230px;
        float:left;
    }
    
    .handle{
        background:url(<c:url value='/images/handleOff.png'/>) bottom no-repeat;
        width:110px;
        height:296px;
        position:absolute;
        right:-70px;
        bottom:200px;
        cursor:pointer;
        clear:both;
    }
    
    .prizeCountBox{
        width: 200px;
        height: 50px;
        position:absolute;
        right: 80px;
        top:666px;
        color:rgb(251,245,19);
        text-align:center;
    }
    
    .prizeCount{
        width: 200px;
        margin-top: -40px;
        font-family: "Arial";
        font-weight: bold;
        font-size:200px;
        text-shadow: 5px 5px 10px #1b1b19;
    }
    
    .popup{
        position:absolute;
        top:0;
        z-index:10;
        width:1920px;
        height:1080px;
        background-color:rgba(0,0,0,0.5);
    }
    
    .notice{
        width: 858px;
        height: 892px;
        margin:50px auto;
        z-index:9;
    }
    
    .noticeBox{
        position:absolute;
        width: 858px;
        height: 892px;
        background:url(<c:url value='/images/winner.png'/>) bottom no-repeat;
        z-index:12;
    }
    
    .arrow{
        background:url(<c:url value='/images/arrow.png'/>) bottom no-repeat;
        float:right;
        width: 85px;
        height: 50px;
        margin: 100px 70px;
        cursor: pointer;
        transition: All 0.4s ease-in-out;
    }
    
    .quitBox{
        transform-origin: left bottom;
        transition: All 0.4s ease-in-out;
        background:url(<c:url value='/images/quitBox.png'/>) bottom no-repeat;
        width:230px;
        height:130px;
        float:right;
        margin: -45px -385px 0 0;
        z-index:11;
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
        <div class="prizeCountBox">
            <h1 style="font-size:2.7em;">剩余名额</h1>
            <div class="prizeCount"></div>
        </div>
    </div>
    <div class="popup" style="display:none;">
        <div class="notice">
            <div class="noticeBox">
                <div class="arrow" data-angle="0"></div>
            </div>
            <div class="quitBox">
            abc
            </div>
        </div>
    </div>
    <input id="typeHidden" type="hidden" value="${prizeCode}"/>
    <script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/plugins/easing.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/web/lottery.js'/>" type="text/javascript"></script>
</body>
</html>