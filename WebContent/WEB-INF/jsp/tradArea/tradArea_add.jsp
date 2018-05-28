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
function pChange(){
	var father = $("#province").val();
	if( father !=0 ){
    $.ajax({  
    	type: "POST",
		url: 'findTradArea',
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
        	}
        },  
        error: function (returndata) {  
            alert(returndata);  
        }  
    });
	}else{
		$("#city").html("<option value=\"0\">--请选择--</option>");
		$("#area").html("<option value=\"0\">--请选择--</option>");
	}
}
function cChange(){
	var father = $("#city").val();
	if( father !=0 ){
    $.ajax({  
    	type: "POST",
		url: 'findTradArea',
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
        	}
        },  
        error: function (returndata) {  
            alert(returndata);  
        }  
    });
	}
}

function save(){
	
	var province = $('#province option:selected').val();
	if( province==null || province == ""){
		alert("省不能为空!");
		return false;
	}
	var city = $('#city option:selected').val();
	if( city == null || city == ""){
		alert("市不能为空!");
		return false;
	}
	var area = $("#area option:selected").val();
	if( area==null || area == ""){
		alert("区不能为空!");
		return false;
	}
	var street = $("#street").val();
	if( street==null || street==""){
		alert("街道名称不能为空!");
		return false;
	}
	var streetID = $("#streetID").val();
	if(streetID==null || streetID==""){
		alert("街道编号不能为空!");
		return false;
	}
	
	var father = $("#area").val();
	if( father != null && father != ""){
		$("#father").val(father);
		$("#form").submit();
	}
	
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				  height="11" border="0" alt="">
			</span>
			&nbsp;商圈管理&nbsp; 
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				  border="0" alt="">
			</span>
			&nbsp;新增商圈&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="tradAreaAdd.do"  >
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th style="width: 10%"><i class="require-red">*</i>省</th>
							<td id="gimgs">
							<select id="province" onchange="pChange()">
							    <option value="">--请选择--</option>
							    <c:forEach items="${list }" var="p">
							        <option value="${p.provinceID }">${p.province }</option>
							    </c:forEach>
							</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>市</th>
							<td>
							<select id="city" onchange="cChange()">
								<option value="">--请选择--</option>
							</select>
							</td>
						</tr>
						<tr>
							<th ><i class="require-red">*</i>区</th>
							<td>
							<select id="area">
								<option value="">--请选择--</option>
							</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>街道名称</th>
							<td><input type="text" id="street" name="street" value="">
							<input type="hidden" id="father" name="father" value="">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>街道编码</th>
							<td><input type="text" id="streetID" name="streetID" value="">
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