<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.tips.js"></script>
<style type="text/css">
html { overflow: auto; }
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
.img 
	{  
		 width:40px;  
		 height:40px;  
	}
</style>
<script type="text/javascript">
function findSub(){
	$("#form1").submit();
}
function edit(gid){
	location.href="goodEdit.do?gid="+gid;
}
function del(gid,state){
	if(confirm("确定该操作吗？")){
	    location.href="goodDel.do?gid="+gid+"&state="+state;
	}
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" 
			    border="0" alt="">
			</span>
		    &nbsp;商品管理&nbsp; 
		    <span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
		        border="0" alt="">
		    </span>
		    &nbsp;商品列表&nbsp;
		</div>
	</div>
	<form action="good/goodList.do" method="post"id="form0"></form>
    <form action="goodList.do" method="post" id="form1">
	<div id="tips">
		<div id="buttonGroup">
		    <c:if test="${sessionUser.ROLE_ID!='1'}">
			<a href="befAdd.do">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">新增</button>
			</a> 
			</c:if>
			<c:if test="${sessionUser.ROLE_ID=='1'}">
			&nbsp;商户名称:&nbsp;
			<input type="text" id="shopName" name="shopName" value="${shopName}">
			</c:if>
			&nbsp;商品名称:&nbsp;
			<input type="text" id="goodName" name="goodName" value="${goodName}">
			&nbsp;商品状态:&nbsp;
			<select id="goods_ISshelves" name="goods_ISshelves">
			<option  value="">--请选择--</option>
			<option  value="1">上架</option>
            <option  value="3">售罄</option>
            <option  value="2">禁用</option>
			</select>
			&nbsp;商品类型:&nbsp;
			<select id="goods_type" name="goods_type">
			  <option  value="">--请选择--</option>
			  <c:forEach items="${goodtype}" var="type">
		      <option  value="${type.ftid}">${type.ft_foodtype_name}</option>
		     </c:forEach>
			</select>
			<a href="javascript:void(0)" onclick="findSub();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">查询</button>
			</a> 
		</div>
	</div>

	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>序号</td>
				<td>店铺名称</td>
				<td>商品名称</td>
				<td>商品图片</td>
				<td>商品价格</td>
				<td>积分价</td> 
				<td>单位</td>
				<td>商品类型</td>
				<td>是否推荐</td>
				<td>商品口味</td>
				<td>状态</td>
				<td>上架时间</td>
				<td>下架时间</td>
				<td>添加时间</td>
				<td>操作</td>
			</tr>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="good" varStatus="vs">
						<tr class="list">
							<td class='center' style="width: 30px;">${vs.index+1}</td>
							<td>${good.shop_name }</td>
							<td>${good.goods_name }</td>
							<td><img alt="" src="<%=basePath%>${fn:substring(good.goods_images,0,fn:indexOf(good.goods_images,',')) }" class="img"> </td>
							<td>${good.goods_moeny }</td>
							 
							<td>${good.goods_dis_money }</td>
							<td>${good.goods_remark }</td>
							<td>
							    <c:forEach items="${goodtype }" var="type">
							        <c:if test="${type.ftid == good.goods_gtid }">${type.ft_foodtype_name }</c:if>
							    </c:forEach>
							</td>
							<td>
							    <c:choose>
							        <c:when test="${good.goods_ISrecommend == 0 }">否</c:when>
							        <c:when test="${good.goods_ISrecommend == 1 }">是</c:when>
							    </c:choose>
							</td>
							<td>
							    <c:choose>
							        <c:when test="${good.goods_taste == 0 }">无辣</c:when>
							        <c:when test="${good.goods_taste == 1 }">微辣</c:when>
							        <c:when test="${good.goods_taste == 2 }">中辣</c:when>
							        <c:when test="${good.goods_taste == 3 }">特辣</c:when>
							    </c:choose>
							</td>
							<td>
							    <c:choose>
							        <c:when test="${good.goods_ISshelves == 0 }">申请中</c:when>
							        <c:when test="${good.goods_ISshelves == 1 }">上架</c:when>
							        <c:when test="${good.goods_ISshelves == 2 }">禁用</c:when>
							        <c:when test="${good.goods_ISshelves == 3 }">售罄</c:when>
							    </c:choose>
							</td>
							<td>${good.goods_up_shelves }</td>
							<td>${good.goods_dw_shelves }</td>
							<td>${good.goods_createdate }</td>
							
							<c:if test="${sessionUser.ROLE_ID!='1'}">
							<td>
							
					         	<c:choose>
					     	    <c:when test="${good.goods_ISshelves ==1 }">
					     	      <a href="javascript:void" onclick="del('${good.gid }','3')">售罄</a>
					     	      &nbsp;|&nbsp;
					     	      <a href="javascript:void" onclick="del('${good.gid }','2')">禁用</a>
					     	    </c:when>
					     	    <c:when test="${good.goods_ISshelves ==0 }">
					     	        <a href="javascript:void" style="color:#ccc;">禁用</a>
					     	    </c:when> 
					     	    <c:when test="${good.goods_ISshelves ==2 }">
					     	        <a href="javascript:void" onclick="edit('${good.gid }')">修改</a>
					     	        &nbsp;|&nbsp;
					     	        <a href="javascript:void" onclick="del('${good.gid }','0')">上架</a>
					     	    </c:when>
					     	     <c:when test="${good.goods_ISshelves ==3 }">
					     	        <a href="javascript:void" onclick="edit('${good.gid }')">修改</a>
					     	        &nbsp;|&nbsp;
					     	        <a href="javascript:void" onclick="del('${good.gid }','0')">上架</a>
					     	    </c:when>
					     	    </c:choose>
					     	
							</td>
							</c:if>
							<c:if test="${sessionUser.ROLE_ID=='1'}">
							    <td>
							    <c:choose>
							    <c:when test="${good.goods_ISshelves ==2 }">
					     	        <a href="javascript:void" style="color:#ccc;">禁用</a>
					     	    </c:when>
					     	    <c:when test="${good.goods_ISshelves !=2 }">
					     	        <a href="javascript:void" onclick="del('${good.gid }','2')">禁用</a>
					     	    </c:when>
					     	    </c:choose>
							    </td>
							</c:if>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td colspan="15" class="center">没有相关数据</td>
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