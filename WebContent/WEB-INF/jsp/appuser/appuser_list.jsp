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
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
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
	function findSub(){
		$("#form1").submit();
	}
	
</script>
<body>
    <form action="appuser/appUserList.do" method="post" id="form0">
    </form>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"border="0" alt="">
			</span>
			&nbsp;用户管理&nbsp; 
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
			</span>&nbsp;APP用户列表&nbsp;
		</div>
	</div>
	<form action="appUserList.do" method="post" id="form1">
	<c:if test="${sessionUser.ROLE_ID=='1'}">
	<div id="tips" >
		<div id="buttonGroup">
		    &nbsp;号码查询:
		    <input type="text" id="phone" name="phone" value="${phone }" onkeyup="value=value.replace(/[^\d]/g,'')">&nbsp;
			<a href="javascript:void(0)" onclick="findSub();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">查询</button>
		    </a>
		</div>
	</div>
	</c:if>
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>序号</td>
				<td>用户图片</td>
				<td>用户账号</td>
				<td>用户名称</td>
				<td>性别</td>
				<td>生日</td>
				<td>地区</td>
				<td>上次登入时间</td>
				<td>用户余额</td>
				<td>用户积分</td>
				<!--  
				<td>用户等级</td>-->
				<td>注册时间</td>
				<!--  
				<td>操作</td>-->
			</tr>
			<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="app" varStatus="vs">
					<tr>
					    <td>${vs.index + 1 }</td>
						<td><img alt="" src="<%=basePath%>${app.user_img }" class="img"></td>
						<td>${app.user_code }</td>
						<td>${app.user_name }</td>
						<td>
							<c:choose>
							    <c:when test="${app.user_sex ==1 }">男</c:when>
							    <c:when test="${app.user_sex ==0 }">女</c:when>
							</c:choose>
					    </td>
					    <td>${app.user_birthday}</td>
					    <td>${app.user_addres}</td>
						<td>${app.user_last_logindate }</td>
						<td>${app.user_money }</td>
						<td>${app.user_integral }</td>
						<!--  
						<td>
						    <c:choose>
						        <c:when test="${app.user_grade_integral>=0 && app.user_grade_integral<200 }">普通用户</c:when>
						        <c:when test="${app.user_grade_integral>=200 && app.user_grade_integral<2400 }">1级普通会员</c:when>
						        <c:when test="${app.user_grade_integral>=2400 && app.user_grade_integral<7200 }">2级普通会员</c:when>
						        <c:when test="${app.user_grade_integral>=7200 && app.user_grade_integral<18000 }">3级普通会员</c:when>
						        <c:when test="${app.user_grade_integral>=18000 && app.user_grade_integral<28800 }">4级普通会员</c:when>
						        <c:when test="${app.user_grade_integral>=28800 && app.user_grade_integral<58000 }">5级普通会员</c:when>
						        <c:when test="${app.user_grade_integral>=58000 && app.user_grade_integral<1000000 }">6级普通会员</c:when>
						    </c:choose>
						</td>-->
						<td>${app.user_createdate }</td>
						<!-- <td></td>-->
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			    <tr class="main_info">
					<td colspan="12" class="center">没有相关数据</td>
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