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
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<style type="text/css">@import url('res/components/dtree/dtree.css');</style>
	<script type="text/javascript">var dtreeIconBasePath = "res/components/dtree";</script>
	<script type="text/javascript" src="res/components/dtree/dtree.js"></script>
	<base href="<%=basePath%>">	
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
		.window{
			z-index:99998;
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
		    z-index:99999;
		}
		.reply1{
		    width:20%;
		    margin:auto;
		    position:fixed;
		    left:0;
		    right:0;
		    top:60px;
		    background:#fff;
		    display:none;
		    border-radius:5px;
		    z-index:99999;
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
	</head>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;角色管理<span>&nbsp; <span><img
					src="<%=basePath%>/res/images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;角色列表<span>&nbsp;
			
		</div>
	</div>
<div class="container-fluid" id="main-container">

		
<div id="page-content">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
	<c:if test="${QX.add == 1 }">
	<div style="margin-bottom: 10px;">
			<a href="javascript:addRole('${pd.ROLE_ID }');" class="btn btn-small btn-success">新增</a>
	<!--
	<div id="breadcrumbs">
		<table class="center" style="width:100%;">
			<tr height="35">
				<c:if test="${QX.add == 1 }">
				<td style="width:69px;"><a href="javascript:addRole('${pd.ROLE_ID }');" class="btn btn-small btn-success">新增</a></td>
				</c:if>
				 	<c:choose>
					<c:when test="${not empty roleList}">
					<c:forEach items="${roleList}" var="role" varStatus="vs">
						<td style="width:100px;" class="center" <c:choose><c:when test="${pd.ROLE_ID == role.ROLE_ID}">bgcolor="#FFC926" onMouseOut="javascript:this.bgColor='#FFC926';"</c:when></c:choose> >
							<c:if test="${pd.ROLE_ID == role.ROLE_ID}">
							<a href="role.do?ROLE_ID=${role.ROLE_ID }" style="text-decoration:none; display:block;"><li class=" icon-group"></li>&nbsp;<font color="#666666">${role.ROLE_NAME }</font></a>
							</c:if>
						</td>
						<td style="width:5px;"></td>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
						<td colspan="100">没有相关数据</td>
						</tr>
					</c:otherwise>
					</c:choose> 
				<td></td>
			</tr>
		</table>
	</div>
	-->
	</div>
	</c:if>
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th>角色</th>
			
			<th style="width:155px;"  class="center">操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty roleList}">
				<c:forEach items="${roleList}" var="var" varStatus="vs">
				
				<tr>
				<td class='center' style="width:30px;">${vs.index+1}</td>
				<td id="ROLE_NAMETd${var.ROLE_ID }">${var.ROLE_NAME }</td>
				
				<td>
				<a class="btn btn-mini btn-purple" onclick="editRights('${var.ROLE_ID }');"><i class="icon-pencil"></i>菜单权限</a>
				<c:if test="${var.ROLE_ID!='1'}">
				<a class='btn btn-mini btn-info' title="编辑" onclick="editRole('${var.ROLE_ID }','${var.ROLE_NAME }');"><i class='icon-edit'></i></a>
				<a class='btn btn-mini btn-danger' title="删除" onclick="delRole('${var.ROLE_ID }','c','${var.ROLE_NAME }');"><i class='icon-trash'></i></a>
				</c:if>
				</td>	 
				</tr>
				</c:forEach>	
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center" >没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		
	</div>
	
 <!-- 弹出新增或修改页面 -->

    <div class="reply" id="reply">
	<form action="role/add.do" name="form1" id="form1"  method="post">
		<input name="PARENT_ID" id="parent_id" value="0" type="hidden">
		<input type="hidden" name="ROLE_ID" id="role_id" value="${pd.ROLE_ID}"/>
			<div id="zhongxin" style="margin:20px;">
			<table>
				<tr>
					<td><input type="text" name="ROLE_NAME" id="roleName" placeholder="这里输入名称" title="名称"/></td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<a class="btn btn-mini btn-primary" onclick="send();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="closere();">取消</a>
					</td>
				</tr>
			</table>
			</div>
		</form>
    </div>
    <div class="reply1" id="tree" style="overflow: auto;max-height: 550px;">
    	<div id="trees" style="margin:20px;"> </div>
    	<div style="margin:20px;">
    	<input type="hidden" id="xrole_id">
    	<a class="btn btn-mini btn-primary" onclick="jqchk();">保存</a>
		<a class="btn btn-mini btn-danger" onclick="closere();">取消</a>
    	</div>
    </div>
 <script type="text/javascript">
  
 

</script>
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		<div class="window" id="window"></div>	
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script src="static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript">
		
		//新增组
		function addRole(){
			$("#window").css('display','block');
	        $("#reply").css('display','block');
	        $('#form1').attr("action","role/add.do");
		}
		function send(){
			//$("#prompt").css('display','block');
			$("#form1").submit();
		}
		function closere(){
			$("#window").css('display','none');
		    $("#reply").css('display','none');
		    $("#tree").css('display','none');
		    $('#form1')[0].reset();
		    $('#trees').html("");
		}
		
		//修改
		function editRole(ROLE_ID,ROLE_NAME){
			$("#window").css('display','block');
	        $("#reply").css('display','block');
			$("#role_id").val(ROLE_ID);
			$("#roleName").val(ROLE_NAME);
			$('#form1').attr("action","role/edit.do");
			
		}
		
		//删除
		function delRole(ROLE_ID,msg,ROLE_NAME){
			if(confirm("确定删除"+ROLE_NAME+"吗？")){
				location.href="role/delete.do?ROLE_ID="+ROLE_ID+"&guid="+new Date().getTime();
			}
		}
		
		</script>
		
		<script type="text/javascript">
		
		//选中父栏目同时会勾选其下的子栏目
		function checkStatus(no,chkBox){
			var chks = document.getElementsByTagName('input');
			for(var i=0;i <chks.length;i++){
			if(chks[i].name.toLowerCase() == 'where'){
				if(chks[i].value == chkBox.id){
					//alert(1);
					chks[i].checked = "checked";
					}
				else if(chks[i].id == no){
					//alert(2);
					chks[i].checked = chkBox.checked;
					//checkStatus(chks[i].value,chks[i]);
				}
			}
			}
		}
		//取出checkbox选中的值
		function chk(){
			var obj=document.getElementsByName('where'); //选择所有name="'test'"的对象，返回数组
			//取到对象数组后，我们来循环检测它是不是被选中
			var s='';
			for(var i=0; i<obj.length; i++){
			if(obj[i].checked) s+=obj[i].value+','; //如果选中，将value添加到变量s中
			}
			//那么现在来检测s的值就知道选中的复选框的值了
			alert(s==''?'你还没有选择任何内容！':s);
			}
			
		function jqchk(){ //jquery获取复选框值
			//alert($("#xrole_id").val());
			var chk_value =[];
			$('input[name="where"]:checked').each(function(){
			chk_value.push($(this).val());
			});
			if(chk_value.length==0){
				alert("没有选取任何内容");
			}else{
				//alert(chk_value);
				location.href="role/auth/save?menuIds="+chk_value+"&ROLE_ID="+$("#xrole_id").val();
			}
			//alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);
			} 
		</script>
		<script type="text/javascript">
		function editRights(ROLE_ID){
			//alert("treeMenu:"+treeMenu);
			var treeMenu = [];
			var ad = ['a','b','c'];
			//alert(ad);
			$.ajax({
				type : "POST",
	    		url : "role/getPMenu?ROLE_ID="+ROLE_ID,
	    		data : {},
	    		async : false,
	    		dataType : "json",
	    		success : function(data) {
	    			$.each(data,function(index, pmenu) {
	    				//alert(pmenu['menu_NAME']);
	    				treeMenu.push({ PARENT_ID:1,pid:pmenu['parent_ID'], id:pmenu['menu_ID'],name:pmenu['menu_NAME'],checkstate:pmenu['hasMenu']});
	    				$.each(pmenu.subMenu,function(index, smenu) {
	    					treeMenu.push({ PARENT_ID:2,pid:smenu['parent_ID'],id:smenu['menu_ID'], name:smenu['menu_NAME'],checkstate:smenu['hasMenu'], ico:"res/images/icon_default.gif"});
	    				});
	    			});
	    		}
			});
			//alert("menu:"+menu);
			//alert(menu.length);
			//treeMenu = menu;
			//alert("treeMenu后："+treeMenu);
			$("#window").css('display','block');
	        $("#tree").css('display','block');
	        $("#xrole_id").val(ROLE_ID);
	        //$("#reply1").html(treeview());
	        //建立新树
			 tree = new dTree('tree');
			 tree.config.target = "MainFrame";
			 tree.config.useCookies = false;
			 var selNum = -1;
			 var MENU_URL = "";
			 //根目录
			 tree.add(0,-1,'管理中心', null, null, null, '', '');
			 var count = 0;
			 var pLevelIdArray = new Array();
			 pLevelIdArray[1] = 0;
			 var currLevel = 1;
			 for (var i=0; i<treeMenu.length; i++) {
			 	var item = treeMenu[i];
			 	var itemLevel = item.PARENT_ID;
			 	var id = item.id;
			 	var pid = item.pid;
			 	var checkstate = item.checkstate;
			 	pLevelIdArray[itemLevel+1] = ++count;
			 	if(checkstate==true){
			 		if (item.ico!=null) {
			 			tree.add(count, pLevelIdArray[itemLevel], "<input type='checkbox' checked='checked' style='opacity:1;position:static' name='where' onClick='checkStatus("+id+",this)' value='"+item.id+"' id='"+pid+"'>"+item.name, null, null, null, item.ico);
			 		} else {
			 			tree.add(count, pLevelIdArray[itemLevel], "<input type='checkbox' checked='checked' style='opacity:1;position:static' name='where' onClick='checkStatus("+id+",this)' value='"+item.id+"' id='"+pid+"'>"+item.name);
			 		}
			 	}else{
			 		if (item.ico!=null) {
			 			tree.add(count, pLevelIdArray[itemLevel], "<input type='checkbox' style='opacity:1;position:static' name='where' onClick='checkStatus("+id+",this)' value='"+item.id+"' id='"+pid+"'>"+item.name, null, null, null, item.ico);
			 		} else {
			 			tree.add(count, pLevelIdArray[itemLevel], "<input type='checkbox' style='opacity:1;position:static' name='where' onClick='checkStatus("+id+",this)' value='"+item.id+"' id='"+pid+"'>"+item.name);
			 		}
			 	}	
			 
			 }
			 var d = document.getElementById('trees');//通过id获取div节点对象
			 d.innerHTML = d.innerHTML + tree;//在div中追加内容22323
			 tree.openAll();
			 
	 
		}
		</script>
	</body>
</html>

