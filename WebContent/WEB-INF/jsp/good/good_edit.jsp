<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/common2.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/main.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>res/My97DatePicker/WdatePicker.js"></script>
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
$(function() {
	var str = $('#goods_gtid option:selected').text();
	if (str == "积分兑换") {
		$("#goods_moeny").val(0);
		$("#goods_moeny").attr("readonly","readonly");
		$("#goods_dis_money").removeAttr("readonly");
	}else{
		$("#goods_dis_money").val(0);
		$("#goods_dis_money").attr("readonly","readonly");
		$("#goods_moeny").removeAttr("readonly");
	}
});
	//图片预览
	function preview(file,i)  
    {  
	    var prevDiv = document.getElementById('preview'+i);
	    //prevDiv.style.display="block";
	    if (file.files && file.files[0]){  
		    var reader = new FileReader();  
		    reader.onload = function(evt){  
		    	prevDiv.innerHTML = '<img class="img1" src="' + evt.target.result + '" />';  
	   		}    
	        reader.readAsDataURL(file.files[0]);  
	    }else{  
	        prevDiv.innerHTML = '<div class="img1" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
	    }  
    }
	//提交表单
	function save(){
		var goods_gtid = $('#goods_gtid option:selected').val();
		if( goods_gtid == null || goods_gtid == ''){
			alert("商品类型不能为空!")	;
			return false;
		}
		var goods_name = $("#goods_name").val();
		if( goods_name == null || goods_name == ""){
			alert("商品名称不能为空!");
			return false;
		}
		
		var goods_moeny = $("#goods_moeny").val();
		if( goods_moeny == null || goods_moeny==""){
			alert("商品价格不能为空!");
			return false;
		}
		var goods_dis_money = $("#goods_dis_money").val();
		if( goods_dis_money == null || goods_dis_money==""){
			alert("积分价不能为空!");
			return false;
		}
		
		var starttime = $("#starttime").val();
		if( starttime==null || starttime == ''){
			alert("商品上架时间不能为空!");
			return false;
		}

		var remark = $("#remark").val();
		if( remark == null || remark == ""){
			alert("单位不能为空!");
			return false;
		}		
		$("#form").submit();
	}
	
	//添加图片
	function addtr(){
		var i = parseInt($("#imgnum").val());
		var j = parseInt($("#imgindex").val());
		i = i + 1;
		j = j + 1;
		if(i>5){
			alert("最多上传五张图片");
		}else{
			$("#imgnum").val(i);
			var tr = "<input type='file' id='good_urls"+j+"' onchange='upload("+j+")' class='oneline'/>"
				+"<img alt='删除' id='del"+j+"' src='<%=basePath%>static/images/timg.jpg' onclick='delImg("+j+")' class='timg'>"
				+"<input type='hidden' name='good_urls' id='imgs"+j+"'>";
			var pre = "<div id='preview"+j+"' class='oneline'></div>";
			$("#addImage").append(tr);
			$("#gimgs").append(pre);
			$("#imgindex").val(j);
		}
	}
	//删除图片
	function delImg(id){
		var  imgnum = parseInt($("#imgnum").val());
		if(imgnum>1){
			$("#good_urls"+id).remove();
			$("#del"+id).remove();
			$("#preview"+id).remove();
			$("#imgnum").val(imgnum-1);
			$("#imgs"+id).remove();
		}else{
			alert("至少保留一张商品图片");
		}
	}
	//上传
	function upload(id){
		var formdata = new FormData();
		var fileObj=document.getElementById("good_urls"+id).files;
	    formdata.append("good_urls", fileObj[0]);
	    formdata.append("img_u", "good");
	    formdata.append("img_name", "good_urls");
        $.ajax({  
             url: '../shop/uploadImg',  
             type: 'POST',  
             data: formdata,  
             async: false,  
             cache: false,  
             contentType: false,  
             processData: false,  
             success: function (data) { 
            	 $("#preview"+id).html("<img class='img1' src='<%=basePath%>" + data.good_urls + "' />");
            	 $("#imgs"+id).val(data.good_urls);
             },  
             error: function (returndata) {  
                 alert(returndata);  
             }  
        });
    }
	
	
	function check() {
		var str = $('#goods_gtid option:selected').text();
		if (str == "积分兑换") {
			$("#goods_moeny").val(0);
			$("#goods_moeny").attr("readonly","readonly");
			$("#goods_dis_money").removeAttr("readonly");
			$("#remark").val("积分");
		}else{
			$("#goods_dis_money").val(0);
			$("#goods_dis_money").attr("readonly","readonly");
			$("#goods_moeny").removeAttr("readonly");
			$("#remark").val("元");
		}
	}
	
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span>
			    <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
		    </span>
		    &nbsp;商品管理&nbsp; 
		    <span>
		        <img src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt="">
		    </span>
		    &nbsp;新增商品&nbsp; 
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="goodUpdate.do">
			    <input type="hidden" name="gid" value="${pd.gid }">
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th width="10%"><i class="require-red">*</i>店铺名</th>
							<td>${pd.shop_name }
							    <input type="hidden" name="goods_sid" value="${pd.goods_sid }">
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>商品类型</th>
							<td>
							<select id="goods_gtid" name="goods_gtid" onchange="check()">
								<option value="">--请选择--</option>
								<c:forEach items="${typelist}" var="list">
									<option value="${list.ftid }" <c:if test="${list.ftid==pd.goods_gtid }">selected="selected"</c:if> >${list.ft_foodtype_name}</option>
								</c:forEach>
							</select>
							</td>
						</tr>
						<tr>
							<th><i class="require-red">*</i>商品名称</th>
							<td><input class="common-text required" id="goods_name"
								name="goods_name" size="50" type="text" value="${pd.goods_name }">
								</td>
						</tr>
					
						<tr>
							<th><i class="require-red">*</i>商品价格</th>
							<td><input class="common-text required" id="goods_moeny" 
								onkeyup="value=value.replace(/[^\d.]/g,'')" maxLength="8"
								name="goods_moeny" size="8" type="text" value="${pd.goods_moeny }">
								</td>
						</tr>
						 
						<tr>
							<th><i class="require-red">*</i>积分价</th>
							<td><input class="common-text required" id="goods_dis_money" 
								onkeyup="value=value.replace(/[^\d.]/g,'')" maxLength="8"
								name="goods_dis_money" size="8" type="text" value="${pd.goods_dis_money }">
								</td>
						</tr>
						
						<tr>
							<th><i class="require-red">*</i>商品口味</th>
							<td>
							    <select name="goods_taste">
							        <option value="0" <c:if test="${0==pd.goods_taste }">selected="selected"</c:if> >无辣</option>
							        <option value="1" <c:if test="${1==pd.goods_taste }">selected="selected"</c:if> >微辣</option>
							        <option value="2" <c:if test="${2==pd.goods_taste }">selected="selected"</c:if> >中辣</option>
							        <option value="3" <c:if test="${3==pd.goods_taste }">selected="selected"</c:if> >特辣</option>
							    </select>
							</td>
						</tr>
						<tr>
                            <th><i class="require-red">*</i>上架时间</th>
                            <td>
                                <input type="text" class="Wdate" id="starttime" name="starttime" readonly="readonly"
                                    onclick="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endtime\')}'})" 
                                    value="${pd.goods_up_shelves }">
                            </td>
                        </tr>
                        <tr>
                            <th><i class="require-red"></i>下架时间</th>
                            <td>
                                <input type="text" class="Wdate" id="endtime" name="endtime" readonly="readonly"
                                    onclick="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'starttime\')}'})"
                                    value="${pd.goods_dw_shelves }">
                            </td>
                        </tr>
						
						
						<tr>
							<th style="width: 10%"><i class="require-red">*</i>单位</th>
							<td >
								<input class="common-text required" id="remark" maxLength="8"
								name="remark" size="8" type="text" value="${pd.goods_remark }">
								<span style="color: red;">*(元/斤) 或者 (元)</span>
							</td>
						</tr>
						<!--  
						<tr>
							<th><i class="require-red"></i>商品营业时间</th>
							<td><input class="common-text required" id="goods_time"
								name="goods_name" size="20" type="text" value="${pd.goods_time }">
								<span>(非必填,格式如  8:00 - 20:00)</span>
								</td>
						</tr>-->
						
						<tr>
							<th><i class="require-red">*</i>商品图片</th>
							<td id="gimgs">
							    <input type="hidden" value="${fn:length(fn:split(pd.goods_images,','))}" id="imgnum">
							    <input type="hidden" value="${fn:length(fn:split(pd.goods_images,','))}" id="imgindex">
							    <input type="button" value="添加" onclick="addtr()" style="width: 60px; height: 28px; 
							           background: #0283c5; color: #fff; border: 1px solid #ccc; border-radius: 4px;"><br>
							<div id="addImage">
							<c:forEach items="${fn:split(pd.goods_images,',')}" var="addr" begin="0" 
  								end="${fn:length(fn:split(pd.goods_images,','))}" varStatus="stat">
								   <input type="file" id="good_urls${stat.index+1 }" onchange="upload('${stat.index+1 }')" class="oneline imagenamelength"/>
								   <img alt="删除" id="del${stat.index+1 }" src="<%=basePath%>static/images/timg.jpg" onclick="delImg(${stat.index+1 })" class="timg">
								   <input type="hidden" name="good_urls" id="imgs${stat.index+1 }" value="${addr }">
							</c:forEach>
							</div>
							<c:forEach items="${fn:split(pd.goods_images,',')}" var="addr" begin="0" 
  								end="${fn:length(fn:split(pd.goods_images,','))}" varStatus="stat">
								<div id="preview${stat.index+1 }" class="oneline"><img class="img1" src="<%=basePath%>${addr}"></div>
							</c:forEach>
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