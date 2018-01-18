<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ include file="../shared/taglib.jsp"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>SVA APP demo</title>
		<link href="<c:url value='/plugins/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css"/>
		<style>
html,body{
    margin:0;
    padding:0;
    overflow:hidden;
}
.main_bg{
    background:url(<c:url value='/images/welcomBg.png'/>) top center no-repeat;
    height:1080px;
}
.leftPart{
    float:left;
    width:1150px;
    height:1080px;
    overflow:hidden;
}
.prizeShow{
    width:1053px;
    height:434px;
    margin:600px 0 0 90px;
    padding:10px 40px;
    background:url(<c:url value='/images/prizeBg.png'/>) top center no-repeat;
}
.prizeBox{
    float:left;
    width:240px;
    height:275px;
}
.prizeBox-1{
    background:url(<c:url value='/images/prize1.png'/>) top center no-repeat;
}
.prizeBox-2{
    background:url(<c:url value='/images/prize2.png'/>) top center no-repeat;
}
.prizeBox-3{
    background:url(<c:url value='/images/prize3.png'/>) top center no-repeat;
}
.rightPart{
    float:left;
    width:830px;
}
.caret-down{
     float:right;
     background:url(<c:url value='/images/angleDown.png'/>) top center no-repeat;
     width:25px;
     height:25px;
     margin: 35px 35px 0 0;
}
.cs-placeholder{
    width:600px;
    height:95px;
    border-radius:10px;
    border:10px solid #b11633;
    cursor:pointer;
    background: linear-gradient(rgb(255,253,192), rgb(244,181,64));
}
.cs-placeholder:before{
    content:"奖品：";
    font-weight:bold;
    color:#222;
}
.cs-skin-border .cs-options {
  width:600px;
  height:95px;
  opacity: 0;
  transition: opacity 1s, visibility 0s 0.2s;
  visibility: hidden;
  margin-top: -32px;
  border-left:10px solid #b11633;
  border-right:10px solid #b11633;
  border-bottom:10px solid #b11633;
  border-radius:10px;
}
 
.cs-options.active {
  opacity: 1;
  visibility: visible;
}
		</style>
	</head>
	<body>
	   <div class="main_bg">
         <div class="leftPart">
            <div class="prizeShow">
                <div class="prizeBox prizeBox-1"></div>
                <div class="prizeBox prizeBox-2"></div>
                <div class="prizeBox prizeBox-3"></div>
            </div>
         </div>
         <div class="rightPart"">
            <div></div>
            <div></div>
            <div>
                <div class="cs-skin-border">
                    <div class="cs-placeholder" id="prize" data-code="">请选择
                        <div class="caret-down"></div>
                    </div>
                    <div class="cs-options">
                        <ul>
                            <li data-option data-value="1" class="cs-selected"><span>Option 1</span></li>
                            <li data-option data-value="2"><span>Option 2</span></li>
                            <li data-option data-value="3"><span>Option 3</span></li>
                        </ul>
                    </div>
                </div>
                <div></div>
            </div>
            <div></div>
         </div>
	   </div>
	<script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/web/main.js'/>" type="text/javascript"></script>
	</body>
</html>
