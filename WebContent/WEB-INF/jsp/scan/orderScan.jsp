<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
function configOrder(orderNo){

	$.ajax({
		type: "POST",
		url: 'updateScanOrder',
    	data: {
    		orderNo:orderNo,
    		tm:new Date().getTime()
    	},
		dataType:'json',
		cache: false,
		success: function(data){
	
			if("success" == data.state){
				$("#configId").html("确认");
				$("#configButton").html("<input class=\"btn btn-primary btn6 mr10\" onclick=\"print("+orderNo+")\" value=\"打印\" type=\"button\">");
				$("#orderState").html("已消费");
				if(confirm("确定打印凭条吗？")){
					print(orderNo);
				}
			}
		}
	});
}
function print(orderNo){
	
	$.ajax({
		type: "POST",
		url: 'print/info',
    	data: {
    		orderNo:orderNo,
    		tm:new Date().getTime()
    	},
		dataType:'json',
		cache: false,
		success: function(data){
			var locationurl = (window.location+"").split("/interface")[0];
			location.href= locationurl + "/orders/ordersScan.do";
		}
	});
	
}
</script>
<body>
	<div id="navi">
		<div id='naviDiv'>
			
		    &nbsp;订单管理&nbsp; 
		    
		</div>
	</div>
	<div class="result-wrap">
		<div class="result-content">
			<form method="post" id="form" action="goodAdd.do">
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th width="10%"><i class="require-red"></i>店铺名</th>
							<td>${pd.order_shopName }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>订单号</th>
							<td>${pd.order_no }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>订单类型</th>
							<td><c:choose>
							        <c:when test="${pd.order_type==0 }">预定点餐</c:when>
							        <c:when test="${pd.order_type==1 }">点餐</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>订单金额</th>
							<td>${pd.order_money }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>订单时间</th>
							<td>${pd.order_date }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>支付类型</th>
							<td>
							    <c:choose>
							        <c:when test="${pd.order_pay_type==0 }">现金</c:when>
							        <c:when test="${pd.order_pay_type==1 }">支付宝</c:when>
							        <c:when test="${pd.order_pay_type==2 }">微信</c:when>
							        <c:when test="${pd.order_pay_type==3 }">余额</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>支付状态</th>
							<td>
							    <c:choose>
							        <c:when test="${pd.order_pay_state == 0 }">未付款</c:when>
							        <c:when test="${pd.order_pay_state == 1 }">付款成功</c:when>
							        <c:when test="${pd.order_pay_state == 2 }">付款失败</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>支付时间</th>
							<td>${pd.order_pay_date }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>下单用户</th>
							<td>${pd.user_name }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>订单状态</th>
							<td id="orderState">
							    <c:choose>
							        <c:when test="${pd.order_state == 0 }">未付款</c:when>
							        <c:when test="${pd.order_state == 1 }">已付款</c:when>
							        <c:when test="${pd.order_state == 2 }">已消费</c:when>
							        <c:when test="${pd.order_state == 3 }">已删除</c:when>
							        <c:when test="${pd.order_state == 4 }">退款中</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>就餐时间</th>
							<td>${pd.order_repast_date }</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>确认订单</th>
							<td id="configId">
							    <c:choose>
							        <c:when test="${pd.order_confirm_state == 0 }">未确认</c:when>
							        <c:when test="${pd.order_confirm_state == 1 }">确认</c:when>
							    </c:choose>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>菜单</th>
							<td>
							    <table>
							         <tr>
							             <td>菜品名称</td>
							             <td>点餐数量</td>
							             <td>菜品单价</td>
							             <td>菜品小计</td>
							         </tr>
							         <c:forEach items="${list }" var="o">
							         <tr>
							             <td>${o.od_goodsName }</td>
							             <td>${o.od_goodsNum }</td>
							             <td>${o.od_goods_Pmoeny }</td>
							             <td>${o.od_goods_Smoeny }</td>
							         </tr>
							         </c:forEach>
							    </table>
							</td>
						</tr>
						
						<tr>
							<th></th>
							<td id="configButton">
							<c:choose>
							    <c:when test="${pd.order_confirm_state == 0 }">
							        <input class="btn btn-primary btn6 mr10"
								        onclick="configOrder('${pd.order_no}')" value="确认" type="button">
							    </c:when>
							    <c:when test="${pd.order_confirm_state == 1 }">
							        <input class="btn btn-primary btn6 mr10"
								        onclick="print('${pd.order_no}')" value="打印" type="button">
							    </c:when>
							</c:choose>	
						    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
						  </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>