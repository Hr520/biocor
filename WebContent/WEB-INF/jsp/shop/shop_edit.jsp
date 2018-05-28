<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    $(function(){
		$("#tr_p").hide();
		$("#tr_c").hide();
		$("#tr_a").hide();
		$("#tr_t").hide();
		$("#tr_n").show();
	});
	//图片预览
	function preview(file)  
    {  
	    var prevDiv = document.getElementById('preview');
	    //prevDiv.style.display="block";
	    if (file.files && file.files[0]){  
		    var reader = new FileReader();  
		    reader.onload = function(evt){  
		    	prevDiv.innerHTML = '<img class="img1" src="' + evt.target.result + '" />';  
	   		};    
	    reader.readAsDataURL(file.files[0]);  
	   }else    
	    {  
	    prevDiv.innerHTML = '<div class="img1" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
	    }  
    }
	//提交表单
	var ue = UE.getContent();
	function save(){
		var rech = $("#rech").val();
		if( rech == 1 ){
			
			$("#shop_province").val($("#province").find("option:selected").text());
			$("#shop_city").val($("#city").find("option:selected").text());
			$("#shop_area").val($("#area").find("option:selected").text());
			$("#shop_street").val($("#street").find("option:selected").text());
		}
		//验证
		var shop_name = $("#shop_name").val();
		if( shop_name == null || shop_name == ''){
			alert("店铺名不能为空!");
			return false;
		}
		var shop_consume = $("#shop_consume").val();
		if( shop_consume == null || shop_consume == ''){
			alert("人均消费不能为空!");
			return false;
		}
		var shop_time = $("#shop_time").val();
		if( shop_time == null || shop_time == ''){
			alert("营业时间不能为空!");
			return false;
		}
		var shop_adders = $("#shop_adders").val();
		if( shop_adders==null || shop_adders == ''){
			alert("店铺地址不能为空!");
			return false;
		}
		var shop_tel = $("#shop_tel").val();
		if( shop_tel == null || shop_tel == ''){
			alert("联系电话不能为空!");
			return false;
		}
		var imgs1 = $("#imgs1").val();
		if( imgs1 == null || imgs1 == '' || imgs1 == 'undefined' ){
			alert("店铺图片不能为空!");
			return false;
		}
		
		var formData = new FormData($( "#form" )[0]);
		$.ajax({  
            url: 'shopUpdate' ,  
            type: 'POST',  
            data: formData,  
            async: false,  
            cache: false,  
            contentType: false,  
            processData: false,  
            success: function (data) { 
	           	 if(data.msg="success"){
	                	location.href="shopList";
	           	 }else{
	           		alert("修改失败");
	           	 }
            },  
            error: function (returndata) {  
                alert(returndata);  
            }  
       });
	}
	
	/***************************************************/
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
			var tr = "<input type='file' id='shop_urls"+j+"' onchange='upload("+j+")' class='oneline'/>"
					//+"<input type='button' value='删除' id='del"+i+"' onclick='delImg("+i+")'>"
					+"<img alt='删除' id='del"+j+"' src='<%=basePath%>static/images/timg.jpg' onclick='delImg("+j+")' class='timg'>"
					+"<input type='hidden' name='shop_urls' id='imgs"+j+"'>";
			var pre = "<div id='preview"+j+"' class='oneline'></div>";
			$("#addImage").append(tr);
			$("#gimgs").append(pre);
			$("#imgindex").val(j);
		}
	}
	//修改图片
	function upload(id){
		var formdata = new FormData();
		var fileObj=document.getElementById("shop_urls"+id).files;
	    formdata.append("shop_urls", fileObj[0]);
	    formdata.append("img_u", "shop");
	    formdata.append("img_name", "shop_urls");
        $.ajax({  
             url: 'uploadImg' ,  
             type: 'POST',  
             data: formdata,  
             async: false,  
             cache: false,  
             contentType: false,  
             processData: false,  
             success: function (data) { 
            	 $("#preview"+id).html("<img class='img1' src='<%=basePath%>" + data.shop_urls + "' />");
            	 $("#imgs"+id).val(data.shop_urls);
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
			$("#shop_urls"+id).remove();
			$("#del"+id).remove();
			$("#imgs"+id).remove();
			$("#preview"+id).remove();
			$("#imgnum").val(imgnum-1);
		}else{
			alert("至少保留一张商品图片");
		}
	}
	
	
	/******************************************************************/
	function treetChange(){
		var v = $("#rech").val();
		if( v==0){
			$("#tr_p").hide();
			$("#tr_c").hide();
			$("#tr_a").hide();
			$("#tr_t").hide();
			$("#tr_n").show();
		}
		if( v==1){
			$("#tr_p").show();
			$("#tr_c").show(); 
			$("#tr_a").show();
			$("#tr_t").show();
			$("#tr_n").hide();
		}
	}
	
	
	function pChange(){
		var father = $("#province").val();
		if( father !=0 ){
	    $.ajax({  
	    	type: "POST",
			url: '../tradArea/findTradArea',
	    	data: {type:1,father:father,tm:new Date().getTime()},
			dataType:'json',
			cache: false, 
	        success: function (data) { 
	        	if(data.state=="success"){
	        		var array = data.list;
					var length = array.length;
					var str = "";
					str = "<option value=\"0\">--请选择--</option>";
					for(var i=0;i<length;i++){
						str=str+"<option value=\""+array[i].cityID+"\">"+array[i].city+"</option>";
					}
	        		
	        		$("#city").html(str);
	        		$("#area").html("<option value=\"0\">--请选择--</option>");
	        		$("#street").html("<option value=\"0\">--请选择--</option>");
	        	}
	        },  
	        error: function (returndata) {  
	            alert(returndata);  
	        }  
	    });
		}else{
			$("#city").html("<option value=\"0\">--请选择--</option>");
			$("#area").html("<option value=\"0\">--请选择--</option>");
			$("#street").html("<option value=\"0\">--请选择--</option>");
		}
	}
	function cChange(){
		var father = $("#city").val();
		if( father !=0 ){
	    $.ajax({  
	    	type: "POST",
			url: '../tradArea/findTradArea',
	    	data: {type:2,father:father,tm:new Date().getTime()},
			dataType:'json',
			cache: false, 
	        success: function (data) { 
	            if(data.state=="success"){
	            	
	            	var array = data.list;
					var length = array.length;
					var str = "";
					str = "<option value=\"0\">--请选择--</option>";
					for(var i=0;i<length;i++){
						str=str+"<option value=\""+array[i].areaID+"\">"+array[i].area+"</option>";
					}
	        		$("#area").html(str);
	        		$("#street").html("<option value=\"0\">--请选择--</option>");
	        	}
	        },  
	        error: function (returndata) {  
	            alert(returndata);  
	        }  
	    });
		}else{
			$("#area").html("<option value=\"0\">--请选择--</option>");
			$("#street").html("<option value=\"0\">--请选择--</option>");
		}
	}
	function aChange(){
		var father = $("#area").val();
		if( father !=0 ){
	    $.ajax({  
	    	type: "POST",
			url: '../tradArea/findTradArea',
	    	data: {type:3,father:father,tm:new Date().getTime()},
			dataType:'json',
			cache: false, 
	        success: function (data) { 
	            if(data.state=="success"){
	            	
	            	var array = data.list;
					var length = array.length;
					var str = "";
					str = "<option value=\"0\">--请选择--</option>";
					for(var i=0;i<length;i++){
						str=str+"<option value=\""+array[i].streetID+"\">"+array[i].street+"</option>";
					}
	        		$("#street").html(str);
	        	}
	        },  
	        error: function (returndata) {  
	            alert(returndata);  
	        }  
	    });
		}else{
			$("#street").html("<option value=\"0\">--请选择--</option>");
		}
	}
	
	/***************************************************/

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
		    &nbsp;编辑店铺信息&nbsp; 
		</div>
	</div>
	
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" >
			<input type="hidden" id="sid" name="sid" value="${pd.sid }">
			<input type="hidden" id="shop_province" name="shop_province" value="${pd.shop_province }">
			<input type="hidden" id="shop_city" name="shop_city" value="${pd.shop_city }">
			<input type="hidden" id="shop_area" name="shop_area" value="${pd.shop_area }">
			<input type="hidden" id="shop_street" name="shop_street" value="${pd.shop_street }">
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th><i class="require-red">*</i>店铺名</th>
							<td>
							   <input class="common-text required" id="shop_name"
								  name="shop_name" size="50" value="${pd.shop_name}" type="text">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>店铺类型</th>
							<td>
							    <select name="shop_type">
							        <c:forEach items="${typelist }" var="ty">
							        <option value="${ty.stid }" <c:if test="${ty.stid == pd.shop_type }"> selected="selected"</c:if> >${ty.st_name }</option>
						            </c:forEach>
							    </select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>人均消费</th>
							<td><input class="common-text required" id="shop_consume"
								 name="shop_consume" size="50" value="${pd.shop_consume}" type="text" onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]">
							</td>
							
						</tr>
						<tr>
							<th><i class="require-red"></i>其他费用名称</th>
							<td><input class="common-text required" id="shop_seat_name" name="shop_seat_name"  size="50" value="${pd.shop_seat_name}" type="text"> <span style="color: red;">* 如 餐位费</span></td>
						</tr>
						<tr>
							<th><i class="require-red"></i>金额</th>
							<td><input class="common-text required" id="shop_seat_money" name="shop_seat_money"  size="50" value="${pd.shop_seat_money}" type="text"></td>
						</tr>
						
						
						<tr>
							<th><i class="require-red"></i>商圈更改</th>
							<td>
							<select id="rech" onchange="treetChange()">
							    <option value="0">不更改</option>
							    <option value="1">更改</option>
							</select>
							</td>
						</tr>
						
						<tr id="tr_p" >
							<th><i class="require-red">*</i>省</th>
							<td>
							<select id="province" onchange="pChange()">
							    <option value="0">--请选择--</option>
							    <c:forEach items="${list }" var="p">
							        <option value="${p.provinceID }">${p.province }</option>
							    </c:forEach>
							</select>
							</td>
						</tr>
						<tr id="tr_c">
							<th><i class="require-red">*</i>市</th>
							<td>
							<select id="city" onchange="cChange()">
								<option value="0">--请选择--</option>
							</select>
							</td>
						</tr>
						<tr id="tr_a">
							<th><i class="require-red">*</i>区</th>
							<td>
							<select id="area" onchange="aChange()">
								<option value="0">--请选择--</option>
							</select>
							</td>
						</tr>
						<tr id="tr_t">
							<th><i class="require-red">*</i>商业圈</th>
							<td>
							<select id="street">
								<option value="0">--请选择--</option>
							</select>
							</td>
						</tr>
						
						<tr id="tr_n">
							<th><i class="require-red"></i>商业圈</th>
							<td>${pd.shop_province }--${pd.shop_city }--${pd.shop_area }--${pd.shop_street }
							</td>
						</tr>
						
						<tr>
							<th><i class="require-red">*</i>营业时间</th>
							<td><input class="common-text required" id="shop_time"
								 name="shop_time" size="20" value="${pd.shop_time}" type="text">
								 <span style="color: red;">* 格式如  8:00 - 20:00 </span>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>商铺地址</th>
							<td><input class="common-text required" id="shop_adders"
								 name="shop_adders" size="50" value="${pd.shop_adders}" type="text">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>联系电话</th>
							<td><input class="common-text required" id="shop_tel"
								 name="shop_tel" size="50" value="${pd.shop_tel}" type="text" onkeyup="value=value.replace(/[^\d]/g,'')">
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>活动须知</th>
							<td><input class="common-text required" id="shop_activity"
								 name="shop_activity" size="50" value="${pd.shop_activity}" type="text">
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>打印机端号</th>
							<td><input class="common-text required" id="machine_code"
								 name="machine_code" size="50" value="${pd.machine_code}" type="text">
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>打印机密钥</th>
							<td><input class="common-text required" id="mKey"
								 name="mKey" size="50" value="${pd.mKey}" type="text">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>是否抽奖</th>
							<td><input type="radio" name="shop_draw" value="1" style='opacity:1;position:static' <c:if test="${pd.shop_draw==1 }">checked="checked"</c:if> >&nbsp;是&nbsp;
							    <input type="radio" name="shop_draw" value="0" style='opacity:1;position:static' <c:if test="${pd.shop_draw==0 }">checked="checked"</c:if> >&nbsp;否&nbsp;
							</td>
						</tr>
						<tr>
							<th style="width: 10%"><i class="require-red"></i>店铺描述</th>
							<td >
								<!-- 加载编辑器的容器 -->
								    <script id="container" style="width: 100%" name="shop_introduce" type="text/plain" >${pd.shop_introduce}</script>
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
							<th style="width: 10%"><i class="require-red"></i>备注</th>
							<td >
								<textarea name="remark" rows="5" cols="100">${pd.remark }</textarea>
							</td>
						</tr>
						 
						<tr>
							<th><i class="require-red">*</i>店铺图片</th>
							<td id="gimgs">
							    <input type="hidden" value="${fn:length(fn:split(pd.shop_images,','))}" id="imgnum">
							    <input type="hidden" value="${fn:length(fn:split(pd.shop_images,','))}" id="imgindex">
							    <input type="button" value="添加" onclick="addtr()" style="width: 60px; height: 28px; 
							           background: #0283c5; color: #fff; border: 1px solid #ccc; border-radius: 4px;"><br>
							<div id="addImage">
							<c:forEach items="${fn:split(pd.shop_images,',')}" var="addr" begin="0" 
  								end="${fn:length(fn:split(pd.shop_images,','))}" varStatus="stat">
								   <input type="file" id="shop_urls${stat.index+1 }" onchange="upload('${stat.index+1 }')" class="oneline imagenamelength"/>
								   <img alt="删除" id="del${stat.index+1 }" src="<%=basePath%>static/images/timg.jpg" onclick="delImg(${stat.index+1 })" class="timg">
								   <input type="hidden" name="shop_urls" id="imgs${stat.index+1 }" value="${addr }">
							</c:forEach>
							</div>
							<c:forEach items="${fn:split(pd.shop_images,',')}" var="addr" begin="0" 
  								end="${fn:length(fn:split(pd.shop_images,','))}" varStatus="stat">
								<div id="preview${stat.index+1 }" class="oneline"><img class="img1" src="<%=basePath%>${addr}"></div>
							</c:forEach>
							</td>
						</tr>
						
						<!-- <input type="button" value="删除" id="del${stat.index+1 }" onclick="delImg(${stat.index+1 })"> -->
						<tr>
							<th></th>
							<td>
							    <input class="btn btn-primary btn6 mr10" value="确定" type="button" onclick="save()"> 
						        <input class="btn btn6" onclick="history.go(-1);" value="返回" type="button">
						    </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>