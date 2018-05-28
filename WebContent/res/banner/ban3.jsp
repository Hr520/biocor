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
<title>活动详情</title>


<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/template.css">
<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/ajaxfileupload.js"></script>


</head>
<script type="text/javascript">
	$(function() {
		$("#${bm.m_order}").css('display', 'block');
	});
</script>
<body>
	<div id="1" style="display: none;">
		<div class="wrapper" id="wrapper">
			<div id="div_edit" class="box-left">
				<div id="main_adbg" class="main border ad-bg1">
					<div class="wrap" id="wrap_edit">
						<img src="<%=basePath%>${bm.m_topImg}" id="all-img"
							class="all-img"> <input type="hidden" id="bg_img"
							value="<%=basePath%>${bm.m_bgImg}">
						<script type="text/javascript">
									$("#main_adbg").css("background","url(" + $("#bg_img").val() + ")");
							</script>
						<section class="jl-rel center" style="width: 80%; margin: 0 auto;">
							<div class="jl-left width35">
								<img src="<%=basePath%>/res/banner/view/images/hr1.png"
									class="all-img">
							</div>
							<div class="jl-mid1">
								<span id="m_title_val"><span id="s_title">${bm.m_title}</span></span>
							</div>
							<div class="jl-right width35">
								<img src="<%=basePath%>/res/banner/view/images/hr2.png"
									class="all-img">
							</div>
						</section>
					</div>shanmei.518klg.cn:8080
					<div id="show_choice">
						<c:forEach items="${bm.bmdList}" var="ml" varStatus="sv1">
						   <a href="http://shanmei.518klg.cn:8080/upload/html/index.html?id=${ml.sid}">
							<section onclick="delsection(${ml.sid})" 
								class="s2 pd10 rel mt10 mb10 " id="${ml.sid}_${ml.sid}">
								<div class="sd-left">
									<img src="<%=basePath%>${ml.shop_images}" class="all-img">
								</div>
								<div class="sd-mid">
									<h3>
										<span style="display: none;" id="shops_val_temp">${ml.sid}</span>${ml.shop_name}</h3>
									<div class="sd-mid-content">
										<ul class="star-ul">
											<c:forEach var="i" begin="1" end="5" step="1">
												<c:if test="${i<=ml.shop_grade}">
													<li class="light"><a href="javascript:;">${i}</a></li>
												</c:if>
												<c:if test="${i>ml.shop_grade}">
													<li><a href="javascript:;">${i}</a></li>
												</c:if>
											</c:forEach>
										</ul>
										<span>￥ ${fn:split(ml.shop_consume, ".")[0]}/人</span>
									</div>
									<div class="lx">${sm.st_name }</div>
								</div>
								<div class="sd-right">
									<div class="r-jl">吃饭奖励</div>
									<div>${sm.st_name }</div>
								</div>
							</section>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="2" style="display: none;">
		<div class="main ad-bg" id="m_2bgImg">
			<img src="<%=basePath%>${bm.m_topImg}" class="all-img"> <input
				type="hidden" id="2bg_img" value="<%=basePath%>${bm.m_bgImg}">
			<script type="text/javascript">
				$("#m_2bgImg").css("background",
						"url(" + $("#2bg_img").val() + ") 0/cover");
			</script>
			<div class="wrap">
				<c:forEach items="${bm.bmdList}" var="ml" varStatus="sv1">
					<section class="s2 pd10 clearfix">
						<img src="<%=basePath%>${ml.shop_images}" class="ban3-pic">
						<div class="ban3-right">
							<h3 class="ban3-title" style="">${ml.shop_name}</h3>
							<div class="ban3-box clearfix">
								<ul class="star-ul fl">
									<c:forEach var="i" begin="1" end="5" step="1">
										<c:if test="${i<=ml.shop_grade}">
											<li class="light"><a href="javascript:;">${i}</a></li>
										</c:if>
										<c:if test="${i>ml.shop_grade}">
											<li><a href="javascript:;">${i}</a></li>
										</c:if>
									</c:forEach>
								</ul>
								<div class="jw" style="">￥${fn:split(ml.shop_consume, ".")[0]}/人</div>
								<div class="mt38 clearfix">
									<div class="f-lx" style="">${ml.st_name }</div>
									<div class="f-sq" style="">${ml.shop_street}</div>
								</div>
							</div>
						</div>
						<div class="ban3-des" style="">${ml.shop_introduce}</div>
					</section>
					<section class="s1 mt10 pd10">
						<div class="activity-title">活动详情</div>
						<ul class="activity-ul" id="activity-ul">
							<c:set var="stra" value="${fn:split(bm.m_remark,';')}"></c:set>
							<c:set var="strl" value=" ${fn:length(stra)} "></c:set>
							
							<c:forEach items="${fn:split(bm.m_remark,';')}" var="l"
								varStatus="sv1">
								<%--   var="i" begin="0" end="${strl}" step="1"> --%>
								<li>${l}</li>
							</c:forEach>
						</ul>
					</section>
					<section class="s2 pd10 mb10">
						<c:forEach items="${ml.listmdg}" var="mg" varStatus="vm">
							<div class=" no_line pb0">
								<img src="<%=basePath%>${mg.goods_images}" class="ban3-pic">
								<div class="ban3-right">
									<h3 class="ban3-title">${mg.goods_name}</h3>
									<div class="clearfix">
										<div class="ban3-des1">${ml.shop_name}</div>
										<div class="mt15 rel clearfix">
											<div class="f-jg r-color" style="">
												<em class="em1">￥</em>${mg.goods_dis_money}
											</div>
											<div class="f-xq" style="">
											<a href="http://shanmei.518klg.cn:8080/upload/html/index.html?id=${ml.sid}">
												详情
											</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


					</section>
					<div style="padding: 1px"></div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="3" style="display: none;">
		<div class="main ad-bg2" id="m_3bgImg">
			<input type="hidden" id="bg_img" value="<%=basePath%>${bm.m_bgImg}">
			<script type="text/javascript">
				$("#m_3bgImg").css("background",
						"url(" + $("#bg_img").val() + ") 0/cover");
			</script>
			<img src="<%=basePath%>${bm.m_topImg}" class="all-img">
			<div class="wrap">
				<div class="ad-title">${bm.m_title}</div>
				<ul class="ad-ul clearfix">
					<c:forEach items="${bm.bmdList}" var="l" varStatus="vl">
						<c:choose>
							<c:when test="${sv1.index%2==0}">
								<li style="margin-right: 5px; box-sizing: border-box;">
									<div class="pd5">
										<img src="<%=basePath%>${l.goods_images}" style ="width:100%;height:160px;">
									</div>

									<div class="li-box">
										<div class="li-div">
											<h2>${l.goods_name}</h2>
											<div>${l.shop_name}</div>
											<div>${l.shop_street}</div>
										</div>
										<div class="ptb5 clearfix rel">
											<div class="del-money">￥${l.goods_moeny}</div>
											<div class="r-num">￥${l.goods_dis_money}</div>
											<div class="pos-btn">
												<a href="http://shanmei.518klg.cn:8080/upload/html/index.html?id=${l.sid}" class="qg-btn">进店抢</a>
											</div>
										</div>
									</div>

								</li>
							</c:when>
							<c:when test="${sv1.index%2!=0}">
								<li style="margin-left: 5px; box-sizing: border-box;">
									<div class="pd5">
										<img src="<%=basePath%>${l.goods_images}" style ="width:100%;height:160px;">
									</div>

									<div class="li-box">
										<div class="li-div">
											<h2>${l.goods_name}</h2>
											<div>${l.shop_name}</div>
											<div>${l.shop_street}</div>
										</div>
										<div class="ptb5 clearfix rel">
											<div class="del-money">￥${l.goods_moeny}</div>
											<div class="r-num">￥${l.goods_dis_money}</div>
											<div class="pos-btn">
												<a href="http://shanmei.518klg.cn:8080/upload/html/index.html?id=${l.sid}" class="qg-btn">进店抢</a>
											</div>
										</div>
									</div>

								</li>
							</c:when>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>