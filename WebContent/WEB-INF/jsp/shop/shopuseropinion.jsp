<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css"/>
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.tips.js"></script>
<style type="text/css">
* {
	background: none repeat scroll 0 0 transparent;
	border: 0 none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	font-family: 微软雅黑;
	overflow: hidden;
}

#navi {
	width: 100%;
	word-wrap: break-word;
	border-bottom: 1px solid #065FB9;
	margin: 0;
	padding: 0;
	height: 40px;
	line-height: 40px;
	vertical-align: middle;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#naviDiv {
	font-size: 14px;
	color: #333;
	padding-left: 10px;
}

#tips {
	margin-top: 10px;
	width: 100%;
	height: 40px;
}

#buttonGroup {
	padding-left: 10px;
	float: left;
	height: 35px;
}

.button {
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 14px;
	width: 70px;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	border-color: #77D1F6;
	border-width: 1px;
	border-style: solid;
	border-radius: 6px 6px;
	-moz-box-shadow: 2px 2px 4px #282828;
	-webkit-box-shadow: 2px 2px 4px #282828;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#mainContainer {
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
	width: 98%;
	font-size: 12px;
	height: 600px;
	overflow :yes;
	overflow-y :auto
  
}
.img{  
	width:40px;  
	height:40px;  
}
</style>
<script type="text/javascript">
	//删除
	function del(id){
		if(confirm("确定该操作吗？")){
		    location.href="delShopoption.do?id="+id;
		}
	}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"border="0" alt="">
			</span>
			&nbsp;店铺管理&nbsp; 
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
			</span>
			&nbsp;意见反馈&nbsp;
		</div>
	</div>
	<form action="shop/getShopUseropinionlistPage.do" method="post" id="form0"></form>
	<form action="getShopUseropinionlistPage.do" method="post" id="form1">
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>序号</td>
				<td>商铺名称</td>
				<td>反馈内容</td>
				<td>反馈时间</td>
				<td>反馈类型</td>
				<td>操作</td>
			</tr>
			<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="shop" varStatus="vs">
					<tr>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
						<td>${shop.shop_name}</td>
						<td>${shop.content}</td>
						<td>${shop.datetime}</td>
						<td>
						<c:choose>
						<c:when test="${shop.type ==1 }">店主</c:when>
						 <c:when test="${shop.type ==2 }">店员</c:when>
						</c:choose>
						</td>
						<td><a href="javascript:void" onclick="del('${shop.id }')">删除</a></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			    <tr class="main_info">
					<td colspan="16" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
			</c:choose>
		</table>
		<%@include file="../page.jsp"%>
	</div>
	</form>
</body>
</html>