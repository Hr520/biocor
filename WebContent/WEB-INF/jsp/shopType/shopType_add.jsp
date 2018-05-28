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
function upload(){
	var formdata = new FormData();
	var fileObj=document.getElementById("shoptypeimg").files;
    formdata.append("shoptypeimg", fileObj[0]);
    formdata.append("img_u", "shoptype");
    formdata.append("img_name", "shoptypeimg");
    $.ajax({  
         url: '../shop/uploadImg' ,  
         type: 'POST',  
         data: formdata,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (data) { 
        	 $("#preview1").html("<img class='img1' src='<%=basePath%>" + data.shoptypeimg + "' />");
        	 $("#imgs1").val(data.shoptypeimg);
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });
}

function save(){
	var name = $("#name").val();
	if( name == null || name==''){
		alert("类型名称不能为空!");
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
			&nbsp;店铺管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;店铺类型新增&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="shopTypeAdd.do"  >
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th><i class="require-red">*</i>类型名称</th>
							<td><input type="text" name="name" id="name" value="">
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>图片</th>
							<td>
							<div id="addImage">
							    <input type="file" id="shoptypeimg" onchange="upload()" class="oneline imagenamelength"/>
							    <input type="hidden" name="img" id="imgs1" value="">
							</div>
							<div id="preview1" class="oneline">
							    
							</div>
							</td>
						</tr>
						<tr>
							<th ><i class="require-red"></i>类型</th>
							<td>
							<select name="type">
								<option value="0">好吃</option>
								<option value="1">好玩</option>
							</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>备注</th>
							<td><textarea rows="3" cols="64" name="remark"></textarea>
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