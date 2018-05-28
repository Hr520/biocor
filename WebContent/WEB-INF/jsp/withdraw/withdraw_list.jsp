<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 
	          request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
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
</style>
<script type="text/javascript">
	function findSub(){
		$("#form1").submit();
	}
	function down(){
		var type = $("#type").val();
		location.href = "down.do?type="+type;
	}
	function changeState(orderNo){
		location.href = "befChange.do?orderNo="+orderNo;
	}
</script>
<body>
    <form action="withdraw/withdrawList.do" method="post" id="form0" style="">
    </form>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"border="0" alt="">
			</span>
			&nbsp;提现管理&nbsp; 
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
			</span>&nbsp;用户提现列表&nbsp;
		</div>
	</div>
	<form action="withdrawList.do" method="post" id="form1">
	<div id="tips">
	    <div id="buttonGroup">
		    &nbsp;类型查询:
		    <select id="type" name="type">
		        <option value="0">提现中</option>
		        <option value="1">成功</option>
		        <option value="2">失败</option>
		    </select>
		    &nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="findSub();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">查询</button>
		    </a>
		    &nbsp;
		    <a href="javascript:void(0)" onclick="down();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">导出</button>
			</a> 
		</div>

	</div>
	
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>序号</td>
				<td>提现单号</td>
				<td>用户昵称</td>
				<td>提现类型</td>
				<td>提现金额</td>
				<td>提现类型</td>
				<td>提现手续费</td>
				<td>状态</td>
				<td>时间</td>
				<td>支付宝账号</td>
				<td>备注</td>
				<td>操作</td>
			</tr>
			<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="withdraw" varStatus="vs">
					<tr>
					    <td>${vs.index + 1 }</td>
						<td>${withdraw.uw_orderNO }</td>
						<td>${withdraw.user_name }</td>
						<td>提现</td>
						<td>${withdraw.uw_money }</td>
						<td>手续费</td>
						<td>${withdraw.cuw_money }</td>
						<td>
							<c:choose>
							    <c:when test="${withdraw.uw_state ==0 }">提现中</c:when>
							    <c:when test="${withdraw.uw_state ==1 }">失败</c:when>
							    <c:when test="${withdraw.uw_state ==2 }">成功</c:when>
							</c:choose>
					    </td>
					    <td>${withdraw.uw_createdate }</td>
					    <td>${withdraw.ua_user_account }</td>
					    <td>${fn:substring(withdraw.uw_remark,0,10) }</td>
						<td>
						    <c:choose>
						        <c:when test="${withdraw.uw_state ==2 || withdraw.uw_state ==1 }">
						            <span>完成</span>
						        </c:when>
							    <c:when test="${withdraw.uw_state ==0 }">
							        <a href="javascript:void" onclick="changeState('${withdraw.uw_orderNO }')">编辑</a>
							    </c:when>
						    </c:choose>
						    
						</td>
						
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			    <tr class="main_info">
					<td colspan="11" class="center">没有相关数据</td>
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