<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>山莓后台管理系统</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="res/js/jquery.min.js"></script>
<style type="text/css">
body{
	margin:0px;
	padding:0px;
	overflow:hidden;
}
#wrapper{
	position:absolute;
	width:100%;
	height:100%;
	min-width:1280px;
	min-height:680px;
	overflow-x:hidden;
	overflow-y:hidden;
    background-image: -moz-linear-gradient(top,#77D1F6, #2F368F);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #77D1F6),color-stop(1, #2F368F));
}
#header{
	height:100px;
	width:100%;
}
#logo{
	position:absolute;
	float:left;
	margin-left:5%;
	margin-top:30px;
	height:40px;
	width:160px;
	text-align:center;
}
#heading{
	position:relative;
	float:left;
	margin-left:20%;
	margin-top:-18px;
	height:110px;
	width:60%;
	border-radius: 18px;
	background-color:#1C75BC;
	opacity:0.6;
}
#heading #title{
	margin-top:40px;
	text-align:center;
	font-family:微软雅黑;
	font-size:24px;
	font-weight:bold;
}
#heading #subTitle{
	margin-top:10px;
	text-align:center;
	font-family:Courier New;
}
#main{
	margin-top:20px;
	height:500px;
	width:100%;
}
#mainBg{
	position:relative;
	float:left;
	margin-left:20%;
	margin-top:0px;
	height:500px;
	width:60%;
    border-radius: 18px;
    background-color:#000000;
    opacity:0.5;
}
#mainPanel{
    position:relative;
	margin:25px;
	height:450px;
    border-radius: 18px;
    background-image: -moz-linear-gradient(top,#BFEFFF, #BFEFFF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #BFEFFF),color-stop(1, #BFEFFF));
}
#mainPanel #left{
	float:left;
	border-right:2px solid #F6F6F6;
	position:relative;
	top:10%;
	height:80%;
	width:49%;
	border-right-style:groove;
}
#mainPanel #image{
	position:relative;
	height:256px;
	width:256px;
	left:15%;
	top:12%;
    background-image:url('./res/images/admin.png');
}
#mainPanel #right{
	float:left;
	position:relative;
	height:90%;
	width:49%;
	top:5%;
}
#welcome{
	margin-top:20px;
	height:60px;
	width:100%;
	vertical-align: middle;
	display: inline-block;
	line-height: 60px;
	text-align:center;
}
#welcome #welcome-text{
	font-size:32px;
	font-weight:bold;
	font-family:微软雅黑;
	text-shadow: 0 1px 1px #F6F6F6;
}
#user-name{
	height:35px;
	width:100%;
	margin-top:20px;
	vertical-align: middle;
	display: inline-block;
	line-height: 35px;
}
#user-password{
	margin-top:20px;
	height:35px;
	width:100%;
	vertical-align: middle;
	display: inline-block;
	line-height: 35px;
}
#user-checkcode{
	margin-top:20px;
	height:35px;
	width:100%;
	vertical-align: middle;
	display: inline-block;
	line-height: 35px;
}
#button-group{
	margin-top:10px;
	height:35px;
	width:100%;
	vertical-align: middle;
	display: inline-block;
	line-height: 35px;
	text-align:center;
}
#error-tip{
	margin-top:20px;
	margin-left:5%;
	height:40px;
	width:90%;
	vertical-align: middle;
	display: inline-block;
	line-height: 35px;
	text-align:center;
	border-bottom:2px solid #F6F6F6;
	border-bottom-style:groove;
}
#error-tip #tip-text{
	font-size:18px;
	font-weight:bold;
	font-family:微软雅黑;
	color:red;
}
.item{
	margin-left:20px;
	font-family:微软雅黑;
	font-size:20px;
	font-weight:bold;
	float: left;
	width:80px;
	margin-top: 3px;
	text-align: center;
	text-shadow: 0 1px 1px #F6F6F6;
}
.input{
	vertical-align: middle;
	display: inline-block;
}
#checkcode-img{
	margin-top:3px;
	height:20px;
	width:60px;
}
.form-input{
	height:20px;
}
.btn{
    border:1px solid #cccccc;
    cursor:pointer;
    margin:10px 5px;
    height:40px;
	width:80px;
    text-align:center;
    border-radius: 4px;
    border-color: #636263 #464647 #A1A3A5;
    text-shadow: 0 1px 1px #F6F6F6;
    background-image: -moz-linear-gradient(center top, #D9D9D9, #A6A6A6 49%, #A6A6A6 50%);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #D9D9D9),color-stop(1, #A6A6A6));
}
#footer{
	margin-top:20px;
	width:100%;
}
#footer #text{
	text-align:center;
	font-size:14px;
	font-family:微软雅黑;
	font-weight:bold;
}
</style>
<script type="text/javascript">
if(window !=top){  
    top.location.href=location.href;  
}  
$(document).ready(function() {
	changeCode();
	$("#codeImg").bind("click", changeCode);
});

function changeCode() {
	$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
}

function genTimestamp() {
	var time = new Date();
	return time.getTime();
}

//重置
function resetclo(){
	$("#userName").val('');
	$("#password").val('');
	$("#code").val('');
}

//服务器校验
function saveCheck(){
 
	if(check()){
		var loginname = $("#userName").val();
		var password = $("#password").val();
		var code = loginname+",biocor,"+password+",biocor,"+$("#code").val();
		$.ajax({
			type: "POST",
			url: 'login_login',
	    	data: {KEYDATA:code,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" == data.result){
					//saveCookie(); //记住密码
					window.location.href="main/index";
				}else if("usererror" == data.result){
				    $("#tip-text").text("用户名或密码有误");
					$("#loginname").focus();
				}else if("codeerror" == data.result){
					$("#tip-text").text("验证码输入有误");
					$("#code").focus();
				}else{
					$("#tip-text").text("缺少参数");
					$("#loginname").focus();
				}
			}
		});
	}
}


//客户端校验
function check() {
 
	if ($("#userName").val() == "") {
		$("#tip-text").text('用户名不得为空');
			 
		$("#userName").focus();
		return false;
	} else {
		$("#userName").val(jQuery.trim($('#userName').val()));
	}
	if ($("#password").val() == "") {

		$("#tip-text").text('密码不得为空');

		$("#password").focus();
		return false;
	}
	if ($("#code").val() == "") {

		$("#tip-text").text('验证码不得为空');

		$("#code").focus();
		return false;
	}

	$("#tip-text").text('正在登录 , 请稍后 ...');

	return true;
}


$(document).keyup(function(event) {
	if (event.keyCode == 13) {
		$("#to-recover").trigger("click");
	}
});
</script>
</head>

<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"></div>
	</div>
	<div id="main">
		<div id="mainBg">
			<div id="mainPanel">
				<div id="left">
					<div id="image"></div>
				</div>
				<div id="right">
					<div id="welcome">
						<span id="welcome-text">山莓后台管理登录</span>
					</div>
					<form action="" method="post" name="loginForm">
						<div id="user-name">
							<span class="item">用户名:</span>
							<span><input type="text" name="userName"  id="userName" value=""  class="form-input"></span>
						</div>
						<div id="user-password">
							<span class="item">密&nbsp;&nbsp;&nbsp;码:</span>
							<span class="input"><input type="password" id="password" name="password" value="" class="form-input"></span>
						</div>
						<div id="user-checkcode">
							<span class="item">验证码:</span>
							<span class="input"><input type="text" name="code" id="code" class="form-input"></span>
							 
						</div>
						<div style="margin-top: 10px;margin-left: 10px">
						<span class="item">&nbsp;</span>
								<i><img style="height:22px;" id="codeImg" alt="点击更换"
									title="点击更换" src="" />
								</i>
						</div>
						<div id="error-tip">
							<span id="tip-text"></span>
						</div>
						<div id="button-group">
							<input type="button" class="btn" id="to-recover" onclick="saveCheck()" value="提交"/>
							<input type="button" class="btn" onclick="resetclo()" value="重置"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="text">Copyright © 2016 纵索科技</div>
	</div>
</div>
</body>
</html>