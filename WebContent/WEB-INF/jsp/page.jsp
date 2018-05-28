<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path1 + "/";
%>
<html>
<body>
<script type="text/javascript">
function nextPage(page) {
	var currentPage=$("#currentPage").text();
	var totalPage=$("#totalPage").text();
	if(parseInt(currentPage)+1>=totalPage){
        currentPage=totalPage;
	}else{
		currentPage=parseInt(currentPage)+1;
	}
	var url = document.forms[0].getAttribute("action");
	document.location = url;
	url = "<%=basePath1%>"+url +"?currentPage=" +currentPage + "&showCount=10";
	$("#currentPage").text(currentPage);
	document.forms[0].action = url;
	document.forms[0].submit();
									 
}
function upPage(page) {
    var currentPage=$("#currentPage").text();
	var totalPage=$("#totalPage").text();
	if(parseInt(currentPage)-1<1){
		currentPage=1;
	}else{
		currentPage=parseInt(currentPage)-1;
	}
										 
	var url = document.forms[0].getAttribute("action");
	document.location = url;
	url = "<%=basePath1%>"+url +"?currentPage=" +currentPage + "&showCount=10";
	$("#currentPage").text(currentPage);
	document.forms[0].action = url;
	document.forms[0].submit();
}
function homePage() {
	var url = document.forms[0].getAttribute("action");
	document.location = url;
	url = "<%=basePath1%>"+url +"?currentPage=1&showCount=10";
	$("#currentPage").text(currentPage);
	document.forms[0].action = url;
	document.forms[0].submit();
}
function ShadowePage() {
	var totalPage=$("#totalPage").text();
	var url = document.forms[0].getAttribute("action");
	document.location = url;
	url = "<%=basePath1%>"+url +"?currentPage="+totalPage+"&showCount=10";
	$("#currentPage").text(currentPage);
	document.forms[0].action = url;
	document.forms[0].submit();
}
function changeCount(value) {
	var currentPage=$("#currentPage").text();
	var url = document.forms[0].getAttribute("action");
	document.location = url;
	url = "<%=basePath1%>"+url +"?currentPage="+currentPage+"&showCount="+value;
	$("#currentPage").text(currentPage);
	document.forms[0].action = url;
	document.forms[0].submit();
}
function toTZ() {
	var toPaggeVlue = document.getElementById("toGoPage").value;
	if (toPaggeVlue == '') {
		document.getElementById("toGoPage").value = 1;
		return;
	}
	if (isNaN(Number(toPaggeVlue))) {
		document.getElementById("toGoPage").value = 1;
		return;
	}
	nextPage(toPaggeVlue);
}
</script>
<div class="page-header position-relative">
	<table style="width: 100%;">
		<tr>
			<td style="vertical-align: top;">
			<div class="pagination" 
			    style="float: right; padding-top: 0px; margin-top: 0px;">
				<ul>
				    <li><span>第<span id='currentPage'>${page.currentPage}</span>页</span></li>
					<li><span>共<span id='totalPage'>${page.totalPage}</span>页</span></li>
					<li>
					    <select id='showCount' title='显示条数' style="width: 55px; float: left;"
							onchange="changeCount(this.value)" >
							<option value='10' <c:if test="${page.showCount ==10 }">selected="selected"</c:if> >10</option>
							<option value='20' <c:if test="${page.showCount ==20 }">selected="selected"</c:if> >20</option>
							<option value='40' <c:if test="${page.showCount ==40 }">selected="selected"</c:if> >40</option>
						</select>
					</li>
					<li><span>共<font color=red>${page.totalResult}</font>条</span></li>
					<li style="cursor: pointer;">
					    <a onclick="homePage()">首页</a></li>
					<li style="cursor: pointer;">
					    <a onclick="upPage(${page.currentPage})">上页</a></li>
					<li style="cursor: pointer;">
					    <a onclick="nextPage(${page.currentPage})">下页</a></li>
					<li style="cursor: pointer;">
					    <a onclick="ShadowePage()">尾页</a></li>
					<li> 
					    <input type="number" value="" id="toGoPage" style="width: 50px; 
					        text-align: center; float: left" placeholder="页码" /></li>
					<li style="cursor: pointer;">
					    <a onclick="toTZ();" class="btn btn-mini btn-success">跳转</a></li>
				</ul>
			</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>