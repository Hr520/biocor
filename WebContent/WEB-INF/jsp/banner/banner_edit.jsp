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
<title>模版展示</title>

<link href="<%=basePath%>/static/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/banner/view/css/template.css">


<link rel="stylesheet"
	href="<%=basePath%>/static/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- 下拉框-->
<link rel="stylesheet" href="<%=basePath%>/static/css/chosen.css" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/common2.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/res/css/main.css" />

<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/res/banner/view/js/ajaxfileupload.js"></script>



<style type="text/css">
.window {
	width: 90%;
	height: 400px;
	background-color: #FFFFFF;
	position: absolute;
	padding: 2px;
	margin: 5px;
	display: none;
	border: 1px #065FB9 solid;
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

#preview {
	width: 100px;
	height: 60px;
	border: 0 dashed #000;
}

.img1 {
	width: 100px;
	height: 60px;
	padding: 0 20px;
}

.oneline {
	width: 150px;
	display: inline;
}

.imagenamelength {
	width: 15%;
	overflow: hidden;
}

.timg {
	width: 18px;
	height: 18px;
}
</style>


<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB",
		"Microsoft YaHei", Arial, sans-serif;
	color: #333;
}

a {
	text-decoration: none;
	color: #333;
}

a img {
	border: none;
}

ul, li {
	list-style-type: none;
}

img {
	display: block;
	font-size: 0
}

em {
	font-style: normal;
}

.clearfix:after {
	display: block;
	clear: both;
	content: "";
	visibility: hidden;
	height: 0
}

.clearfix {
	zoom: 1
}

.wrapper {
	width: 100%;
	margin: 0 auto;
}
/* .tab-content{
            width:94%;
            margin:0 auto;
        }*/
.tab-top {
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: linear-gradient(#f5f5f5, #e8e8e8, #d7d7d7);
}

.close1 {
	width: 22px;
	height: 22px;
	float: right;
	margin: 9px;
}

.tab-row {
	padding: 10px 0;
	float: left;
	margin-right: 10px;
}

.input-text {
	border-radius: 4px;
	border: 1px solid #eee;
	padding: 5px;
}

.table-bg {
	background: #00a2d4;
}

.table-striped>tbody>tr:nth-of-type(odd) {
	background-color: #f2f2f2;
}

.td{
   height: 25px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;line-height: 25px; 
}

</style>

<script type="text/javascript">
    var temp="";
    var m="${pd.m_order}";
    var shops_str=new Array(); 
    var mt;
    $(function (){
		 var temp='';
		
		//模板显示
		
		var m_title="${pd.m_title}";
		$("#m_"+m).show();
	
		//模板HTML
		//$("shops_bm_html").val();
		
		$("#s_title").text(m_title)
		$("#m_title").val($("#s_title").text());
		//类型
		mt="${pd.m_type}";
		$("#m_type").val(mt)
		//清空列表
		//$("#show_choice").empty();
		$("#show_d").empty();
		
		
	    //加载数据	
	    var bmdList="${pd.bmdList}";
		
		
		$("#currentPage").text(1);
		$.ajax({
			url : '<%=basePath%>/banner/shopTypeselect.do',
			method : 'post',
			dataType : "json",
			success : function(result) {
				$("#sm_stype").empty();
				var strOption = "";
				$.each(result.list, function(index, item) {
					strOption += "<option value='"+item.stid+"'>"
							+ item.st_name + "</option>";
				});
				$("#sm_stype").append("<option value=''>全部</option> "+strOption); //为Select追加一个Option(下拉项) 
			}
		});

	});
    
    
    //删除展示信息
	function delsection(a) {
		$("#" + a).remove()
		 
		$("#" + a + "_" + a).remove()
		 
		if(m=="1"){
			var ls = [];
			var ss = $("#shops_val").val().split(',');
			for ( var i in ss) {
				ls.push(parseInt(ss[i]));
			}
			 
			ls.splice($.inArray(parseInt(a), ls), 1);
			
			$.each(shops_str,function(index,item){  
	            // index是索引值（即下标）   item是每次遍历得到的值；
	           if(item==a){
	                shops_str.splice(index,1);
	           }
	         });
			$("#shops_val").val(ls);  
		}else if(m=="2"){
			$.each(shops_str,function(index,item){  
				 
	            // index是索引值（即下标）   item是每次遍历得到的值；
	            if(parseInt(item)==parseInt(a)){
	            	shops_str.splice(index,1);
	        	    }
	           
	       });
			 
			 $("#shops_val").val(""); 	 
		   $("#" + a + "_" + a).remove();
		} 

	}

	//上传图片
	function uploadImage(type) {
		var imgPath = "";
		var formdata = new FormData();
		var fileObj = null;
		var heigth="";
		var width="";
		if (type == "1") {
			//判断是否有选择上传文件
			imgPath = $("#m_bgImgFile").val();
			if (imgPath == "") {
				alert("请选择上传图片！");
				return;
			}
			fileObj = document.getElementById("m_bgImgFile").files;
			  $("#m_bgImgFile").change(function (e) {
				  var file, img;
				  if ((file = this.files[0])) {
				    img = new Image();
				    img.onload = function () {
				      alert(this.width + " " + this.height);
				    };
				    img.src = _URL.createObjectURL(file);
				  }
				});
			  heigth="984";
				width="720";
		} else if (type == "2") {
			imgPath = $("#m_topImgFile").val();
			if (imgPath == "") {
				alert("请选择上传图片！");
				return;
			}
			fileObj = document.getElementById("m_topImgFile").files;
			
			heigth="330";
			width="720";
		}
		//判断上传文件的后缀名
		var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1)
				.toLowerCase();
		if (strExtension != 'jpg' && strExtension != 'gif'
				&& strExtension != 'png' && strExtension != 'bmp') {
			alert("请选择图片文件");
			return;
		}

		formdata.append("img_file", fileObj[0]);
		formdata.append("img_u", "banner");
		formdata.append("img_name", "img_file");
		formdata.append("width", width);
		formdata.append("heigth", heigth);
		$.ajax({
			url : 'uploadImageHandler',
			type : 'POST',
			data : formdata,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				var  mid=$("#mid").val();
				if(m=="1"){
					if (type == "1") {
						$("#m_bgImg").val(data.img_file);
						//$("#main_adbg").attr("background",data.img_file) ;
						$("#main_adbg").css("background",
								"url(/biocor/" + data.img_file + ") 0/cover");

					} else {
						$("#m_topImg").val(data.img_file);
						$("#all-img").attr('src', "/biocor/" + data.img_file);
					}
				}else if(m=="2"){
					if (type == "1") {
					
						 
						$("#m_bgImg").val(data.img_file);
						//$("#main_adbg").attr("background",data.img_file) ;
						$("#"+mid).css("background",
								"url(/biocor/" + data.img_file + ") 0/cover");

					} else {
						$("#m_topImg").val(data.img_file);
						$("#all-img_"+mid).attr('src', "/biocor/" + data.img_file);
					} 
				}else if(m=="3"){
					if (type == "1") {
						$("#m_bgImg").val(data.img_file);
						$("#m_3bgImg").css("background",
								"url(/biocor/" + data.img_file + ") 0/cover");

					} else {
						$("#m_topImg").val(data.img_file);
						$("#all-img_top").attr('src', "/biocor/" + data.img_file);
					} 
				}

			},
			error : function(returndata) {
				alert(returndata);
			}
		});
	}

	//改变模板标题
	function checktitle() {
		$("#s_title").text($("#m_title").val());
	}
</script>
</head>
<body>
	<div id="navi">
		<div id='naviDiv'>
			<div id="left_div" style="line-height: 40px; float: left">
				<span><img src="<%=basePath%>/res/images/arror.gif"
					style="float: left; margin-top: 15px" width="7" height="11"
					border="0" alt=""> </span> &nbsp;广告管理&nbsp;
			</div>
			<div id="right_div" style="line-height: 40px; float: left">
				<span><img src="<%=basePath%>/res/images/arror.gif"
					style="float: left; margin-top: 15px" width="7" height="11"
					border="0" alt=""></span> &nbsp;广告模板编辑&nbsp;
			</div>

		</div>
	</div>
	<div id="mainContainer"
		style="overflow: auto; height: 500px; padding: 10px;">
		<!-- 模板1 -->
		<div id="m_1" style="display: none">
			<div class="wrapper" id="wrapper">
				<div id="div_edit" class="box-left1">
					<div id="main_adbg" class="main border ad-bg1">
						<div class="wrap" id="wrap_edit">
							<img src="<%=basePath%>${pd.m_topImg}" id="all-img"
								class="all-img"> <input type="hidden" id="bg_img"
								value="<%=basePath%>${pd.m_bgImg}">
							<script type="text/javascript">
									$("#main_adbg").css("background","url(" + $("#bg_img").val() + ")");
							</script>
							<section class="jl-rel center"
								style="width: 80%; margin: 0 auto;">
								<div class="jl-left width35">
									<img src="<%=basePath%>/res/banner/view/images/hr1.png"
										class="all-img">
								</div>
								<div class="jl-mid1">
									<span id="m_title_val"><span id="s_title">${pd.m_title}</span></span>
								</div>
								<div class="jl-right width35">
									<img src="<%=basePath%>/res/banner/view/images/hr2.png"
										class="all-img">
								</div>
							</section>
						</div>
						<div id="show_choice">
							<c:forEach items="${pd.bmdList}" var="ml" varStatus="sv1">
								<section onclick="delsection(${ml.sid})"
									class="s2 pd10 rel mt10 mb10 " id="${ml.sid}_${ml.sid}">
									<div class="sd-left">
										<img src="<%=basePath%>${ml.shop_images}" class="all-img">
										<script type="text/javascript">
										//shops_str=new Array();
										   if(m=="1"){
											   var t='${ml.sid}';
											     shops_str.push(t);
					                             temp=temp+'${ml.sid}'+","; 
										   } 
									 
				                           
				                        </script>
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
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 模板2 -->
		<div id="m_2" style="display: none">
			<div class="wrapper" id="wrapper">
				<div class="wrapper" id="wrapper">
					<div id="div_edit" class="box-left1">
						<div id="${pd.mid}" class="main ad-bg">
							<img src="<%=basePath%>${pd.m_topImg}" class="all-img"
								id="all-img_${pd.mid}"> <input type="hidden"
								id="bg_img_${pd.mid}" value="<%=basePath%>${pd.m_bgImg}">
							<script type="text/javascript">
												var mid='${pd.mid}'	
										  		$("#"+mid).css("background","url(" + $("#bg_img_"+mid).val() + ") 0/cover");
										</script>
							<div class="wrap">
								<c:forEach items="${pd.bmdList}" var="ml" varStatus="sv1">
									<div id="wrap_sect">
										<section class="s2 pd10 clearfix" id="${ml.sid}"
											onclick="delsection(${ml.sid})">

											<script type="text/javascript">
											//shops_str=new Array(); 
											if(m=="2"){
												var t='${ml.sid}';
					                             temp=temp+'${ml.sid}'+",";  
					                                   
					                          var  ls2=[];
					                   		 
					                   		  for(var i in shops_str){
					                   			  ls2.push(parseInt(shops_str[i]));
					                   		  }
					                   		  var isc=$.inArray(parseInt(t),ls2);  //验证数组元素是否存在
					                             if(isc<0){
					                            	 shops_str.push(t);
					                            }else{
					                            	 
					                            	 
					                            }
											}
				                          
				          </script>
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
									</div>
									<section class="s1 mt10 pd10">
										<div class="activity-title">活动详情</div>
										<ul class="activity-ul" id="activity-ul">
											<c:set var="stra" value="${fn:split(pd.m_remark,';')}"></c:set>
											<c:set var="strl" value=" ${fn:length(stra)} "></c:set>
											
											<c:forEach items="${fn:split(pd.m_remark,';')}" var="l"
												varStatus="sv1">
												<%--   var="i" begin="0" end="${strl}" step="1"> --%>
												<li>${l}</li>
											</c:forEach>
										</ul>
									</section>
									<section class="s2 pd10 rel mb10 " id="${ml.sid}_${ml.sid}">
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
															<div class="f-xq" style="">详情</div>
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
				</div>
			</div>
		</div>
		<div id="m_3" style="display: none">
			<div class="wrapper" id="wrapper">
				<div class="wrapper" id="wrapper">
					<div id="div_edit" class="box-left1">
						<div id="m_3bgImg" class="main ad-bg2">
						 <input type="hidden" id="bg_img" value="<%=basePath%>${pd.m_bgImg}">
							<script type="text/javascript">
								var mid='${pd.mid}'	
								$("#m_3bgImg").css("background","url(" + $("#bg_img").val() + ") 0/cover");
							</script>
							<img src="<%=basePath%>${pd.m_topImg}" class="all-img"
								id="all-img_top"> 
						
						
							
							<div class="wrap">
								<div class="ad-title"><span id="mt_title">${pd.m_title}</span> </div>
								<ul class="ad-ul clearfix" id="ul_li_show">
									<c:forEach items="${pd.bmdList}" var="ml" varStatus="sv1">
											<script type="text/javascript">
									   
											if(m=="3"){
												var t='${ml.gid}';
												var t1='${ml.sid}';
						                            shops_str.push(t)
						                            
						                        
											}
				                             </script>
												<c:choose>
													<c:when test="${sv1.index%2==0}">
														<li onclick="remove_li(${ml.gid})" style="margin-right: 5px;box-sizing:border-box;" id="li_${ml.gid}">
																<div class="pd5">
																<img src="<%=basePath%>${ml.goods_images}"
																	class="all-img">
																</div>
																<div class="li-box">
																	<div class="li-div">
																		<h2>${ml.goods_name}</h2>
																		<div>${ml.shop_name}</div>
																		<div>${ml.shop_street}</div>
																	</div>
																	<div class="ptb5 clearfix rel">
																		<div class="del-money">￥${ml.goods_moeny}</div>
																		<div class="r-num">￥${ml.goods_dis_money}</div>
																		<div class="pos-btn">
																			<a href="javascript:;" class="qg-btn">进店抢</a>
																		</div>
																	</div>
																</div>
															 
														</li>
													</c:when>
													<c:when test="${sv1.index%2 !=0}">
														<li onclick="remove_li(${ml.gid})" style="margin-left: 5px;box-sizing:border-box;" id="li_${ml.gid}">
																<div class="pd5">
																<img src="<%=basePath%>${ml.goods_images}"
																	class="all-img">
																</div>
																<div class="li-box">
																	<div class="li-div">
																		<h2>${ml.goods_name}</h2>
																		<div>${ml.shop_name}</div>
																		<div>${ml.shop_street}</div>
																	</div>
																	<div class="ptb5 clearfix rel">
																		<div class="del-money">￥${ml.goods_moeny}</div>
																		<div class="r-num">￥${ml.goods_dis_money}</div>
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
					</div>
				</div>
			</div>
		</div>
		<div class="box-right">
			<form method="post" action="savem.do" id="mform">
				<table class="insert-tab" width="100%">
					<tbody>
						<tr>
							<th width="15%"><i class="require-red"></i>模板背景图片</th>
							<td id="gimgs">
								<div id="addImage">
									<input type="file" style="width: 200px;" name="m_bgImgFile"
										id="m_bgImgFile" onchange="uploadImage(1)"
										class="oneline imagenamelength" /> <input type="hidden"
										name="m_bgImg" id="m_bgImg" value="">
								</div>
							</td>
						</tr>
						<tr>
							<th><i class="require-red"></i>模板头部图片</th>
							<td id="gimgst">
								<div id="addBanImage">
									<input type="file" style="width: 200px;" id="m_topImgFile"
										name="m_topImgFile" onchange="uploadImage(2)"
										class="oneline imagenamelength" /> <span
										style="color: red; font-size: 12px; line-height: 20px">(图片大小建议：720*330)</span>
									<input type="hidden" name="m_topImg" id="m_topImg" value="">
								</div>
								<div id="banPreview" class="oneline"></div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${pd.m_order=='3' || pd.m_order=='1'}">
							<tr>
								<th><i class="require-red"></i>展示标题</th>
								<td><input type="text" id="m_title" name="m_title"
									onblur="checktitle()" /></td>
							</tr>
							</c:when>
						</c:choose>
						<tr>
							<th><i class="require-red"></i>展示类型</th>
							<td><select name="m_type" id="m_type">
									<option value="0">单品</option>
									<option value="1">商家</option>
							</select> <span><a href="javascript:void();" onclick="showInfo()">添加</a>
							</span></td>
						</tr>
						<c:if test="${pd.m_order=='2'}">
							<tr>
								<th><i class="require-red"></i>活动信息</th>
								<td><textarea rows="5" cols="8" id="m_remark"
										name="m_remark" onblur="activtInfo()"> </textarea><span
									style="color: red; font-size: 12px; line-height: 20px">(每条信息后面用分号区分换行)</span>
								</td>
							</tr>
						</c:if>

						<tr>
							<th><i class="require-red"></i>展示信息</th>
							<td>
								<div id="showDetail" style="width: 100%">
									<div id="show_left" style="width: 45%; float: left">
										<div id="show_d"></div>
									</div>
								</div> <input type="hidden" name="shops_val" id="shops_val" value="">
								<input type="hidden" name="shops_bm_html" id="shops_bm_html"
								value=""> <input type="hidden" name="m_No" id="m_No"
								value="${pd.m_No}"> <input type="hidden" name="mid"
								id="mid" value="${pd.mid}">
							</td>
						</tr>
						<tr>
							<th></th>
							<td><input class="btn btn-primary btn6 mr10" value="确定"
								type="button" onclick="savem()"> <input class="btn btn6"
								onclick="history.go(-1)" value="返回" type="button"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="window" id="center">
		<div class="tab-top" id="title">
			<div>
				<img src="<%=basePath%>res/banner/view/images/close.png"
					class="close1">
			</div>
		</div>
		<div class="tab-content">
			<div class="tab-row">
				<label style="float: left;">商铺类型</label> <select id="sm_stype"
					name="sm_stype"></select>
			</div>
			<div class="tab-row">
				<label style="float: left;">商铺名称</label> <input id="sm_name"
					name="sm_name" />
			</div>
			<div class="tab-row">
				<a href="javascript:void(0)" onclick="searchShop();">
					<button type="button"
						style="width: 60px; height: 30px; background: #0283c5; color: #fff; border: 1px solid #ccc; border-radius: 4px;">查询</button>
				</a>
			</div>
			<table class="table table-striped table-bordered" id="show_tab">
				<thead class="table-bg">
					<th><input type="checkbox" value="1"></th>
					<th>商铺名称</th>
					<th>商铺类型</th>
					<th>商铺地址</th>
				</thead>
				<tbody>

				</tbody>
			</table>



		</div>
		<div class="navigation">
			<div class="pagination"
				style="float: left; padding-top: 0px; margin-top: 0px;">
				<ul>
					<li><span>第<span id='currentPage'></span>页
					</span></li>
					<li><span>共<span id='totalPage'></span>页
					</span></li>
					<li><span>每页显示<span id='showCount'>5</span>条
					</span></li>
					<li><span>共<font color=red><span
								id="totalResult"></span></font>条
					</span></li>
				</ul>

			</div>
			<div style="text-align: right; float: right;">
				<a id="first" href="javascript:void(0);" onclick="homePage()">首页</a>
				<a id="previous" href="javascript:void(0);" onclick="upPage()">上一页</a>
				<a id="next" href="javascript:void(0);" onclick="nextPage()">
					下一页</a> <a id="last" href="javascript:void(0);" onclick="ShadowePage()">末页</a>
			</div>
		</div>
	</div>

</body>


<script type="text/javascript">
 
	 $("#shops_val").val(shops_str);
	/* } else if(m=="1"){
	    $("#shops_val").val(temp.substring(0,temp.length-1));
	} */
	//获取窗口的高度 
	var windowHeight;
	//获取窗口的宽度 
	var windowWidth;
	//获取弹窗的宽度 
	var popWidth;
	//获取弹窗高度 
	var popHeight;
    
	

	function init() {
		windowHeight = $(window).height();
		windowWidth = $(window).width();
		popHeight = $(".window").height();
		popWidth = $(".window").width();
	}

	//修改
	function showInfo() {
		var v = $("#m_type").val();
		popCenterWindow(v);
	}

	function popCenterWindow(v) {
		init();
		//计算弹出窗口的左上角Y的偏移量 
		var popY = (windowHeight - popHeight) / 2;
		var popX = (windowWidth - popWidth) / 2;
		//alert('jihua.cnblogs.com'); 
		//设定窗口的位置 
		$("#center").css("top", popY).css("left", popX).slideToggle("slow");

		//展示数据
		if (v == "1") {
			//alert(1)
			//店铺
			searchShop();
		}else{
			//商品
	
			searchGoods();
		}
		
		closeWindow();
	}

    function clickChoice(sid){
     
     var checkbox = document.getElementById("c_"+sid);//
    	 //添加商铺信息
     if(checkbox.checked){
     
    	if(mt=="1"){
    		 var shops_val=$("#shops_val").val().split(',');
        	 if(shops_val==""|| shops_val==null ){
        		 //alert(1)
        		 shops_str.push(sid) ;	
        		 $("#shops_val").val(shops_str); 
        		 showAjax(sid,m);
        	 }else{
        		  var  ls=[];
        		  var ss=$("#shops_val").val().split(',');
        		  for(var i in ss){
        			  ls.push(parseInt(ss[i]));
        		  }
        		  var isc=$.inArray(parseInt(sid),ls);  //验证数组元素是否存在
                  if(isc<0){
                 	 shops_str.push(sid) ;	
                 	 showAjax(sid,m);
                 	 $("#shops_val").val(shops_str); 
                 }else{
                 	 alert("你已选择,请重新选择");
                 	 
                 }
        	 }
        		 
        	 
    	}else{
    		var shops_val=$("#shops_val").val().split(',');
	       	 if(shops_val==""|| shops_val==null ){
	       		 //alert(1)
	       		 shops_str.push(sid) ;	
	       		 $("#shops_val").val(shops_str); 
	       		 showGoodsAjax(sid);
	       	 }else{
	       		  var  ls=[];
	       		  var ss=$("#shops_val").val().split(',');
	       		  for(var i in ss){
	       			  ls.push(parseInt(ss[i]));
	       		  }
	       		  var isc=$.inArray(parseInt(sid),ls);  //验证数组元素是否存在
	                 if(isc<0){
	                	 shops_str.push(sid) ;	
	                	 showGoodsAjax(sid,m);
	                	 $("#shops_val").val(shops_str); 
	                }else{
	                	 alert("你已选择,请重新选择");
	                	 
	                }
	       	 }
    	}
    	
     }else{
    	 if(mt=="1"){
    		 delsection(sid);
    	 }else{
    		 remove_li(sid)
    			 
    	 }	 
     }
    	
    }
    
    function remove_li(gid){
    	 $.each(shops_str,function(index,item){  
			 
	            // index是索引值（即下标）   item是每次遍历得到的值；
	            if(parseInt(item)==parseInt(gid)){
	            	shops_str.splice(index,1);
	        	    }
	       });
			 $("#shops_val").val(shops_str); 
    	 $("#li_"+gid).remove();
    	
    }
    //商品
    function showGoodsAjax(gid){
    	$.ajax({
			url : '<%=basePath%>/banner/goodsdetail.do?gid='+gid,
			method : 'post',
			dataType : "json",
			success : function(result) {
			   var st="";
			    var num=parseInt($("#ul_li_show li").length)+1;
			    if(num%2==0){
			    	st="style='margin-left: 5px;box-sizing:border-box;' ";
			    }else{
			    	st="style='margin-right: 5px;box-sizing:border-box;' ";
			    }
			   
                var li="<li  onclick='remove_li("+result.goods.gid+")' "+st+" id='li_"+result.goods.gid+"'>"+
					  "<div class='pd5'>"+
					  "<img src='<%=basePath%>"+result.goods.goods_images+"' class='all-img'>"+
					  "</div> <div class='li-box'><div class='li-div'>"+
					  "<h2>"+result.goods.goods_name+"</h2><div>"+result.goods.shop_name+"</div>"+
					  "<div>"+result.goods.shop_street+"</div></div>"+
					  "<div class='ptb5 clearfix rel'><div class='del-money'>￥"+result.goods.goods_moeny+"</div>"+
					  "<div class='r-num'>￥"+result.goods.dismoney+"</div>"+
					  "<div class='pos-btn'><a href='javascript:;' class='qg-btn'>进店抢</a>"+
					  "</div></div></div></li>";
		      $("#ul_li_show").append(li);		  
			}
    	});
    } 
    //显示模板列表-商铺
    function showAjax(sid,m){
    	$.ajax({
				url : '<%=basePath%>/banner/Shopdetail.do?shopid='+sid,
				method : 'post',
				dataType : "json",
				success : function(result) {
					var liStr="";
					for(i=0;i<5;i++){
						if(i<result.shop.shop_grade){
							liStr+="<li class='light'><a href='javascript:;'>"+(i+1)+"</a></li>";
						}else{
							liStr+="<li><a href='javascript:;'>"+(i+1)+"</a></li>";
						}
					}
				if(m=="1"){
						
						//alert(result.shop.shop_images.split(",")[0]);
						var sectionStr="<section id='"+sid+"_"+sid+"'  class='s2 pd10 rel mt10 mb10'>"+
							"<div class='sd-left'>"+
							"<img src='<%=basePath%>"+result.shop.shop_images.split(",")[0]+"' onclick='checksection();' class='all-img'></div>"+
							"<div class='sd-mid'><div class='h3'>"+result.shop.shop_name+"</div><div class='sd-mid-content'>"+
							"<ul class='star-ul'>"+liStr+
							"</ul><span>￥"+result.shop.shop_consume+"/人</span></div>"+
							"<div class='lx'>"+result.shop.st_name+"</div></div><div class='sd-right'><div class='r-jl'>吃饭奖励</div><div>"
							+result.shop.shop_street+"</div></div></section>";
						var sectionStr1=" <div id='"+sid+"'> <section   class='s2 pd10 rel mt10 mb10'>"+
							"<div class='sd-left'>"+
							"<img src='<%=basePath%>"+result.shop.shop_images.split(",")[0]+"' onclick='checksection();' class='all-img'></div>"+
							"<div class='sd-mid'><div class='h3'>"+result.shop.shop_name+"</div><div class='sd-mid-content'>"+
							"<ul class='star-ul'>"+liStr+
							"</ul><span>￥"+result.shop.shop_consume+"/人</span></div>"+
							"<div class='lx'>"+result.shop.st_name+"</div></div><div class='sd-right'><div class='r-jl'>吃饭奖励</div><div>"
							+result.shop.shop_street+"</div></div></section><span style='margin-left: 5px;'><a onclick='delsection("+sid+")'>删除</a></span></div>";
						 				
						$("#show_choice").append(sectionStr);
						$("#show_d").append(sectionStr1);
				 }else if(m=="2"){
					 
					 $("#wrap_sect").empty();
					 
					 var sectionStr="<section class='s2 pd10 clearfix' id='"+sid+"' onclick='delsection("+sid+")'>"+
					                 "<img src='<%=basePath%>"+result.shop.shop_images.split(",")[0]+"' class='ban3-pic'>"+
					                 "<div class='ban3-right'><h3 class='ban3-title' style=''>"+result.shop.shop_name+"</h3><div class='ban3-box clearfix'>"+
									 "<ul class='star-ul fl'>"+liStr+
									 "</ul><div class='jw' style='''>￥"+result.shop.shop_consume+" /人</div><div class='mt38 clearfix'>"+
									 "<div class='f-lx' style=''>"+result.shop.st_name+"</div><div class='f-sq' style=''>"+result.shop.shop_street+"</div>"+
								     "</div></div></div><div class='ban3-des' style='''>"+result.shop.shop_introduce+"</div></section>";
					 $("#wrap_sect").append(sectionStr);	
					 $("#shops_val").val(sid)
				 } 
				}
			});
    	
    }
    
    function  searchAjax(param){
    	$.ajax({
    		url:'<%=basePath%>/banner/findShopInfo.do',
			method : 'post',
			data:param,
			dataType : "json",
			success : function(result) {
				$("#show_tab").empty();
				var strtbody="";
				var strthead = " <thead class='table-bg'>"+
                   "<th>&nbsp;</th>"+
                   "<th>商铺名称</th> "+
                   "<th>商铺类型</th> "+
                   "<th>商铺地址</th></thead><tbody >";
				$.each(result.listshopInfo, function(index, item) {
					strtbody+="<tr><td class='td'><input type='checkbox' heigth='40px' id='c_"+item.sid+"' onclick='clickChoice("+item.sid+")' ></td>"+
						"<td class='td'>"+item.shop_name+"</td>"+
                        "<td class='td'>"+item.st_name+"</td>"+
                        "<td class='td'>"+item.shop_adders+"</td></tr>";
				});
				$("#currentPage").text(result.page.currentPage);
				$("#totalPage").text(result.page.totalPage);
				$("#totalResult").text(result.page.totalResult);
				//alert(strthead+strtbody)
				$("#show_tab").append(strthead+strtbody+"</tbody>");  
			}
		});
    }
    //店铺搜索查询
    function searchShop(){
    	var sm_stype=$("#sm_stype").val();
    	var sm_name=$("#sm_name").val();
    	var currentPage=$("#currentPage").text();
    	var showCount=5;
    	
    	var param={sm_stype:sm_stype,sm_name:sm_name,currentPage:currentPage,showCount:showCount};
    	if(mt=="1")
    		searchAjax(param);
		else
			searchAjaxGoods(param);
    	
    }
    
    
    //商品搜索
    function searchGoods(){
    	var sm_stype=$("#sm_stype").val();
    	var sm_name=$("#sm_name").val();
    	var currentPage=$("#currentPage").text();
    	var showCount=5;
    	
    	var param={sm_stype:sm_stype,sm_name:sm_name,currentPage:currentPage,showCount:showCount};
    	searchAjaxGoods(param);
    }
    
    function  searchAjaxGoods(param){
    	 $.ajax({
    		url:'<%=basePath%>/banner/findGoodsInfo.do',
			method : 'post',
			data:param,
			dataType : "json",
			success : function(result) {  
				$("#show_tab").empty();
				var strtbody="";
				var strthead = " <thead class='table-bg'>"+
                   "<th>&nbsp;</th>"+
                   "<th>商铺名称</th> "+
                   "<th>商铺类型</th> "+
                   "<th>商铺地址</th> "+
                   "<th>商品名称</th> "+
                   "<th>商品价格</th></thead><tbody >";
			  $.each(result.listshopInfo, function(index, item) {
					strtbody+="<tr><td class='td'><input type='checkbox'  id='c_"+item.gid+"' onclick='clickChoice("+item.gid+")' ></td>"+
						"<td class='td'>"+item.shop_name+"</td>"+
                        "<td class='td'>"+item.st_name+"</td>"+
                        "<td class='td'>"+item.shop_adders+"</td>"+
                        "<td class='td'>"+item.goods_name+"</td>"+
                        "<td class='td'>"+item.goods_moeny+"</td></tr>";
				}); 
				$("#currentPage").text(result.page.currentPage);
				$("#totalPage").text(result.page.totalPage);
				$("#totalResult").text(result.page.totalResult);  
				$("#show_tab").append(strthead+strtbody+"</tbody>");  
		  	}
		}); 
    }
    
    
	//关闭窗口的方法 
	function closeWindow() {
		$("#title img").click(function() {
			//$(this).parent().parent().hide("slow");
			$("#center").hide("slow");
			$("#sm_stype").val("");
	    	$("#sm_name").val("");
		});
	}
	
	
	
	//下一页	
	function nextPage() {
		var currentPage=$("#currentPage").text();
		var totalPage=$("#totalPage").text();
		if(parseInt(currentPage)+1>=totalPage){
	        currentPage=totalPage;
		}else{
			currentPage=parseInt(currentPage)+1;
		}
		$("#currentPage").text(currentPage)
		if(mt=="1")
			searchShop();
		else
			searchGoods();
	}

	//上一页
	function upPage() {
		var currentPage = $("#currentPage").text();
		var totalPage = $("#totalPage").text();
		if (parseInt(currentPage) - 1 < 1) {
			currentPage = 1;
		} else {
			currentPage = parseInt(currentPage) - 1;
		}
		$("#currentPage").text(currentPage)
		if(mt=="1")
			searchShop();
		else
			searchGoods();
	}
	//首页
	function homePage() {
		$("#currentPage").text(1);
		if(mt=="1")
			searchShop();
		else
			searchGoods();
    }
	//尾页
	//首页
	function ShadowePage() {
		$("#currentPage").text($("#totalPage").text());
		if(mt=="1")
			searchShop();
		else
			searchGoods();
    }
	
	//模板提交
	function savem(){
		/* if($("#m_bgImg").val()==""){
			alert("背景图片不能为空")
			return;
		}
		if($("#m_topImg").val()==""){
			alert("头部图片不能为空")
			return;
		}
		if($("#m_title").val()==""){
			alert("标题不能为空")
			return;
		} */
		$("#mform").submit();
		
	}
	//activtInfo //活动信息
	function activtInfo(){
		$("#activity-ul").empty();
		var a=$("#m_remark").val();
		var actity =a.replace(/；/gm,';').split(';');
		$("#m_remark").val(a.replace(/；/gm,';'));
		var li="";
		 
		if(actity.length>0){
			for ( var i in actity) {
				//ls.push(parseInt(ss[i]));
				li+="<li>"+actity[i]+"</li>";
			}
			$("#activity-ul").append(li);	
		}else{
			$("#activity-ul").append("<li>"+$("#m_remark").val()+"</li>");
		}
	}
</script>
</html>
