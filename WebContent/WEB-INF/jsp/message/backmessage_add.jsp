<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/default.css" />
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

#preview {
	width: 100px;
	height: 60px;
	border: 0 dashed #000;
}

.img1 {
	width: 100px;
	height: 60px;
	padding: 0 20px;
}

.oneline {
	width: 150px;
	display: inline;
}

.imagenamelength {
	width: 15%;
	overflow: hidden;
}

.timg {
	width: 18px;
	height: 18px;
}
</style>
<script type="text/javascript">
	function save() {
		var um_msgtitle = $("#title").val();
		if( um_msgtitle==null || um_msgtitle == ""){
			alert("标题不能为空");
			return false;
		}
		var um_msgcontent = $("#content").val();
		if(um_msgcontent == null || um_msgcontent== ""){
			alert("内容不能为空!");
			return false;
		}
		$("#form").submit();
	}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""> </span> &nbsp;系统消息管理&nbsp; <span><img
				src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""> </span> &nbsp;商户消息新增&nbsp;
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="backaddMessage.do">
				<table class="insert-tab" width="100%">
					<tbody>
					    <tr>
							<th><i class="require-red">*</i>标题</th>
							<td><textarea rows="3" cols="64" name="title" id="title"></textarea>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>消息内容</th>
							<td><textarea rows="3" cols="64" name="content" id="content"></textarea>
						</tr>
						
						<tr>
							<th></th>
							<td><input class="btn btn-primary btn6 mr10" value="确定"
								type="button" onclick="save()"> <input class="btn btn6"
								onclick="history.go(-1)" value="返回" type="button"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>