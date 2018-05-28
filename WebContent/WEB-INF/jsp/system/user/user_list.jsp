<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/default.css" />
<link href="<%=basePath%>/static/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/static/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/ace-skins.min.css" />
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<!-- 日期框 -->
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery.tips.js"></script>
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
</style>
<script type="text/javascript">
	var qx = '${sessionUser.ROLE_ID}';
	function editDesigner(USER_ID){
		location.href="goAddDesigner?msg=edit&USER_ID="+USER_ID;
	}
	
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;管理员管理<span>&nbsp; <span><img
					src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;管理员列表<span>&nbsp;
			
		</div>
	</div>
	<c:if test="${sessionUser.ROLE_ID=='1'}">
	<div id="tips" >
		<div id="buttonGroup">
			<a href="goAddDesigner?msg=add"><button type="button" 
				style="width: 60px; height: 30px; background: #0283c5; color: #fff; border: 1px solid #ccc; border-radius: 4px;">
				新增</button></a>
		</div>
	</div>
	</c:if>
   <form action="user/listUsers.do" method="post" name="userForm" id="userForm">
	<div id="mainContainer">
		<table class="default" width="100%">
			<col width="30px">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<tr class="title">
				<td>序号</td>
				<td>登录名</td>
				<td>姓名</td>
				<td>电话</td>
				<td>角色</td>
				<td>操作</td>
			</tr>
			<c:if test="${sessionUser.ROLE_ID=='1'}">
				<c:choose>
					<c:when test="${not empty userList}">
						<c:forEach items="${userList}" var="user" varStatus="vs">
							<tr class="list">
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td><a>${user.USERNAME }</a></td>
								<td>${user.NAME }</td>
								<td>${user.PHONE }</td>
								<td>${user.ROLE_NAME }</td>
								 
								<c:if test="${user.ROLE_NAME =='系统管理员'}">
									<td style="width: 60px;"><a href="javascript:void" onclick="editDesigner('${user.USER_ID}')">修改密码</a></td>
								</c:if>
								<c:if test="${user.ROLE_NAME !='系统管理员'}">
									<td style="width: 60px;"></td>
								</c:if>
								
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			</c:if>
			<c:if test="${sessionUser.ROLE_ID!='1'}">
				<tbody>

				<!-- 开始循环 -->
				<c:choose>
					<c:when test="${not empty userList}">
						<c:forEach items="${userList}" var="user" varStatus="vs">
							<tr class="list">
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td><a>${user.USERNAME }</a></td>
								<td>${user.NAME }</td>
								<td>${user.PHONE }</td>
								<td>${user.ROLE_NAME }</td>
								<td style="width: 60px;"><a href="javascript:void" onclick="editDesigner('${user.USER_ID}')">修改密码</a></td>
								
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			</c:if>
			


		</table>
		<%@include file="../../page.jsp"%>
	</div>
	</form>
</body>
</html>