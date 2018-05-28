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
	function findSub(){
		$("#form1").submit();
	}
	//编辑
	function edit(sid){
		location.href="shopEdit.do?sid="+sid;
	}
	//禁用
	function del(sid,state){
		if(confirm("确定该操作吗？")){
		    location.href="shopDel.do?sid="+sid+"&state="+state;
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
			&nbsp;店铺列表&nbsp;
		</div>
	</div>
	<form action="shop/shopList.do" method="post" id="form0">
    </form>
	<form action="shopList.do" method="post" id="form1">
	<c:if test="${sessionUser.ROLE_ID=='1'}">
	<div id="tips" >
		<div id="buttonGroup">
		    &nbsp;店铺查询:
		    <input type="text" id="shopName" name="shopName" value="${shopName }">&nbsp;
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
				<td>商铺图标</td>
				<td>商铺名称</td>
				<td>商铺类型</td>
				<td>店铺等级</td>
				<td>人均消费</td>
				<td>商铺商圈</td>
				<td>营业时间</td>
				<td>商铺地址</td>
				<td>联系电话</td>
				<td>是否抽奖</td>
				<td>是否推荐</td>
				<td>是否启用</td>
				<td>所属用户</td>
				<td>创建时间</td>
				<td>终端号</td>
				<td>店铺二维码</td>
				<c:if test="${sessionUser.ROLE_ID=='1'}">
				<td>操作</td>
				</c:if>
			</tr>
			<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="shop" varStatus="vs">
					<tr>
					    <td>${vs.index + 1 }</td>
						<td><img alt="" src="<%=basePath%>${fn:substring(shop.shop_images,0,fn:indexOf(shop.shop_images,',')) }" class="img"></td>
						<td>${shop.shop_name }</td>
						<td>
						    <c:forEach items="${typelist }" var="ty">
						        <c:if test="${ty.stid == shop.shop_type }">${ty.st_name }</c:if>
						    </c:forEach>
						</td>
						<td>${shop.shop_grade }星</td>
						<td>${shop.shop_consume }</td>
						<td>${shop.shop_street }</td>
						<td>${shop.shop_time }</td>
						<td title="${shop.shop_adders }">${fn:substring(shop.shop_adders,0,8) }</td>
						<td>${shop.shop_tel }</td>
						<td>
						    <c:choose>
							    <c:when test="${shop.shop_draw ==1 }">是</c:when>
							    <c:when test="${shop.shop_draw ==0 }">否</c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
							    <c:when test="${shop.shop_ISrecommend ==1 }">是</c:when>
							    <c:when test="${shop.shop_ISrecommend ==0 }">否</c:when>
							</c:choose>
					    </td>
						<td>
						    <c:choose>
							    <c:when test="${shop.shop_ISshelves ==1 }">启用</c:when>
							    <c:when test="${shop.shop_ISshelves ==0 }">禁用</c:when>
							</c:choose>
						</td>
						<td>${shop.USERNAME }</td>
						<td>${shop.shop_createdate }</td>
						<td>${shop.machine_code }</td>
						<td><img alt="" src="<%=basePath%>${shop.shop_code }" class="img"></td>
						
						<c:if test="${sessionUser.ROLE_ID=='1'}">
						<td>
					     	<a href="javascript:void" onclick="edit('${shop.sid }')">修改</a>
					     	&nbsp;|&nbsp;
					     	<c:choose>
					     	    <c:when test="${shop.shop_ISshelves ==1 }">
					     	        <a href="javascript:void" onclick="del('${shop.sid }','0')">禁用</a>
					     	    </c:when>
					     	    <c:when test="${shop.shop_ISshelves ==0 }">
					     	        <a href="javascript:void" onclick="del('${shop.sid }','1')">启用</a>
					     	    </c:when>
					     	</c:choose>
						</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			    <tr class="main_info">
					<td colspan="16" class="center">没有相关数据</td>
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