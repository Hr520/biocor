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
	var money = $("#money").val();
	var shop_id=$("#shop_id").val();
	var cmoney=$("#cmoney").val();
	if( money>cmoney){
		alert("请输入小于可提现总金额的数字!");
		return false;
	}
	if(isNaN(cmoney)){
		alert("请输入提现金额!");
		return false;
	}
	$.ajax({
		type : "POST",
		url : "addapplyMoney.do?money="+cmoney+"&"+"shop_id="+shop_id,
		dataType : 'json',
		cache : false,
		success : function(data) {
			if(data.state==0){
				alert("成功")
				location.href="getShopapplymoneylistPage.do";
			}else if(data.state==1){
				alert("错误您输入的金额超过您的余额")
				location.href="getShopapplymoneylistPage.do";
			}else{
				alert("错误系统繁忙")
				location.href="getShopapplymoneylistPage.do";
			}
		}
	});

}

</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;财务管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;提现申请&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form">
			    <input type="hidden" name="shop_id" id="shop_id" value="${pd.order_sid}">
			    <%--   <input type="hidden" name="cmoney" id="cmoney" value="${pd.money}"> --%>
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th><i class="require-red">*</i>提现金额</th>
							<td>
							<h4 style="color:red;">您还可以提现${pd.money}</h4>
							   <input class="common-text required" id="cmoney"
							    onkeyup='this.value=this.value.replace(/\D/gi,"")'	name="cmoney" size="50" type="text" value="请输入提现金额">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
							<input class="btn btn-primary btn6 mr10" value="确定" type="button" onclick="save()"> 
						    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
						  </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>