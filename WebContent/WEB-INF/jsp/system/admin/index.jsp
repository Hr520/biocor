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
<base href="<%=basePath%>">
	<title>山莓后台管理系统</title>
	
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="res/css/style.css" />
    <script type="text/javascript" src="res/js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="res/js/jquery-ui-1.8.16.custom.min.js"></script>
</head>
<style>
.button{
	float:left;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	cursor:pointer;
    border-color: #77D1F6;
    border-width: 1px;
    border-style: solid;
    border-radius: 6px 6px;
    -moz-box-shadow: 2px 2px 4px #282828;
    -webkit-box-shadow: 2px 2px 4px #282828;
    background-image: -moz-linear-gradient(top,#B2DFEE, #B2DFEE);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, #BFBFBF));
}
a:link{
text-decoration:none;
}
a:visited{
text-decoration:none;
}
a:hover{
text-decoration:none;
}
a:active{
text-decoration:none;
}
</style>
<script type="text/javascript">

</script>
 <div id="wrapper">
	<div id="header">
		<div id="logo"><img alt="" src="res/images/logo.png" style="width:45px;height: 45px;"> </div>
		<div id="title">山莓后台管理系统</div>
		<div id="user_info" style="width:350px;">
			<div id="welcome">欢迎 ${USERROL.USERNAME}
			&nbsp;&nbsp;<a href="document/explain.docx" title="说明文档">下载说明文档</a></div>
			<div id="logout">
				 <div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			      <a   href="logout">安全退出</a>
		    </div>
			</div>
		</div>
	</div>
	<div id="navigator">
		 <iframe id="LeftFrame" src="tree.do" ></iframe>
        </div>
	<div id="main">
		<iframe id="MainFrame" name="MainFrame" src="tab.do"></iframe>
	</div>
	<div id="footer">Copyright © 2016 纵索科技</div>
</div>
</body>
<script type="text/javascript">
function screenAdapter(){
	document.getElementById('footer').style.top=document.documentElement.scrollTop+document.documentElement.clientHeight- document.getElementById('footer').offsetHeight+"px";
		document.getElementById('navigator').style.height=document.documentElement.clientHeight-100+"px";
		document.getElementById('main').style.height=document.documentElement.clientHeight-100+"px";
		document.getElementById('main').style.width=window.screen.width-230+"px";
}

window.onscroll=function(){screenAdapter()};
window.onresize=function(){screenAdapter()};
window.onload=function(){screenAdapter()};
$(function() {
    var slideWidth=$("#slide").width();
    $("#slider").draggable({
        axis: 'x',
        containment: 'parent',
        drag: function(event, ui) {
            if (ui.position.left > slideWidth*0.7) {
                $("#slide").fadeOut();
                $("#overlay").fadeOut();
            } else {
                // Apparently Safari isn't allowing partial opacity on text with background clip? Not sure.
                //$("#text").css("opacity", 100 - (ui.position.left / 5));
            }
        },
        stop: function(event, ui) {
            if (ui.position.left < slideWidth*0.7) {
                $(this).animate({left: 0});
            }
        }
    });     
});
</script>
</html>