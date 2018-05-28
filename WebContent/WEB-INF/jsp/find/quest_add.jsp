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
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/common2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/main.css" type="text/css" />
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
	width:120px;  
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
function save(){
	var q_qNO = $("#q_qNO").val();
	var q_qname = $("#q_qname").val();
	if( q_qNO== null|| q_qNO==""){
		alert("请输入题号!");
		return false;
	}
	if( q_qname== null|| q_qname==""){
		alert("请输入题目!");
		return false;
	}
	$("#form").submit();
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			   <img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;美食资讯&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
					border="0" alt="">
			</span>
			&nbsp;新增问题&nbsp; 
		</div>
	</div>
	
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="questAdd.do">
			    <input type="hidden" name="q_answer">
				<table class="insert-tab" width="100%">
					<tbody>
					    <tr>
							<th><i class="require-red">*</i>题号</th>
							<td><input class="common-text required" id="q_qNO"
								name="q_qNO" size="50" value="" type="text" 
								onkeyup="value=value.replace(/[^\d.]/g,'')">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>类型</th>
							<td>
								<select id="q_type" name="q_type">
									<option value="0">单选</option>
									<option value="1">多选</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>题目</th>
							<td>
							    <textarea rows="3" cols="64" name="q_qname" id="q_qname"></textarea>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>备注</th>
							<td>
							    <textarea rows="3" cols="64" name="q_remark"></textarea>
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