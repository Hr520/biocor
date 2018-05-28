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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>表格</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/tongji/style.css">
    <script type="text/javascript" src="<%=basePath%>res/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>res/js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript">
    function sub(){
    	$("#start").val($("#strarTime").val());
    	$("#end").val($("#endTime").val());
    	$("#form1").submit();
    }
    </script>
</head>
<body>
    <div class="container-box">
        <div class="page-title">欢迎使用本系统</div>
    </div>
    
</body>
</html>