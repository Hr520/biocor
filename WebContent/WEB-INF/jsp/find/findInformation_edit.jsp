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
	var action_url;
	$(function(){
		$("#discoveryf_type").val("${pd.discoveryf_type}");
		action_url = "${action_url}";
	});
	//提交表单
	var ue = UE.getContent();
	function save(){
		var formData = new FormData($( "#form" )[0]);
		var content = ue.getContent();
		var imgs0 = $("#imgs0").val();
		var discoveryf_title = $("#discoveryf_title").val();
		if(imgs0==""){
			alert("图片不能为空");
			return;
		}
		if(discoveryf_title==""){
			alert("标题不能为空");
			return;
		}
		if(content==""){
			alert("内容不能为空");
			return;
		}
		$.ajax({  
            url: action_url ,  
            type: 'POST',  
            data: formData,  
            async: false,  
            cache: false,  
            contentType: false,  
            processData: false,  
            success: function (data) { 
	           	 if(data.msg="success"){
	                	location.href="getFoodInformationlistPage"
	           	 }else{
	           		alert("提交失败");
	           	 }
            },  
            error: function (returndata) {  
                alert(returndata);  
            }  
       });
	}
	//修改图片
	function upload(id){
		var formdata = new FormData();
		var fileObj=document.getElementById("discoveryf_image"+id).files;
	    formdata.append("discoveryf_image", fileObj[0]);
	    formdata.append("img_u", "foodInformation");
	    formdata.append("img_name", "discoveryf_image");
        $.ajax({  
             url: '../shop/uploadImg',  
             type: 'POST',  
             data: formdata,  
             async: false,  
             cache: false,  
             contentType: false,  
             processData: false,  
             success: function (data) { 
            	 $("#preview"+id).html("<img class='img1' src='<%=basePath%>" + data.discoveryf_image + "' />");
            	 $("#imgs"+id).val(data.discoveryf_image);
             },  
             error: function (returndata) {  
                 alert(returndata);  
             }  
        });
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
		    <span><img src="<%=basePath%>/res/images/arror.gif" width="7" 
		            height="11" border="0" alt="">
			</span>
			&nbsp;${title }&nbsp; 
		</div>
	</div>
	
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form">
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th><i class="require-red">*</i>类型</th>
							<td><input type="hidden" id="dfid" name="dfid" value="${pd.dfid }">
								<select id="discoveryf_type" name="discoveryf_type">
									<option value="1">美食头条</option>
									<option value="2">营养饮食</option>
									<option value="3">吃货趣事</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>图片</th>
							<td>
							<input type="file" id="discoveryf_image0" size="60" onchange='upload(0)'/>
							<div id="preview0">
							    <c:if test="${pd.discoveryf_image!=null && pd.discoveryf_image!='' }">
							        <img class="img1" src="<%=basePath%>${pd.discoveryf_image }" />
							    </c:if>
							</div>
							<input type="hidden" id="imgs0" name="discoveryf_image" value="${pd.discoveryf_image }">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>标题</th>
							<td><input class="common-text required" id="discoveryf_title"
								name="discoveryf_title" size="50" value="${pd.discoveryf_title}" type="text">
								</td>
						</tr>
						<tr>
							<th style="width: 10%"><i class="require-red">*</i>内容</th>
							<td >
								<!-- 加载编辑器的容器 -->
								    <script id="container" style="width: 100%" name="discoveryf_content" type="text/plain" >${pd.discoveryf_content}</script>
								    <!-- 配置文件 -->
								    <script type="text/javascript" src="<%=basePath%>/res/ueditor/ueditor.config.js"></script>
								    <!-- 编辑器源码文件 -->
								    <script type="text/javascript" src="<%=basePath%>/res/ueditor/ueditor.all.js"></script>
								    <!-- 实例化编辑器 -->
								    <script type="text/javascript">
								        var ue = UE.getEditor('container');
								    </script>
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