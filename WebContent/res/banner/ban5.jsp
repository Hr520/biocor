<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>招商详情</title>
<link rel="stylesheet" type="text/css" href="css/ad-content.css">
</head>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	(function() {
		window.alert = function(name) {
			var iframe = document.createElement("IFRAME");
			iframe.style.display = "none";
			iframe.setAttribute("src", 'data:text/plain');
			document.documentElement.appendChild(iframe);
			window.frames[0].window.alert(name);
			iframe.parentNode.removeChild(iframe);
		}
	})();

	function save() {
		if (check()) {
			var shop_name = $("#shop_name").val();
			var shop_type = $("#shop_type").val();
			var shop_adress = $("#shop_adress").val();
			var shop_phone = $("#shop_phone").val();
			$.ajax({
				url :'<%=basePath%>/interface/notice/shopAdd.do?shop_name='
						+ shop_name + "&" + "shop_type=" + shop_type + "&"
						+ "shop_adress=" + shop_adress + "&" + "shop_phone="
						+ shop_phone,
				type : 'POST',
				dataType : 'json',
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					if (data.state == '0') {
						alert("成功")
						document.getElementById("from").reset();
					}
				},
				error : function(returndata) {
					alert("错误");
				}
			});

		}
	}
	function check() {
		var shop_name = $("#shop_name").val();
		var shop_type = $("#shop_type").val();
		var shop_adress = $("#shop_adress").val();
		var shop_phone = $("#shop_phone").val();
		var reg = /^[01][234578][0-9]{9}$/;
		if (shop_name == "") {
			alert("请输入商家名称");
			return false;
		}
		if (shop_type == "") {
			alert("请输入商家类型");
			return false;
		}
		if (shop_adress == "") {
			alert("请输入详细地址");
			return false;
		}
		if (shop_phone == "") {
			alert("请输入联系电话");
			return false;
		} else if (!reg.test(shop_phone)) {
			alert("请输入正确的手机号码");
			return false;
		}
		return true;
	}
	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串 
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for (var i = 0; i < strs.length; i++) {
				theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}
	function share() {
		location.href = "xxx";

	}
</script>
<body style="background: #FCF0CA">
	<img src="images/title-img.png" class="all-img">
	<div class="wrap">
		<div class="main">
			<div class="main-row">
				<h2 class="sj-title">关于商家招募通知</h2>
				<ul class="sj-ul">
					<li>山莓app正式上线了，现招募诚信商家，我们的目标是有钱大家一起赚，我们能为餐饮企业解决五大经营痛点：</li>
					<li>1.全程无线自助，降低人工成本，提高预订与点菜效率。顾客通过手机APP可以全程自助完成预定+点菜+结账，降低每个环节的等待时间，提升餐馆服务效率。</li>
					<li>2.开拓性商业模式，坐享分红，营收不再单一依靠门店流水。所有餐厅的会员，在其他商家（吃喝玩乐行业）消费，该餐厅可获得山莓的定期返利。</li>
					<li>3.基于互联网用户大数据的免费会员营销系统。不仅方便的帮您管理自有会员还免费为商户共享了用户关于“吃”层面的大数据，对于提升核心用户的服务质量起到关键辅助作用。</li>
					<li>4.将生意做到用户手机中。您可以随时随地发送需要的促销信息，新菜品上架消息，甚至跟你的会员聊天，没有任何制作成本，管理方便。</li>
					<li>5.一站式解决所有需求的CRM，解决采购难，备货难，管理难，推广难，招聘难等等痛点，只要您有经营痛点，我们都会努力的提供解决方案。</li>

				</ul>
			</div>
			<div class="main-row">
				<h2 class="sj-title pd10">商家加盟申请</h2>
				<form id="from" name="from">
					<div class="input-box">
						<input type="text" id="shop_name" class="input-text"
							placeholder="商家名称">
					</div>
					<div class="input-box">
						<input type="text" id="shop_type" class="input-text"
							placeholder="商家类型">
					</div>
					<div class="input-box">
						<input type="text" id="shop_adress" class="input-text"
							placeholder="详细地址">
					</div>
					<div class="input-box">
						<input type="text" id="shop_phone" class="input-text"
							placeholder="联系电话">
					</div>
					<input type="button" class="btn" value="提交申请" onclick="save()">
				</form>
			</div>

		</div>
	</div>
	<a href="javascript:;" class="share-btn" onclick="share()">分享一下</a>

</body>
</html>