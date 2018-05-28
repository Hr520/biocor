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
		var login_name = $("#login_name").val();
		if( login_name == ""){
			alert("登录名不可为空");
			return false;
		}
		var password = $("#password").val();
		if( password == ""){
			alert("密码不可为空");
			return false;
		}
		var sex = $("#sex").val();
		if( sex == ""){
			alert("性别不能为空");
			return false;
		}
		var phone = $("#phone").val();
		var reg = /^[01][234578][0-9]{9}$/;
		if( phone == ""){
			alert("手机号码不能为空");
			return false;
		}else if (!reg.test(phone)) {
			alert("请输入正确的手机号码");
			return false;
		}
		var age = $("#age").val();
		if( age == ""){
			alert("年龄不可为空");
			return false;
		}else  if(age>150){
			alert("请填写小于100的数字")
			return false;
		}
		
		$("#form").submit();
	}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""> </span> &nbsp;店员管理&nbsp; <span><img
				src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""> </span> &nbsp;新增店员&nbsp;
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="addShopUser.do">
				<table class="insert-tab" width="100%">
					<tbody>
					    <tr>
							<th><i class="require-red">*</i>用户登录名称</th>
							<td><input  type="text" name="login_name" id="login_name" value=""/>
							<input type="hidden" name="shop_id" id="shop_id" value="${pd.shop_id}">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>用户登录密码</th>
							<td><input type="text"  name="password" id="password" value=""/>
						</tr>
						<tr>
						<th><i class="require-red">*</i>性别</th>
							<td>
							<select name="sex"  id="sex" onmouseover="" class="otextcss"> 
                            <option value="">请选择</option> 
                            <option value="1">男</option> 
                           <option value="2">女</option> 
							</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>手机号码</th>
							<td><input type="text" name="phone" id="phone" value=""/>
						</tr>
						<tr>
							<th><i class="require-red">*</i>年龄</th>
							<td><input type="text"  name="age" id="age" size="14" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
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