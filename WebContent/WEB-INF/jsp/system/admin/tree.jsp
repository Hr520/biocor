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
<head>
	<title>导航树</title>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<style type="text/css">@import url('res/components/dtree/dtree.css');</style>
	<script type="text/javascript">var dtreeIconBasePath = "res/components/dtree";</script>
	<script type="text/javascript" src="res/components/dtree/dtree.js"></script>
	<script src="res/js/jquery.min.js"></script>
	<style>
	html { overflow: auto; } 
	* {
	    background: none repeat scroll 0 0 transparent;
	    border: 0 none;
	    margin: 0;
	    padding: 0;
	    vertical-align: baseline;
		font-family:微软雅黑;
		overflow:hidden;
	}
	#menuControll{
		width:100%;
		word-wrap:break-word;
		border-bottom:1px solid #065FB9;
		margin:0;
		padding:0 10px;
		font-size:14px;
		height:40px;
		line-height:40px;
		vertical-align:middle;
	    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
	    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, 
	#BFBFBF));
	}
</style>
</head>
<body>
<script type="text/javascript">
/*
var menu = '${menuList}'
var menutree;
var submenu;
alert(menu[0].MENU_NAME)
for(var i=0;i<'${menuList.size()}';i++){
	menutree = "{ PARENT_ID:1, name:"+${menuList.get(i).getMENU_NAME()}+"},";
	for(var j=0,submenu=menu.get(i).getSubMenu();j<submenu.length;j++){
		menutree +="{ PARENT_ID:2, name:"+submenu.get(j).getMENU_NAME()+", ico:'res/images/icon_default.gif',MENU_URL:"+submenu.get(j).getMENU_URL()+"},";
	}
}*/

	treeMenu = [
				<c:forEach items="${allmenuList}" var="list" varStatus="vs">
					<c:if test="${list.hasMenu=='true'}">
					{ PARENT_ID:1, name:"${list.MENU_NAME}"},
						<c:forEach items="${list.subMenu}" var="subList" varStatus="cs">
						<c:if test="${subList.hasMenu=='true'}">
						{ PARENT_ID:2, name:"${subList.MENU_NAME}", ico:"res/images/icon_default.gif",MENU_URL:"${subList.MENU_URL}"},
						</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
				];
				
/*
var qx = '${sessionUser.ROLE_ID}';
var user_id = '${sessionUser.USER_ID}';
var treeMenu;
if(qx==1){
	
	treeMenu = [
	            	{ PARENT_ID:1, name:"系统管理"},
	            	{ PARENT_ID:2, name:"管理员管理", ico:"res/images/icon_default.gif",MENU_URL:"user/listUsers.do"},
	            	{ PARENT_ID:2, name:"用户管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userList.do"},
	            	{ PARENT_ID:2, name:"用户水印管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userWaterImageList.do"},
	            	{ PARENT_ID:2, name:"用户水印申请管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userWaterImageApply.do"},
	            	{ PARENT_ID:2, name:"用户金币管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userGoldRecord.do"},
	            	{ PARENT_ID:2, name:"用户文章制作管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userArticle.do"},
	            	{ PARENT_ID:2, name:"广告推广管理", ico:"res/images/icon_default.gif",MENU_URL:"advertrole/advertRoleList.do"},
	            	{ PARENT_ID:2, name:"推广申请管理", ico:"res/images/icon_default.gif",MENU_URL:"advertApply/getAdvertApplyList.do"},
	            	{ PARENT_ID:2, name:"公告与消息管理", ico:"res/images/icon_default.gif",MENU_URL:"notice/getNoticeList.do"},
	            	{ PARENT_ID:2, name:"分享管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userShareList.do"},
	            	{ PARENT_ID:2, name:"支付记录", ico:"res/images/icon_default.gif",MENU_URL:"appuser/orderFlow.do"},
	            	{ PARENT_ID:2, name:"反馈管理", ico:"res/images/icon_default.gif",MENU_URL:"appuser/feedBack.do"},
	            	{ PARENT_ID:1, name:"素材库管理"},
	            	{ PARENT_ID:2, name:"水印管理", ico:"res/images/icon_default.gif",MENU_URL:"waterimage/waterImageList.do"},
	            	{ PARENT_ID:2, name:"字体管理", ico:"res/images/icon_default.gif",MENU_URL:"font/fontList.do"},
	            	{ PARENT_ID:2, name:"图片素材管理", ico:"res/images/icon_default.gif",MENU_URL:"material/materialList.do"},
	            	{ PARENT_ID:2, name:"海报模板管理", ico:"res/images/icon_default.gif",MENU_URL:"poster/getPosterList.do"},
	            	{ PARENT_ID:2, name:"贴纸管理", ico:"res/images/icon_default.gif",MENU_URL:"sticker/stickerList.do"},
	            ];
	
}else{
	treeMenu = [
					{ PARENT_ID:1, name:"系统管理"},
					{ PARENT_ID:2, name:"个人信息", ico:"res/images/icon_default.gif",MENU_URL:"user/listUsers.do?USER_ID="+user_id},
	            	{ PARENT_ID:1, name:"设计师"},
	            	{ PARENT_ID:2, name:"用户水印申请", ico:"res/images/icon_default.gif",MENU_URL:"appuser/userWaterImageApply.do?USER_ID="+user_id},
	            ];
}
*/

</script>
<div id="menuControll">
菜单控制:【<a href="#" onclick="tree.openAll();this.blur();return false;" style="color:#333333;text-decoration:none">展开</a>】
【<a href="#" onclick="tree.closeAll();this.blur();return false;" style="color:#333333;text-decoration:none">折叠</a>】
</div>
<div class="dtree" style="margin:10px;">
<script type="text/javascript"> 
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
	pLevelIdArray[itemLevel+1] = ++count;
	if (item.MENU_URL!=null && item.MENU_URL!="") {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.MENU_URL, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.MENU_URL);
		}
	} else {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, null, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name);
		}
	}
	if (item.select) {
		selNum = count;
		MENU_URL = item.MENU_URL;
	}
}
document.write(tree);
tree.openAll();
if (selNum != -1) {
	tree.openTo(selNum,true);
	top.document.frames["MainFrame"].location.href=MENU_URL;
}
</script>
</div>
</body>
</html>
 