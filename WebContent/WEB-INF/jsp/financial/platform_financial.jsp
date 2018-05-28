<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">

<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>/res/css/default.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" />
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery.tips.js"></script>
<style type="text/css">
html {
	overflow: auto;
}

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

#tips {
	margin-top: 10px;
	width: 100%;
	height: 40px;
}

#buttonGroup {
	padding-left: 10px;
	float: left;
	height: 35px;
}

.button {
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 14px;
	width: 70px;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	border-color: #77D1F6;
	border-width: 1px;
	border-style: solid;
	border-radius: 6px 6px;
	-moz-box-shadow: 2px 2px 4px #282828;
	-webkit-box-shadow: 2px 2px 4px #282828;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#mainContainer {
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
	width: 98%;
	font-size: 12px;
	height: 600px;
	overflow: yes;
	overflow-y: auto
}

.img {
	width: 40px;
	height: 40px;
}
</style>
<script type="text/javascript" charset="UTF-8">
function down(){
	location.href="platFromdown.do";
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<span><img src="<%=basePath%>/res/images/arror.gif" width="7"
				height="11" border="0" alt=""> </span> &nbsp;财务管理&nbsp; <span>
				<img src="<%=basePath%>/res/images/arror.gif" width="7" height="11"
				border="0" alt=""> </span> &nbsp;平台收益详情&nbsp;
		</div>
	</div>
	<form action="financial/findPlatFromFinancial.do" method="post" id="form0"></form>
	     
     	<div id="tips">
	    <div id="buttonGroup">
		    &nbsp;
		    <a href="javascript:void(0)" onclick="down();">
			   <button type="button"style="width: 60px; height: 30px; background: #0283c5; color: #fff; 
			       border: 1px solid #ccc; border-radius: 4px;">导出</button>
			</a> 
		</div>
		</div>
		<div id="mainContainer">
		    <!--  
			<table class="default" width="100%">
		        
			    <tr class="main_info">
				    <td colspan="4" class="center">平台详情</td>
			    </tr>  
				<tr style="background-color: #77D1F6;">
					<td>总订单金额</td>
					<td>用户总金额</td>
					<td>商户总金额</td>
					<td>平台总金额</td>
				</tr>
				<tr>
				   <td>${pd.total_order_money }</td>
				   <td>${pd.total_user_money }</td>
				   <td>${pd.total_order_shop }</td>
				   <td>${pd.total_platform }</td>
				</tr>
				
				
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">用户详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>用户总金额</td>
				    <td>用户余额</td>
					<td>用户提现金额</td>
					<td></td>
				</tr>
				<tr>
				   <td>${pd.total_user_money }</td>
				   <td>${pd.user_yue }</td>
				   <td>${pd.user_withdraw }</td>
				   <td></td>
				</tr>
				
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">商户详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>商户总金额</td>
					<td>商户提现金额</td>
					<td>商户余额</td>
					<td>未结算金额</td>
				</tr>
				<tr>
				    <td>${pd.total_order_shop }</td>
				    <td>${pd.shop_withdraw }</td>
				    <td>${pd.shop_money }</td>
					<td>${pd.shop_un_commit }</td>
				</tr>
				
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">平台详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>平台总金额</td>
					<td>手续费</td>
					<td>奖金池</td>
					<td>未完成订单金额</td>
				</tr>
				<tr>
				    <td>${pd.total_platform }</td>
				    <td>${pd.total_fee }</td>
				    <td>${pd.pool_money+pd.pool_profit }</td>
					<td>${pd.redundancy_order }</td>
				</tr>
				
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">手续费详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>总手续费金额</td>
					<td>取消订单手续费</td>
					<td>提现手续费</td>
					<td></td>
				</tr>
				<tr>
				    <td>${pd.total_fee }</td>
				    <td>${pd.cancel_fee }</td>
				    <td>${pd.withdraw_fee }</td>
					<td></td>
				</tr>
				
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">奖金池详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>奖金池总金额</td>
					<td>平台盈利(8%)</td>
					<td>奖金池金额(12%)</td>
					<td></td>
				</tr>
				<tr>
				    <td>${pd.pool_money+pd.pool_profit }</td>
				    <td>${pd.pool_money }</td>
				    <td>${pd.pool_profit }</td>
					<td></td>
				</tr>
				
				<tr class="main_info" style="background-color: #77D1F6;">
				    <td colspan="4" class="center">平台详情</td>
				</tr>
				<tr style="background-color: #77D1F6;">
				    <td>平台用户总计</td>
					<td>平台店铺总计</td>
					<td>商品总计</td>
					<td></td>
				</tr>
				<tr>
				    <td>${pd.appusercount }</td>
				    <td>${pd.shopcount }</td>
				    <td>${pd.goodscount }</td>
					<td></td>
				</tr>
				
			</table>
			-->
			<img src="${graphURL1 }"width=800 height=300 border=0 usemap=" ${filename1 }">
			<img src="${graphURL2 }"width=800 height=300 border=0 usemap=" ${filename2 }">
			<img src="${graphURL3 }"width=800 height=300 border=0 usemap=" ${filename3 }">
			<img src="${graphURL4 }"width=800 height=300 border=0 usemap=" ${filename4 }">
			<img src="${graphURL5 }"width=800 height=300 border=0 usemap=" ${filename5 }">
		</div>

</body>
</html>