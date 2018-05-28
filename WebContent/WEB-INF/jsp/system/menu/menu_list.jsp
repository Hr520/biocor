<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
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
		.window{
		    width:100%;
		    height:100%;
		    position:fixed;
		    top:0;
		    background:#000;
		    opacity:0.5;
		    display:none;
		
		}
		.reply{
		    width:22%;
		    margin:auto;
		    position:fixed;
		    left:0;
		    right:0;
		    top:100px;
		    background:#fff;
		    display:none;
		    border-radius:5px;
		}
		.reply1{
		    width:30%;
		    margin:auto;
		    position:fixed;
		    left:0;
		    right:0;
		    top:60px;
		    background:#fff;
		    display:none;
		    border-radius:5px;
		}
		.reply-box{
		    margin:15px 10px;
		}
		.act-title1{
		    line-height:30px;
		}
		.rep-ul{
		    margin:15px 10px;
		}
		.rep-ul li{
		    width:50%;
		    float:left;
		}
		.cancel-btn,.send{
		    display:block;
		    width:90px;
		    height:28px;
		    line-height:28px;
		    text-align: center;
		    border-radius: 20px;
		    border:1px solid #16a61e;
		    color:#fff;
		    margin:0 auto;
		}
		.cancel-btn{
		    color:#333;
		}
		.send{
		    background:#16a61e;
		    border:1px solid #16a61e;
		}
		.font-top{
			align:center;
			text-align: center;
			width:100%;
		}
</style>

<script type="text/javascript">
	//$(top.hangge());	
	
	//新增
	function addmenu(){
		var pid = $("#parentId").val();
		if(pid=='0'){
			$("#menuUrl").attr("readonly","readonly");
		}
		$("#window").css('display','block');
        $("#reply").css('display','block');
        $("#MENU_TYPE").val("1");
        //$("#form-field-radio1").attr("checked","checked")
		//$("#form-field-radio2").removeAttr("checked");
        $('#menuForm').attr("action","menu/add.do");
	}
	function closere(){
		$("#window").css('display','none');
	    $("#reply").css('display','none');
	    $('#menuForm')[0].reset();
	    $("#MENU_TYPE").val("");
	    $("#menuId").val("");
	    $("#parentId").val("0");
	    $("#menuUrl").removeAttr("readonly");
	}
	
	//修改
	function editmenu(menuId){
		//alert(menuId);
		$.ajax({
    		type : "POST",
    		url : "menu/getMenuInfoById?MENU_ID="+menuId,
    		data : {},
    		dataType : "json",
    		async: false,
    		success : function(data) {
    			$("#menuId").val(data['MENU_ID']);
    			$("#MENU_TYPE").val(data['MENU_TYPE']);
    			/*
    			if(data['MENU_TYPE']==1){
    				$("#form-field-radio1").attr("checked","checked")
    				$("#form-field-radio2").removeAttr("checked");
    			}else{
    				$("#form-field-radio2").attr("checked","checked")
    				$("#form-field-radio1").removeAttr("checked");
    			}
    			*/
    			$("#parentId").val(data['PARENT_ID']);
    			$("#menuName").val(data['MENU_NAME']);
    			$("#menuUrl").val(data['MENU_URL']);
    			$("#menuOrder").val(data['MENU_ORDER']);
    			$('#menuForm').attr("action","menu/edit.do");
    			//document.menuForm.action="menu/edit.do";
    		} 
    	});
		var pid = $("#parentId").val();
		if(pid=='0'){
			$("#menuUrl").attr("readonly","readonly");
		}
		$("#window").css('display','block');
        $("#reply").css('display','block');
	}
	
	//编辑顶部菜单图标
	function editTb(menuId){
		//$("#window").css('display','block');
        //$("#reply1").css('display','block');
	}
	
	function delmenu(menuId,isParent){
		var flag = false;
		if(isParent){
			if(confirm("确定要删除该菜单吗？其下子菜单将一并删除！")){
				flag = true;
			}
		}else{
			if(confirm("确定要删除该菜单吗？")){
				flag = true;
			}
		}
		if(flag){
			location.href="menu/delMenu?MENU_ID="+menuId;
		}
	}
	
	function openClose(menuId,curObj,trIndex){
		var txt = $(curObj).text();
		if(txt=="展开"){
			$(curObj).text("折叠");
			$("#tr"+menuId).after("<tr id='tempTr"+menuId+"'><td colspan='5'>数据载入中</td></tr>");
			if(trIndex%2==0){
				$("#tempTr"+menuId).addClass("main_table_even");
			}
			var url = "<%=basePath%>menu/sub.do?MENU_ID="+menuId+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data.length>0){
					var html = "";
					$.each(data,function(i){
						html = "<tr style='height:24px;line-height:24px;' name='subTr"+menuId+"'>";
						html += "<td></td>";
						html += "<td><span style='width:80px;display:inline-block;'></span>";
						if(i==data.length-1)
							html += "<img src='static/images/joinbottom.gif' style='vertical-align: middle;'/>";
						else
							html += "<img src='static/images/join.gif' style='vertical-align: middle;'/>";
						html += "<span style='width:100px;text-align:left;display:inline-block;'>"+this.MENU_NAME+"</span>";
						html += "</td>";
						html += "<td>"+this.MENU_URL+"</td>";
						html += "<td class='center'>"+this.MENU_ORDER+"</td>";
						html += "<td><a class='btn btn-mini btn-info' title='编辑' onclick='editmenu(\""+this.MENU_ID+"\")'><i class='icon-edit'></i></a> <a class='btn btn-mini btn-danger' title='删除' onclick='delmenu(\""+this.MENU_ID+"\",false)'><i class='icon-trash'></i></a></td>";
						html += "</tr>";
						$("#tempTr"+menuId).before(html);
					});
					$("#tempTr"+menuId).remove();
					if(trIndex%2==0){
						$("tr[name='subTr"+menuId+"']").addClass("main_table_even");
					}
				}else{
					$("#tempTr"+menuId+" > td").html("没有相关数据");
				}
			},"json");
		}else{
			$("#tempTr"+menuId).remove();
			$("tr[name='subTr"+menuId+"']").remove();
			$(curObj).text("展开");
		}
	}
	//保存
	function save(){
		if($("#menuId").val() == $("#parentId").val()){
			alert("不能将该菜单修改为自己的父菜单");
			return;
		}
		$("#menuForm").submit();
	}
	
	function setMUR(){
		if($("#parentId").val()==0){
			$("#menuUrl").val("");
			$("#menuUrl").attr("readonly","readonly");
		}else{
			$("#menuUrl").removeAttr("readonly");
		}
	}
	//选择是系统还是业务
	function setType(type){
		$("#MENU_TYPE").val(type);
	}
</script>
</head>

<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;菜单管理<span>&nbsp; <span><img
					src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;菜单列表<span>&nbsp;
			
		</div>
	</div>
	
		<div style="margin:10px 20px;">
			<a class="btn btn-small btn-success" onclick="addmenu();">新增</a>
		</div>
	
	<table id="table_report" class="table table-striped table-bordered table-hover" style="margin:10px 20px;width:95%;">
		<thead>
		<tr>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>名称</th>
			<th class='center'>资源路径</th>
			<th class='center'>排序</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty menuList}">
				<c:forEach items="${menuList}" var="menu" varStatus="vs">
				<tr id="tr${menu.MENU_ID }">
				<td class="center">${vs.index+1}</td>
				<td class='center'><i class="${menu.MENU_ICON }">&nbsp;</i>${menu.MENU_NAME }&nbsp;
					<c:if test="${menu.MENU_TYPE == '1' }">
					<span class="label label-success arrowed">系统</span>
					</c:if>
					<c:if test="${menu.MENU_TYPE != '1' }">
					<span class="label label-important arrowed-in">业务</span>
					</c:if>
				</td>
				<td>${menu.MENU_URL == '#'? '': menu.MENU_URL}</td>
				<td class='center'>${menu.MENU_ORDER }</td>
				<td style="width: 25%;">
				<a class='btn btn-mini btn-warning' onclick="openClose('${menu.MENU_ID }',this,${vs.index })" >展开</a>
				<!-- <a class='btn btn-mini btn-purple' title="图标" onclick="editTb('${menu.MENU_ID }')" ><i class='icon-picture'></i></a> -->
				<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${menu.MENU_ID }')" ><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${menu.MENU_ID }',true)"><i class='icon-trash'></i></a>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
	
	<!-- 弹出新增或修改页面 -->
	<div class="window" id="window"></div>
    <div class="reply" id="reply">
	<form  action="menu/add.do" name="menuForm" id="menuForm" method="post" >
		<input type="hidden" name="MENU_ID" id="menuId" value=""/>
			<input type="hidden" name="pId" id="pId" value=""/>
			<input type="hidden" name="MENU_TYPE" id="MENU_TYPE" value=""/>
		<div id="zhongxin" style="margin:20px;">
		<table>
			<tr>
				<td>
					<select name="PARENT_ID" id="parentId" class="input_txt" onchange="setMUR()"  title="菜单">
						<option value="0" >顶级菜单</option>
						<c:forEach items="${menuList}" var="menu">
							<option value="${menu.MENU_ID }" onclick="">${menu.MENU_NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="MENU_NAME" id="menuName" placeholder="这里输入菜单名称" value="" title="名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MENU_URL" id="menuUrl" placeholder="这里输入链接地址" value="" title="地址"/></td>
			</tr>
			<tr>
				<td><input type="number" name="MENU_ORDER" id="menuOrder" placeholder="这里输入序号" value="" title="序号"/></td>
			</tr>
			<!-- 
			<tr>
				<td style="text-align: center;">
					<label style="float:left;padding-left: 32px;"><input name="form-field-radio" id="form-field-radio1" onclick="setType('1');" type="radio" value="icon-edit" checked="checked"><span class="lbl">系统菜单</span></label>
					<label style="float:left;padding-left: 5px;"><input name="form-field-radio" id="form-field-radio2" onclick="setType('2');" type="radio" value="icon-edit"><span class="lbl">业务菜单</span></label>
				</td>
			</tr>
			 -->
			<tr>
				<td style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="closere();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
    </div>
   
</body>
</html>