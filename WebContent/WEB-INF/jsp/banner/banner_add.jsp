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
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<!-- ace styles -->
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
function uploadOne(){
	var formdata = new FormData();
	var fileObj=document.getElementById("banner_imgs").files;
    formdata.append("banner_url", fileObj[0]);
    formdata.append("img_u", "banner");
    formdata.append("img_name", "banner_url");
    $.ajax({  
         url: '../shop/uploadImg' ,  
         type: 'POST',  
         data: formdata,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (data) { 
        	 $("#banPreview").html("<img class='img1' src='<%=basePath%>" + data.banner_url + "' />");
        	 $("#banImg").val(data.banner_url);
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });
}


//添加图片
function addtr(){
	var i = parseInt($("#imgnum").val());
	var j = parseInt($("#imgindex").val());
	i = i + 1;
	j = j + 1;
	if(i>5){
		alert("最多上传五张");
	}else{
		$("#imgnum").val(i);
		var tr = "<input type='file' id='ban_urls"+j+"' onchange='upload("+j+")' class='oneline'/>"
				//+"<input type='button' value='删除' id='del"+i+"' onclick='delImg("+i+")'>"
				+"<img alt='删除' id='del"+j+"' src='<%=basePath%>static/images/timg.jpg' onclick='delImg("+j+")' class='timg'>"
				+"<input type='hidden' name='ban_urls' id='imgs"+j+"'>";
		var pre = "<div id='preview"+j+"' class='oneline'></div>";
		$("#addImage").append(tr);
		$("#gimgs").append(pre);
		$("#imgindex").val(j);
	}
}
//修改图片
function upload(id){
	var formdata = new FormData();
	var fileObj=document.getElementById("ban_urls"+id).files;
    formdata.append("ban_urls", fileObj[0]);
    formdata.append("img_u", "banner");
    formdata.append("img_name", "ban_urls");
    $.ajax({  
         url: '../shop/uploadImg' ,  
         type: 'POST',  
         data: formdata,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (data) { 
        	 $("#preview"+id).html("<img class='img1' src='<%=basePath%>" + data.ban_urls + "' />");
        	 $("#imgs"+id).val(data.ban_urls);
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });
}
//删除图片
function delImg(id){
	var  imgnum = parseInt($("#imgnum").val());
	if(imgnum>1){
		$("#ban_urls"+id).remove();
		$("#del"+id).remove();
		$("#imgs"+id).remove();
		$("#preview"+id).remove();
		$("#imgnum").val(imgnum-1);
	}else{
		alert("至少保留一张商品图片");
	}
}

function save(){
	var banImg = $("#banImg").val();
	if( banImg==null || banImg ==""){
		alert("广告图片不能为空!");
		return false;
	}
	var banner_type = $('#banner_type option:selected').val();
	if( banner_type==null || banner_type == ""){
		alert("广告类型不能为空!");
		return false;
	}
	//var modelId = $('#modelId option:selected').val();
	//if( modelId==null || modelId== ""){
	//	alert("模板类型不能为空!");
	//	return false;
	//}
	$("#form").submit();
}

function change(){

}
function aa(){
	var model_id=  $("#modelId option:selected").val();
	$("#model_Id").val(model_id);
	
}

</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;广告管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;新增广告&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="bannerAdd.do"  >
				<table class="insert-tab" width="100%">
					<tbody>
					    <tr>
							<th><i class="require-red">*</i>广告类型</th>
							<td>
							<select id="banner_type" name="type">
							    <option value="">--请选择--</option>
								<option value="0">非轮播图</option>
								<option value="1">轮播图</option>
								<option value="2">欢迎页</option>
								<option value="3">引导页</option>
							</select>
							</td>
						</tr>
					
						<tr>
							<th style="width: 10%"><i class="require-red">*</i>广告图片</th>
							<td id="gimgst">
							    <div id="addBanImage">
							        <input type="file" id="banner_imgs" onchange='uploadOne()' class="oneline imagenamelength"/>
							        <input type="hidden" name="image" id="banImg" value="">
							    </div>
								<div id="banPreview" class="oneline"></div>
							</td>
						</tr>
						<!--  
						<tr>
							<th style="width: 10%"><i class="require-red"></i>广告内容图片</th>
							<td id="gimgs">
							    <input type="hidden" value="1" id="imgnum">
							    <input type="hidden" value="1" id="imgindex">
							    <input type="button" value="添加" onclick="addtr()" style="width: 60px; height: 28px; 
							           background: #0283c5; color: #fff; border: 1px solid #ccc; border-radius: 4px;"><br>
							    <div id="addImage">
							        <input type="file" id="ban_urls1" onchange="upload('1')" class="oneline imagenamelength"/>
								    <img alt="删除" id="del1" src="<%=basePath%>static/images/timg.jpg" onclick="delImg(1)" class="timg">
								    <input type="hidden" name="ban_urls" id="imgs1" value="">
							    </div>
								<div id="preview1" class="oneline">
								   
								</div>
							</td>
						</tr>
						-->
						
						<tr>
							<th><i class="require-red"></i>模板类型</th>
							
							<td>
							<input type="text" name="model_id" value="" id="model_Id" style="width: 40px;">
							<select id="modelId" name="modelId" onchange="aa()">
							    <option value="">--请选择--</option>
							    <c:forEach items="${listmodel }" var="m">
							        <option value="${m.mid }">模板${m.m_order }</option>
							    </c:forEach>
							</select>
							</td>
						</tr>
						<!--
						<tr>
							<th ><i class="require-red"></i>广告明细</th>
							<td>
							     加载编辑器的容器 
								<script id="container" style="width: 100%" name="detail" type="text/plain" ></script>
								<!-- 配置文件 
								<script type="text/javascript" src="<%=basePath%>/res/ueditor/ueditor.config.js"></script>
							    <!-- 编辑器源码文件 
								<script type="text/javascript" src="<%=basePath%>/res/ueditor/ueditor.all.js"></script>
								<!-- 实例化编辑器 
								<script type="text/javascript">
								    var ue = UE.getEditor('container');
								</script>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>跳转地址</th>
							<td><textarea rows="3" cols="64" name="url"></textarea>
								</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>备注</th>
							<td><textarea rows="3" cols="64" name="remark"></textarea>
							</td>
						</tr>
						-->
						<tr>
							<th><i class="require-red"></i>排序</th>
							<td><input type="text" name="order" value="">
							</td>
						</tr>
						<!--
						<tr>
							<th><i class="require-red"></i>搜索条件</th>
							<td><input type="text" name="search" value="">
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>备注</th>
							<td>
							    <select name="stype">
							        <option value="0">单品</option>
							        <option value="1">全场</option>
							    </select>
							</td>
						</tr>
						-->
						
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