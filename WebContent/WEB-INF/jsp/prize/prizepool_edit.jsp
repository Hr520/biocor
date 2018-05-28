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
function save(){
	var min_money = $("#min_money").val();
	var distributable_min = $("#distributable_min").val();
	var num = $("#num").val();
	var rate = $("#rate").val();
	if( min_money== null|| min_money==""){
		alert("请输入最少金额!");
		return false;
	}
	if( distributable_min== null|| distributable_min==""){
		alert("请输入最小支配金额!");
		return false;
	}
	if( num== null|| num==""){
		alert("请输入到账人数!");
		return false;
	}
	if( rate== null|| rate==""){
		alert("请输入增长率!");
		return false;
	}
	$("#form").submit();
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;奖品管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;编辑奖金池&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="prizePoolUpdate.do">
			    <input type="hidden" name="bpid" value="${pd.bpid }">
				<table class="insert-tab" width="100%">
					<tbody>
					    <tr>
							<th><i class="require-red">*</i>最少金额</th>
							<td>
							   <input class="common-text required" id="min_money"
							    	name="min_money" size="50" type="text" value=${pd.bp_min_money }>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>最小支配金额</th>
							<td>
							   <input class="common-text required" id="distributable_min"
							    	name="distributable_min" size="50" type="text" value="${pd.bp_distributable_min }">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>到账人数</th>
							<td>
							   <input class="common-text required" id="num"
							    	name="num" size="50" type="text" value="${pd.bp_distributable_men }" >
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>增长率</th>
							<td>
							   <input class="common-text required" id="rate"
							    	name="rate" size="30" type="text" value="${pd.bp_increasing_rate }"
							    	maxlength="2" onkeyup="this.value=this.value.replace(/\D/g, '')">
							    	<span>* (如 0.03 则是每天新增3% ) </span>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>备注</th>
							<td><textarea rows="3" cols="64" name="remark">${pd.bp_remark }</textarea>
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