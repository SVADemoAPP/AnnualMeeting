<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../shared/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>集卡记录</title>
<link href="<c:url value='/plugins/data-tables/media/css/demo_table.css'/>" rel="stylesheet" type="text/css" />
<style>
.table{
    width:100%;
}
/* #cubeTransition {
  position: relative;
  width: 100%;
  height: 100%;
  -webkit-perspective: 1200px;
  -moz-perspective: 1200px;
  perspective: 1200px;
}
 
#cubeTransition>div {
  min-height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  backface-visibility: hidden;
  transform: translate3d(0, 0, 0);
  transform-style: preserve-3d;
  font-size: 5em;
  color: #fff;
  display: none;
} */

#cubeTransition>div {  
	backface-visibility: hidden;
	display: none;
}
ul li
{
    float:left; /* 向左漂移，将竖排变为横排 */
}

</style>
</head>
<body style="background-color:#fff6d9;">
	<div class="tab-head">
           <h2 class="selected">1</h2>
           <h2>2</h2>
     </div>
     <div class="tab-content">
		<div id="c1" class="show" >
    		<div style="margin:10px 10px;height:100px;text-align:center;font-weight:bold;font-size:30px;">奖品领取清单</div>
	        <table style="text-align:center;margin:20px 20px;" border="1" id="prizeTable" class="table">
	            <thead>
	                <tr>
	                    <th></th>
	                    <th>姓名</th>
	                    <th>工号</th>
	                    <th>奖品级别</th>
	                    <th>是否领取</th>
	                    <th>操作</th>
	                </tr>
	            </thead>
	        </table>
    	</div>
	   <div id="c2">
	    	<div style="margin:10px 10px;height:100px;text-align:center;font-weight:bold;font-size:30px;">集齐福卡人员名单</div>
	        <table style="text-align:center" border="1" id="cardTtable" class="table">
	            <thead>
	                <tr>
	                    <th></th>
	                    <th>姓名</th>
	                    <th>工号</th>
	                    <th>"燃"卡数量</th>
	                    <th>"情"卡数量</th>
	                    <th>"小"卡数量</th>
	                    <th>"站"卡数量</th>
	                    <th>是否合成</th>
	                </tr>
	            </thead>
	        </table>
	    </div>
    </div>
<script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/cubeTransition/js/mousewheel.js'/>"></script>
<script src="<c:url value='/plugins/cubeTransition/js/jquery.touchSwipe.js'/>"></script>
<script src="<c:url value='/plugins/cubeTransition/js/cubeTransition.js'/>"></script> 
<script src="<c:url value='/plugins/data-tables/media/js/jquery.dataTables.js'/>"type="text/javascript"></script>
<script src="<c:url value='/js/util.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/web/collectRecord.js'/>" type="text/javascript">
</script>
</body>
</html>