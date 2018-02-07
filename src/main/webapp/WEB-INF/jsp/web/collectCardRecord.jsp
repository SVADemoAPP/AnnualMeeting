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
</style>
</head>
<body>
    <div>
        <table id="table" class="table">
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
<script src="<c:url value='/plugins/jquery.js'/>" type="text/javascript"></script>
<script src="<c:url value='/plugins/data-tables/media/js/jquery.dataTables.js'/>"type="text/javascript"></script>
<script src="<c:url value='/js/util.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/web/collectRecord.js'/>" type="text/javascript"></script>
</body>
</html>