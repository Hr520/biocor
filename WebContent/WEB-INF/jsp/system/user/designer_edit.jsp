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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/default.css" />
<link href="<%=basePath%>/static/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>/static/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/main.css" />
<script type="text/javascript"
	src="<%=basePath%>/res/js/libs/modernizr.min.js"></script>

<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<!-- 日期框 -->
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery.tips.js"></script>
<script src="<%=basePath%>/res/js/pccs.js"  type="text/javascript"></script>

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
	overflow: yes;
	overflow-y: auto
}
</style>
<script type="text/javascript">
	var operate = "${operate}";
	$(function(){
		if(operate=='editU'){
			$("#USERNAME").attr("readonly","readonly");
		}
	});
	//提交数据
	function saveSale(){
		var username = $("#USERNAME").val();
		var oldpassword = $("#OLDPASSWORD").val();
		if($("#USERNAME").val()==""){
			alert("登录名不能为空");
			return;
		}else{
			var hasUser = true;
			if(operate=='saveU'){
				$.ajax({
					type: "POST",
					url: 'hasU',
			    	data: {USERNAME:username},
					dataType:'json',
					async: false,
					success: function(data){
						 if(data.msg!="success"){
							alert("用户名已存在");
							hasUser = false;
						 }
					}
				});
			}
			if(!hasUser){
				return;
			}
		}
		if($("#OLDPASSWORD").val()==""){
			alert("密码不能为空");
			return;
		}
		if($("#NEWPASSWORD").val()!=$("#REPASSWORD").val()){
			alert("新密码和确认密码不一致");
			return;
		}
		if($("#NEWPASSWORD").val()!=""){
			if(oldpassword == ""){
				alert("修改密码必须输入原密码");
				return;
			}
		}
		if($("#NAME").val()==""){
			alert("姓名不能为空");
			return;
		}
		if($("#PHONE").val()==""){
        	alert("手机号不能为空")
        	return;
        }else{
        	if(!(/^1[3|5|7|8|4][0-9]\d{4,8}$/.test($("#PHONE").val()))){
                alert("电话号码不正确");
                return;
            }
        }
		if(oldpassword!=null && oldpassword!=""){
			if($("#NEWPASSWORD").val()==""){
				alert("新密码不能为空");
                return;
			}
			$.ajax({
	    		type : "POST",
	    		url : "validatePassword",
	    		data : {USERNAME:username,PASSWORD:oldpassword},
	    		dataType : "json",
	    		success : function(data) {
	    			if(data.msg =='success'){
	    				$("#goodsEditForm").submit();
	    			}else{
	    				alert("原密码错误");
	    				return;
	    			}
	    			
	    		} 
	    	});
		}else{
			$("#goodsEditForm").submit();
		}
        
	}
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#USERNAME").val());
		$.ajax({
			type: "POST",
			url: 'user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if(data.result!="success"){
					alert("用户名已存在");
					return false;
				 }else{
					 return true;
				 }
			}
		});
	}

</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""></span>&nbsp;管理员管理<span>&nbsp; <span><img
					src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
					border="0" alt=""></span>&nbsp;${title}<span>&nbsp; 
		</div>
	</div>
	
	<div class="result-wrap">
	  
		<div class="result-content">
			<form action="${operate}" method="post" name="goodsEditForm"
				id="goodsEditForm" >
				<table class="insert-tab" width="100%">
					<tbody>
					<input type="hidden" id="ROLE_ID" name="ROLE_ID" value="${pd.ROLE_ID }">
<%-- 					<input type="hidden" id="NAME" name="NAME" value="${pd.NAME}">
					<input type="hidden" id="PHONE" name="PHONE" value="${pd.PHONE}"> --%>
					 
						<tr>
						<c:choose> 
							<c:when test="${operate=='editU'&& sessionUser.ROLE_ID=='1'}">
								<input type="hidden" id="ROLE_ID" name="ROLE_ID" value="1" />
							</c:when>
							<c:otherwise>
							<th><i class="require-red">*</i>选择角色</th>
							<td><select id="ROLE_ID" name="ROLE_ID">
								<c:forEach items="${roleList}" var="role">
									<option value="${role.ROLE_ID }" <c:if test="${role.ROLE_ID == pd.ROLE_ID}">selected</c:if>>${role.ROLE_NAME}</option>
								</c:forEach>
							</select></td>
							</c:otherwise>
						</c:choose>
						</tr>
						
						<tr>
							<th><i class="require-red">*</i>登录名</th>
							<td><input type="hidden" id="USER_ID" name="USER_ID" value="${pd.USER_ID}" />
							
							<input class="common-text required" id="USERNAME"
								name="USERNAME" size="50" value="${pd.USERNAME}" type="text">
							</td>
						</tr>
						<c:if test="${operate!='editU'}">
						<tr>
							<th><i class="require-red">*</i>密码</th>
							<td><input class="common-text required" id="aPASSWORD"
								name="PASSWORD" size="50"  type="password">
								</td>
						</tr>
						</c:if>
						<c:if test="${operate=='editU'}">
						<tr>
							<th><i class="require-red"></i>原密码</th>
							<td><input class="common-text required" id="OLDPASSWORD"
								name="OLDPASSWORD" size="50"  type="password">
								</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>新密码</th>
							<td><input class="common-text required" id="NEWPASSWORD"
								name="PASSWORD" size="50"  type="password"></td>
						</tr>
						<tr>
							<th><i class="require-red"></i>确认密码</th>
							<td><input class="common-text required" id="REPASSWORD"
								name="REPASSWORD" size="50"  type="password"></td>
						</tr>
						</c:if>
						 
						<tr>
							<th><i class="require-red">*</i>姓名</th>
							<td><input class="common-text required" id="NAME"
								name="NAME" size="50" value="${pd.NAME}" type="text"></td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>手机号码</th>
							<td><input class="common-text required" id="PHONE"
								name="PHONE" size="50" value="${pd.PHONE}" type="text"></td>
						</tr>
						
						<tr>
							<th></th>
							<td>
							<input class="btn btn-primary btn6 mr10" value="确定"
								type="button" onclick="saveSale()"> 
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