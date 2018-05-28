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
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<%-- <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/css/default.css" />
<link href="<%=basePath%>/static/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>/static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css" /> --%>
<!-- page specific plugin styles -->
<%-- <!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/ace-skins.min.css" /> --%>
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery-1.7.2.js"></script>
<%-- <link rel="stylesheet" href="<%=basePath%>/static/css/datepicker.css" /> --%>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/template.css">
<!-- 日期框 -->
<script type="text/javascript"
	src="<%=basePath%>/static/js/jquery.tips.js"></script>
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
</style>
<script type="text/javascript">
	 
</script>
<body style="overflow: auto;height: 600px;">
	<div id="navi" >
		<div id='naviDiv'>
			<div id="left_div" style="line-height: 40px; float: left">
				<span><img src="<%=basePath%>/res/images/arror.gif"
					style="float: left; margin-top: 15px" width="7" height="11"
					border="0" alt=""> </span> &nbsp;广告管理&nbsp;
			</div>
			<div id="right_div" style="line-height: 40px; float: left">
				<span><img src="<%=basePath%>/res/images/arror.gif"
					style="float: left; margin-top: 15px" width="7" height="11"
					border="0" alt=""></span> &nbsp;广告列表&nbsp;
			</div>

		</div>
	</div>
	<form action="banner/bannerList.do" method="post" id="form0"></form>
	<form action="bannerList.do" method="post" id="form1">
			<!-- <div id="tips">
		<div id="buttonGroup">
				<div class="button"
					onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'"
					onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
					<a href="javascript:void" onclick="add()">新增</a>
				</div>

			</div> 
		</div>
-->
		<div id="mainContainer"   >
			  <div class="wrapper">
    <ul class="temp-ul">
   		 
	        <c:forEach items="${mlist}"  var="m" varStatus="vs" >
	         <c:choose>
	        	<c:when test="${m.m_order=='1' }">
	        	<li class="li" >
	        	     <div id="main_adbg"  class="main border ad-bg1">
	        	     	<div class="wrap">
		                    <img src="<%=basePath%>${m.m_topImg}" class="all-img">
		                    <section class="jl-rel center" style="width:80%;margin:10px auto 0;">
		                        <div class="jl-left width35"><img src="<%=basePath%>/res/banner/view/images/hr1.png" class="all-img"></div>
		                        <div class="jl-mid1">${m.m_title}</div>
		                        <div class="jl-right width35"><img src="<%=basePath%>/res/banner/view/images/hr2.png" class="all-img"></div>
		                        <input type="hidden" id="bg_img" value="<%=basePath%>${m.m_bgImg}">
		                    </section>
		                </div>
							   <c:forEach items="${m.bmdList}" var="ml" varStatus="sv1">
								    <section  class="s2 pd10 rel mt10 mb10">
								    	<div class="sd-left">
				                        <img src="<%=basePath%>${ml.shop_images}" class="all-img">
				                    </div>
				                    <div class="sd-mid">
				                        <h3>${ml.shop_name}</h3>
				                        <div class="sd-mid-content">
				                            <ul class="star-ul">
				                                <c:forEach var="i" begin="1" end="5" step="1">   
														<c:if test="${i<=ml.shop_grade}">
																<li class="light"><a href="javascript:;">${i}</a></li>
														</c:if>	 
														<c:if test="${i>ml.shop_grade}">
																<li ><a href="javascript:;">${i}</a></li>
														</c:if>	 
												</c:forEach> 
				                              <!--   <li class="light"><a href="javascript:;">1</a></li>
				                                <li class="light"><a href="javascript:;">2</a></li>
				                                <li class="light"><a href="javascript:;">3</a></li>
				                                <li class="light"><a href="javascript:;">4</a></li> 
				                                <li><a href="javascript:;">5</a></li>-->
				                            </ul>
				                            <span>￥ ${fn:split(ml.shop_consume, ".")[0]}/人</span>
				                        </div>
				                        <div class="lx">${ml.st_name }</div>
				                    </div>
				                    <div class="sd-right">
				                        <div class="r-jl" >吃饭奖励</div>
				                        <div>${ml.shop_street }</div>
				                    </div>
				                   </section>
			                   </c:forEach>
	        	     </div>
		        	 <div class="com-box">
		                <div class="com-title">模版${m.m_order }（单推店铺）</div>
		                <div class="com-btn"><a href="banner_edit.do?mid=${m.mid}">编辑</a></div>
		            </div>
		        </li> 	
		         <script type="text/javascript">
						$("#main_adbg").css("background","url(" + $("#bg_img").val() + ")");
				</script>
				</c:when>
                <c:when test="${m.m_order=='2' }">
               
								
								<li class="li ">
									<div id="${m.mid}" class="main ad-bg">
										 <img src="<%=basePath%>${m.m_topImg}" class="all-img">
										  <input type="hidden" id="bg_img_${m.mid}" value="<%=basePath%>${m.m_bgImg}">
										  <script type="text/javascript">
												var mid='${m.mid}'	
										  		$("#"+mid).css("background","url(" + $("#bg_img_"+mid).val() + ")");
										</script>
										<div class="wrap">
										<c:forEach items="${m.bmdList}" var="ml" varStatus="sv1">
											<section class="s2 pd10 clearfix">
												<img src="<%=basePath%>${ml.shop_images}"
													class="ban3-pic">
												<div class="ban3-right">
													<h3 class="ban3-title" style="">${ml.shop_name}</h3>
													<div class="ban3-box clearfix">
														<ul class="star-ul fl">
																 <c:forEach var="i" begin="1" end="5" step="1">   
																		<c:if test="${i<=ml.shop_grade}">
																				<li class="light"><a href="javascript:;">${i}</a></li>
																		</c:if>	 
																		<c:if test="${i>ml.shop_grade}">
																				<li ><a href="javascript:;">${i}</a></li>
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
												<div class="ban3-des" style="">${ml.shop_introduce}
												</div>
											</section>
											<section class="s1 mt10 pd10">
												<div class="activity-title">活动详情</div>
												<ul class="activity-ul">
												<c:set var="stra" value="${fn:split(m.m_remark,';')}"></c:set> 
												<c:set var="strl" value=" ${fn:length(stra)} "></c:set>
													
													 <c:forEach  items="${fn:split(m.m_remark,';')}" var="l" varStatus="sv1"><%--   var="i" begin="0" end="${strl}" step="1"> --%>
															 <li>${l}</li>
														</c:forEach>  
													</ul>  
											</section>
											<section class="s2 pd10 mb10" >
												<c:forEach items="${ml.listmdg}" var="mg" varStatus="vm">
														<div class=" no_line pb0">
															<img
																src="<%=basePath%>${mg.goods_images}"
																class="ban3-pic">
															<div class="ban3-right">
																<h3 class="ban3-title">${mg.goods_name}</h3>
																<div class="clearfix">
																	<div class="ban3-des1">${ml.shop_name}</div>
																	<div class="mt15 rel clearfix">
																		<div class="f-jg r-color" style="">
																			<em class="em1">￥</em>${mg.goods_dis_money}
																		</div>
																		<div class="f-xq" style="">详情</div>
																	</div>
																</div>
															</div>
														</div>
												</c:forEach>
											</section>
											</c:forEach>
										</div>
									</div>
									<div class="com-box">
										<div class="com-title">模版${m.m_order }（推荐商品）</div>
										<div class="com-btn">
											 <div class="com-btn"><a href="banner_edit.do?mid=${m.mid}">编辑</a></div>
										</div>
									</div>
								</li>
								
							</c:when>
							<c:when test="${m.m_order=='3' }">
								<li class="li">
									<div id="${m.mid}" class="main ad-bg2">
										<img  src="<%=basePath%>${m.m_topImg}"  class="all-img">
										<input type="hidden" id="bg_img_${m.mid}" value="<%=basePath%>${m.m_bgImg}">
										  <script type="text/javascript">
												var mid='${m.mid}'	
										  		$("#"+mid).css("background","url(" + $("#bg_img_"+mid).val() + ")");
										</script>
										<div class="wrap">
											<div class="ad-title"><span>${m.m_title}</span></div>
											<ul class="ad-ul clearfix">
											<c:forEach items="${m.bmdList}" var="l" varStatus="vl">
												<c:choose>
														<c:when test="${sv1.index%2==0}">	
															<li style="margin-right: 5px;box-sizing:border-box;" > <div class="pd5">
																	<img
																		src="<%=basePath%>${l.goods_images}"
																		class="all-img">
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
																			<a href="javascript:;" class="qg-btn">进店抢</a>
																		</div>
																	</div>
																</div>
															 
															</li>
														</c:when>
														<c:when test="${sv1.index%2!=0}">	
															<li style="margin-left: 5px;box-sizing:border-box;" > <div class="pd5">
																	<img
																		src="<%=basePath%>${l.goods_images}"
																		class="all-img">
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
																			<a href="javascript:;" class="qg-btn">进店抢</a>
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
									<div class="com-box">
										<div class="com-title">模版${m.m_order }（推荐店铺）</div>
										<div class="com-btn">
											<a href="banner_edit.do?mid=${m.mid}">编辑</a>
										</div>
									</div>
								</li>
							</c:when>
						</c:choose>
	        </c:forEach>
        <%-- <li class="li" >
            <div class="main ad-bg1">
                <div class="wrap">
                    <img src="<%=basePath%>/res/banner/view/images/banner2.png" class="all-img">
                    <section class="jl-rel center" style="width:80%;margin:10px auto 0;">
                        <div class="jl-left width35"><img src="<%=basePath%>/res/banner/view/images/hr1.png" class="all-img"></div>
                        <div class="jl-mid1">附近商家</div>
                        <div class="jl-right width35"><img src="<%=basePath%>/res/banner/view/images/hr2.png" class="all-img"></div>
                    </section>
                </div>
                <section class="s2 pd10 rel">
                    <div class="sd-left">
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
                <section class="s2 pd10 rel mt10">
                    <div class="sd-left" >
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
                <section class="s2 pd10 rel mt10">
                    <div class="sd-left" style="">
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
                <section class="s2 pd10 rel mt10">
                    <div class="sd-left" style="">
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
                <section class="s2 pd10 rel mt10">
                    <div class="sd-left" style="">
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
                <section class="s2 pd10 rel mt10 mb10">
                    <div class="sd-left" style="">
                        <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img">
                    </div>
                    <div class="sd-mid">
                        <h3>恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚恋尚锅时尚</h3>
                        <div class="sd-mid-content">
                            <ul class="star-ul">
                                <li class="light"><a href="javascript:;">1</a></li>
                                <li class="light"><a href="javascript:;">2</a></li>
                                <li class="light"><a href="javascript:;">3</a></li>
                                <li class="light"><a href="javascript:;">4</a></li>
                                <li><a href="javascript:;">5</a></li>
                            </ul>
                            <span>￥47/人</span>
                        </div>
                        <div class="lx">自助火锅</div>
                    </div>
                    <div class="sd-right">
                        <div class="r-jl" >吃饭奖励</div>
                        <div>光谷天地</div>
                    </div>
                </section>
            </div>
            <div class="com-box">
                <div class="com-title">模版一</div>
                <div class="com-btn"><a href="banner_edit.do">编辑</a></div>
            </div>
        </li> 
        <li class="li ">
            <div class="main ad-bg">
                <img src="<%=basePath%>/res/banner/view/images/banner3.png" class="all-img">
                <div class="wrap">
                    <section class="s2 pd10 clearfix">
                        <img src="<%=basePath%>/res/banner/view/images/list-pic.png" class="ban3-pic">
                        <div class="ban3-right">
                            <h3  class="ban3-title" style="">半秋山西餐厅（意大利风情街）</h3>
                            <div class="ban3-box clearfix" >
                                <ul class="star-ul fl">
                                    <li class="light"><a href="javascript:;">1</a></li>
                                    <li class="light"><a href="javascript:;">2</a></li>
                                    <li class="light"><a href="javascript:;">3</a></li>
                                    <li class="light"><a href="javascript:;">4</a></li>
                                    <li><a href="javascript:;">5</a></li>
                                </ul>
                                <div class="jw" style="">￥47-60/人</div>
                                <div class="mt38 clearfix">
                                    <div class="f-lx" style="">西餐</div>
                                    <div class="f-sq" style="">光谷天地</div>
                                </div>
                            </div>
                        </div>
                        <div class="ban3-des" style="">
                            半秋山西餐厅，武汉最火爆的人气餐厅之一，主要
                        </div>
                    </section>
                    <section class="s1 mt10 pd10">
                        <div class="activity-title">活动详情</div>
                        <ul class="activity-ul">
                            
                        </ul>
                    </section>
                    <section class="s2 pd10 mb10">
                        <div class="ban3-box1 pt0">
                            <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="ban3-pic">
                            <div class="ban3-right">
                                <h3  class="ban3-title">半秋山西餐厅（意大利风情街）</h3>
                                <div class="clearfix" >
                                    <div class="ban3-des1">半秋山西餐厅，武汉最火爆的人气餐厅之一，主要</div>
                                    <div class="mt15 rel clearfix">
                                        <div class="f-jg r-color" style=""><em class="em1" >￥</em>78</div>
                                        <div class="f-xq" style="">详情</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class=" no_line pb0" >
                            <img src="<%=basePath%>/res/banner/view/images/food-img.png" class="ban3-pic">
                            <div class="ban3-right">
                                <h3  class="ban3-title">半秋山西餐厅（意大利风情街）</h3>
                                <div class="clearfix" >
                                    <div class="ban3-des1">半秋山西餐厅，武汉最火爆的人气餐厅之一，主要</div>
                                    <div class="mt15 rel clearfix">
                                        <div class="f-jg r-color" style=""><em class="em1" >￥</em>78</div>
                                        <div class="f-xq" style="">详情</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
            <div class="com-box">
                <div class="com-title">模版二</div>
                <div class="com-btn"><a href="">编辑</a></div>
            </div>
        </li>
        <li class="li">
            <div class="main ad-bg2" >
                <img src="<%=basePath%>/res/banner/view/images/banner4.png" class="all-img">
                <div class="wrap">
                    <div class="ad-title">烧烤烤肉，爽到爆！</div>
                    <ul class="ad-ul clearfix">
                        <li>
                            <div class="pd5"><img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img"></div>
                            <div class="li-box">
                                <div class="li-div">
                                    <h2>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</h2>
                                    <div>蜀香烤鱼</div>
                                    <div>光谷天地（曙光村店）</div>
                                </div>
                                <div class="ptb5 clearfix rel">
                                    <div class="del-money" >￥98.00</div>
                                    <div class="r-num">￥58.00</div>
                                    <div class="pos-btn"><a href="javascript:;" class="qg-btn">进店抢</a></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="pd5"><img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img"></div>
                            <div class="li-box">
                                <div class="li-div">
                                    <h2>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</h2>
                                    <div>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</div>
                                    <div>光谷天地（曙光村店）</div>
                                </div>
                                <div class="ptb5 clearfix rel">
                                    <div class="del-money" >￥98.00</div>
                                    <div class="r-num">￥58.00</div>
                                    <div class="pos-btn"><a href="javascript:;" class="qg-btn">进店抢</a></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="pd5"><img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img"></div>
                            <div class="li-box">
                                <div class="li-div">
                                    <h2>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</h2>
                                    <div>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</div>
                                    <div>光谷天地（曙光村店）</div>
                                </div>
                                <div class="ptb5 clearfix rel">
                                    <div class="del-money" >￥98.00</div>
                                    <div class="r-num">￥128.00</div>
                                    <div class="pos-btn"><a href="javascript:;" class="qg-btn">进店抢</a></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="pd5"><img src="<%=basePath%>/res/banner/view/images/food-img.png" class="all-img"></div>
                            <div class="li-box">
                                <div class="li-div">
                                    <h2>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</h2>
                                    <div>蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼蜀香烤鱼</div>
                                    <div>光谷天地（曙光村店）</div>
                                </div>
                                <div class="ptb5 clearfix rel">
                                    <div class="del-money" >￥98.00</div>
                                    <div class="r-num">￥58.00</div>
                                    <div class="pos-btn"><a href="javascript:;" class="qg-btn">进店抢</a></div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="com-box">
                <div class="com-title">模版三</div>
                <div class="com-btn"><a href="">编辑</a></div>
            </div>
        </li>--%>
    </ul>

</div>

		</div>
	</form>
</body>
<script type="text/javascript">

	 
</script>

</html>