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
<script type="text/javascript"
	src="<%=basePath%>res/My97DatePicker/WdatePicker.js"></script>
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
</script>
<script type="text/javascript">
function exportexcel(){
	var strat_time=$("#strat_time").val();
	var end_time=$("#end_time").val();
	location.href="shop_goodExcel.do?beginTime="+strat_time+"&"+"endTime="+end_time
}
	function findSub(){
		var strat_time=$("#strat_time").val();
		var end_time=$("#end_time").val();
		if (strat_time == "") {
			alert("请输入开始时间");
			return false;
		}
		if (end_time == "") {
			alert("请输入结束时间");
			return false;
		}
		location.href="getShopGoodsList.do?beginTime="+strat_time+"&"+"endTime="+end_time
	}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""> </span> &nbsp;财务管理&nbsp; <span><img
				src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""> </span> &nbsp;店铺菜品销量统计&nbsp;
		</div>
	</div>
	<form action="financial/getShopGoodsList.do" method="post" id="form0">
	
	<div id="buttonGroup" style="margin-top: 10px;">
		    	&nbsp;开始时间:
		    <input type="text" id="strat_time" readonly="readonly" value="${beginTime}"
					name="beginTime" style="width: 100px;" class="Wdate" 
					onfocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'end_time\')}'})" />
		    &nbsp;结束时间:
		    <input type="text" id="end_time" readonly="readonly" value="${endTime}"
					name="endTime" style="width: 100px;" class="Wdate"
					onfocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'strat_time\')}'})" />
		    &nbsp;
			<a href="javascript:void(0)" onclick="findSub();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">查询</button>
		    </a>
		    <a href="javascript:void(0)" onclick="exportexcel();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">导出</button>
		    </a>
		    
		    
		</div>
	
	

	</form>
	<form action="getShopGoodsList.do" method="post" id="form1">
		<div id="mainContainer">
			<table class="default" width="100%">
				<tr class="title">
					<td>序号</td>
					<td>菜品名称</td>
					<td>菜品类型</td>
					<td>菜品图片</td>
					<td>菜品价格</td>
					<td>菜品积分价</td>
					<td>销售数量</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach items="${list}" var="list" varStatus="vs">
							<tr class="list">
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${list.goods_name}</td>
								<td>${list.ft_foodtype_name}</td>
							<td><img alt="" src="<%=basePath%>${fn:substring(list.goods_images,0,fn:indexOf(list.goods_images,',')) }" class="img"> </td>
								<td>${list.goods_moeny}</td>
								<td>${list.goods_dis_money}</td>
							<td>
							<c:choose>
							<c:when test="${list.count!=null&&list.count!=''}">
							${list.count}
							</c:when>
							<c:otherwise>
							0
							</c:otherwise>
							</c:choose>
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
			<%-- <%@include file="../page.jsp"%> --%>
		</div>
	</form>
</body>
</html>