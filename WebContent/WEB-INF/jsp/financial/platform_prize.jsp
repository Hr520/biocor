<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.tips.js"></script>
<script type="text/javascript" src="<%=basePath%>res/My97DatePicker/WdatePicker.js"></script>
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
table{
table-layout:fixed;                 /* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
}
td{
word-break:keep-all;             /* 不换行 */
white-space:nowrap;            /* 不换行 */
overflow:hidden;                  /* 内容超出宽度时隐藏超出部分的内容 */
text-overflow:ellipsis;            /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}
</style>
<script type="text/javascript">
	function find(){
		$("#form1").submit();
	}
	function down(){
		var start = $("#strat_time").val();
		var end = $("#end_time").val();
		location.href="prizedown.do?start="+start+"&end="+end;
	}
</script>
<body>
    <form action="financial/findPlatFromPrize.do" method="post" id="form0"></form>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"border="0" alt="">
			</span>
			&nbsp;财务管理&nbsp; 
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
			</span>&nbsp;平台奖励统计&nbsp;
		</div>
	</div>
	<form action="findPlatFromPrize.do" method="post" id="form1">
	<div id="tips" >
		<div id="buttonGroup">
		    &nbsp;开始时间:
		    <input type="text" id="strat_time" readonly="readonly" value="${start }"
					name="start" style="width: 100px;" class="Wdate" 
					onfocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'end_time\')}'})" />
		    &nbsp;结束时间:
		    <input type="text" id="end_time" readonly="readonly" value="${end }"
					name="end" style="width: 100px;" class="Wdate"
					onfocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',startDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'strat_time\')}'})" />
		    &nbsp;
			<a href="javascript:void(0)" onclick="find()">
			<button type="button" style="width: 60px; height: 30px; background: #0283c5; 
			    color: #fff; border: 1px solid #ccc; border-radius: 4px;">查询</button>
			</a>
		    &nbsp;
		    <a href="javascript:void(0)" onclick="down()">
			<button type="button" style="width: 60px; height: 30px; background: #0283c5; 
			    color: #fff; border: 1px solid #ccc; border-radius: 4px;">导出</button>
			</a> 
		</div>
	</div>
	
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr style="background-color: #77D1F6;">
			    <td>日期</td>
				<td>排队总人数</td>
				<td>发放率</td>
				<td>发放额度</td>
				<td>发放人数</td>
			</tr>
			<c:forEach items="${list }" var="pd">
			<tr>
			   <td>${pd.prize_time }</td>
			   <td>${pd.prize_allnum }</td>
			   <td>${pd.prize_lv }</td>
			   <td>${pd.prize_jd }</td>
			   <td>${pd.prize_num }</td>
			</tr>
			</c:forEach>			
		</tbody>	
		</table>
		<%@include file="../page.jsp"%>
		
	</div>
	</form>
</body>
</html>