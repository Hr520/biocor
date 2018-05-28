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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/default.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/common2.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/main.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<style type="text/css">
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
#preview{
	width:100px;  
	height:60px;
	border:0 dashed #000;
	}
.img1{
	width:100px;  
	height:60px;
	padding: 0 20px;
}
.oneline{
	width:150px;
	display:inline;
}
.imagenamelength{
	width:15%;
	overflow:hidden;
}
.timg{ 
	width:18px;  
	height:18px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#sc_beggrade").val("${pd.sc_beggrade}");
	$("#sc_endgrade").val("${pd.sc_endgrade}");
});
function save(){
	var sc_speedc_name = $("#sc_speedc_name").val();
	var sc_speedc_integral = $("#sc_speedc_integral").val();
	var sc_speedc_rate = $("#sc_speedc_rate").val();
	var sc_beggrade = $("#sc_beggrade").val();
	var sc_endgrade = $("#sc_endgrade").val();
	if(sc_speedc_integral==""){
		alert("兑换积分不能为空");
		return;
	}
	if(sc_speedc_rate==""){
		alert("加速点不能为空");
		return;
	}
	if(sc_beggrade==""){
		alert("开始等级不能为空");
		return;
	}
	if(sc_endgrade==""){
		alert("结束等级不能为空");
		return;
	}
	$("#form").submit();
}
function grade(){
	var begin = parseInt($("#sc_beggrade").val());
	var end = parseInt($("#sc_endgrade").val());
	if(end<begin){
		alert("结束等级不能小于开始等级");
		$("#sc_endgrade").val("");
	}
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;加速卡管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;${title }&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="${action_url }"  >
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th style="width: 10%"><i class="require-red"></i>加速卡名称</th>
							<td>
								<input type="hidden" id="scid" name="scid" value="${pd.scid }">
								<c:if test="${action_url=='editSpeedCard' }">
								<input name="sc_speedc_name" type="text" id="sc_speedc_name" readonly="readonly"
							    value="${pd.sc_speedc_name }">
								</c:if>
								<c:if test="${action_url!='editSpeedCard' }">
							    <input name="sc_speedc_name" type="text" id="sc_speedc_name"
							    value="${pd.sc_speedc_name }">
							    </c:if>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>兑换积分</th>
							<td>
							    <input name="sc_speedc_integral" type="text" id="sc_speedc_integral"
							    value="${pd.sc_speedc_integral }" onkeyup="value=value.replace(/[^\d]/g,'')">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>加速点</th>
							<td>
							    <input name="sc_speedc_rate" type="text" id="sc_speedc_rate" maxlength="3"
							    value="${pd.sc_speedc_rate }" onkeyup="value=value.replace(/[^\d]/g,'')">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>开始等级</th>
							<td>
								<select name="sc_beggrade" id="sc_beggrade">
									<option value="">选择开始等级</option>
									<option value="0">v0</option>
									<option value="1">v1</option>
									<option value="2">v2</option>
									<option value="3">v3</option>
									<option value="4">v4</option>
									<option value="5">v5</option>
									<option value="6">v6</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>结束等级</th>
							<td>
								<select name="sc_endgrade" id="sc_endgrade" onchange="grade()">
									<option value="">选择结束等级</option>
									<option value="0">v0</option>
									<option value="1">v1</option>
									<option value="2">v2</option>
									<option value="3">v3</option>
									<option value="4">v4</option>
									<option value="5">v5</option>
									<option value="6">v6</option>
								</select>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
							<input class="btn btn-primary btn6 mr10" value="确定"
								type="button" onclick="save()"> 
						    <input class="btn btn6"
								onclick="history.go(-1)" value="返回" type="button">
						  </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>