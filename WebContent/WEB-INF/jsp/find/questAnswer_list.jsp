<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
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
	function add(qid){
		location.href="befAddAnswer.do?qid="+qid;
	}
	function del(qaid,qid){
		if(confirm("确定该操作吗？")){
			location.href="questAnswerDel.do?qaid="+qaid+"&qid="+qid;
		}
	}
</script>
<body>
    <form action="finds/questList.do" method="post" id="form0">
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"border="0" alt="">
			</span>
			&nbsp;美食测试&nbsp; 
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
			</span>&nbsp;测试题列表&nbsp;
		</div>
	</div>
	<c:if test="${sessionUser.ROLE_ID=='1'}">
		<div id="tips" >
			<div id="buttonGroup">
				<a href="javascript:void(0)" onclick="add('${qid }')">
				  <button type="button" style="width: 60px; height: 30px; background: #0283c5; 
				      color: #fff; border: 1px solid #ccc; border-radius: 4px;">新增</button>
				</a>
			</div>
		</div>
	</c:if>
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td width="3%">选项</td>
				<td width="10%">内容</td>
				<td width="10%">创建日期</td>
				<td width="17%">备注</td>
				<td width="10%">操作</td>
			</tr>
			<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="list" varStatus="vs">
					<tr>
					    <td>${list.qa_no }</td>
						<td>${list.qa_content }</td>
						<td>${list.qa_createdate }</td>
						<td>${list.qa_remark }</td>
						<td>
							<a href="javascript:void;" onclick="del('${list.qaid}','${qid }')">删除</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			    <tr class="main_info">
					<td colspan="5" class="center">没有相关数据</td>
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