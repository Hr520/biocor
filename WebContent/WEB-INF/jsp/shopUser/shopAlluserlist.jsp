<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">

<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.tips.js"></script>
<style type="text/css">
html {
	overflow: auto;
}

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
	overflow: yes;
	overflow-y: auto
}

.img {
	width: 40px;
	height: 40px;
}
</style>
<script type="text/javascript" charset="UTF-8">
	//删除店员假删除
	function deleteUser(id) {
		if(confirm("确定该操作吗？")){
		    location.href = "deleteUser.do?id=" + id;
		}
	}
	function add() {
		location.href = "jupAddUSer.do";
	}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""> </span> &nbsp;店员管理&nbsp; <span><img
				src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""> </span> &nbsp;店员列表&nbsp;
		</div>
	</div>
	<form action="appuser/getShopAnduserlistPage.do" method="post" id="form0"></form>
	<form action="getShopAnduserlistPage.do" method="post" id="form1">
		<div id="tips">
			<div id="buttonGroup">
				<a href="javascript:void(0)" onclick="add();">
			       <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			          border: 1px solid #ccc; border-radius: 4px;">新增</button>
			    </a> 
			</div>
		</div>

		<div id="mainContainer">
			<table class="default" width="100%">
				<tr class="title">
					<td>序号</td>
					<td>用户名</td>
					<td>用户手机号码</td>
					<td>性别</td>
					<td>年龄</td>
					<td>状态</td>
					<td>创建时间</td>
					<td>操作</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach items="${list}" var="list" varStatus="vs">
							<tr class="list">
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${list.login_name }</td>
								<td>${list.phone }</td>
								<td>
								<c:if test="${list.sex==1}">男</c:if>
								<c:if test="${list.sex==2}">女</c:if>
								</td>
								<td>${list.age}</td>
								<td>
								<c:if test="${list.state==1}">正常</c:if>
								<c:if test="${list.state==2}">已删除</c:if>
								</td>
								<td>${list.createTime}</td>
								<td>
								<c:if test="${list.state==1}">
								<a href="javascript:void" onclick="deleteUser('${list.id}')">删除</a>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="20" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<%@include file="../page.jsp"%>
		</div>
	</form>
</body>
</html>