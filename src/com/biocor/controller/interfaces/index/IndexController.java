package com.biocor.controller.interfaces.index;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.bannerM.BannerM;
import com.biocor.service.admin.banner.BannerService;
import com.biocor.service.interfaces.index.IndexService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.GetLatAndLngByBaidu;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

/****
 * App 首页数据展示
 * 
 * @author bianyang
 * @date 2016-08-25
 *
 */
@Controller
@RequestMapping(value = "interface/index")
public class IndexController extends BaseController {

	@Resource(name = "indexService")
	private IndexService indexService;
	
	
	@Resource(name = "bannerService")
	private BannerService bannerService;

	/***
	 * 首页信息
	 * 
	 * @param lat
	 *            纬度
	 * @param lng
	 *            经度
	 * @param city
	 *            城市
	 *             * @param param
	 *            城市
	 * @userId 用户ID
	 * @author bianyang
	 *
	 */
	@RequestMapping("detail")
	@ResponseBody
	public ResponseEntity<?> indexDetail(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		PageData pd = new PageData();
		try {
			Map<String, BigDecimal> map= GetLatAndLngByBaidu.getLatAndLngByAddress2(request.getParameter("param"));
			pd = this.getPageData();
			if (request.getParameter("lat") == null || request.getParameter("lat") == ""
					|| "".equals(request.getParameter("lat"))) {
				pd.put("lat", map.get("lat"));
			} else {
				pd.put("lat", request.getParameter("lat"));
			}
			if (request.getParameter("lng") == null || request.getParameter("lng") == ""
					|| "".equals(request.getParameter("lng"))) {
				pd.put("lng", map.get("lng"));
			} else {
				pd.put("lng", request.getParameter("lng"));
			}
			if (request.getParameter("userId") == null || request.getParameter("userId") == ""
					|| "".equals(request.getParameter("userId"))) {

			} else {
				pd.put("userId", request.getParameter("userId"));
			}
			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				pd.put("city", "武汉市");
			} else {
				pd.put("city", request.getParameter("city"));
			}

			// 分页参数
			if (request.getParameter("curpage") == null || request.getParameter("curpage") == ""
					|| "".equals(request.getParameter("curpage"))) {
				pd.put("num", 0);
			} else {
				pd.put("num", (Integer.parseInt(request.getParameter("curpage")) - 1) * General.EVERYPAGE);
			}
			pd.put("everypage", General.EVERYPAGE);
			pd.put("isr", "1");
			// 1.头部轮播图
			List<PageData> listBanner = indexService.findBannerList();
			// 2.商户类型
			List<PageData> listShoptype = indexService.findShoptypeList();
			// 3.中间广告
			PageData BannerC = indexService.findBannerC();
			// 4.商铺推荐
			List<PageData> listShopInfo = indexService.findShopInfoList(pd);
			jsonobj.put("listBanner", listBanner);
			jsonobj.put("listShoptype", listShoptype);
			if (BannerC == null)
				jsonobj.put("BannerC", "");
			else
				jsonobj.put("BannerC", BannerC);
			jsonobj.put("listShopInfo", listShopInfo);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 今日上新店铺
	 * 
	 * @param lat
	 * @param lng
	 * @param city
	 * @param userId
	 * @param everypage
	 * @return
	 */
	@RequestMapping("/shoping_newInfo")
	@ResponseBody
	public ResponseEntity<?> findshoping_newInfo(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			if (request.getParameter("userId") == null || request.getParameter("userId") == ""
					|| "".equals(request.getParameter("userId"))) {
				pd.put("userId", null);
			} else {
				pd.put("userId", request.getParameter("userId"));
			}
			// 分页参数
			if (request.getParameter("curpage") == null || request.getParameter("curpage") == ""
					|| "".equals(request.getParameter("curpage"))) {
				pd.put("num", 0);
			} else {
				pd.put("num", (Integer.parseInt(request.getParameter("curpage")) - 1) * General.EVERYPAGE);
			}
			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				pd.put("city", "武汉市");
			} else {
				pd.put("city", request.getParameter("city"));
			}
			pd.put("everypage", General.EVERYPAGE);
			pd.put("dateDesc", "0");
			// 1.查询最新信息
			List<PageData> listNewShopInfo = indexService.findnewShopInfoList(pd);
			jsonobj.put("listNewShopInfo", listNewShopInfo);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 精选 查询-默认好吃
	 * 
	 * @param page页数
	 * @param city
	 * @return
	 */
	@RequestMapping("/chosen_yummy")
	@ResponseBody
	public ResponseEntity<?> chosen_YummyInfo(HttpServletRequest request, Page page) {
		JSONObject jsonobj = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				pd.put("city", "武汉市");
			} else {
				pd.put("city", request.getParameter("city"));
			}
			pd.put("type", "0");
			page.setPd(pd);
			List<PageData> listYummy = indexService.findindexYummyAndAmusinglistPage(page);
			jsonobj.put("listYummy", listYummy);
			jsonobj.put("totalResult", page.getTotalResult());// 返回总数
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 精选 查询-好玩
	 * 
	 * @return
	 */
	@RequestMapping("/chosen_amusing")
	@ResponseBody
	public ResponseEntity<?> chosen_AmusingInfo(HttpServletRequest request, Page page) {
		JSONObject jsonobj = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				pd.put("city", "武汉市");
			} else {
				pd.put("city", request.getParameter("city"));
			}
			pd.put("type", "1");
			page.setPd(pd);
			List<PageData> listAmusing = indexService.findindexYummyAndAmusinglistPage(page);
			jsonobj.put("listYummy", listAmusing);
			jsonobj.put("totalResult", page.getTotalResult());// 返回总数
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 类型筛选
	 * 
	 * @param shop_typeId
	 *            商铺类型
	 * @param
	 * @return
	 */
	@RequestMapping("/shopType")
	@ResponseBody
	public ResponseEntity<?> findShoping_infoByShopType(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		try {
			List<PageData> listshoptype = indexService.findlistshoptype();
			jsonobj.put("listshoptype", listshoptype);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 搜索查询
	 * 
	 * @param Sort
	 *            排序规则(0:离我最近；1:人气最高)
	 * @param lat
	 *            纬度
	 * @param lng
	 *            经度
	 * @param street
	 *            商圈名称
	 * @param condition
	 *            商铺名称或商铺名称
	 * @param city
	 *            城市
	 * @param shop_typeId
	 *            类型ID
	 * @param request
	 * @param curpage
	 * @return
	 */
	@RequestMapping("/condition")
	@ResponseBody
	public ResponseEntity<?> findShopInfoBycondition(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		try {
			Map<String, BigDecimal> map= GetLatAndLngByBaidu.getLatAndLngByAddress2(request.getParameter("city"));
			PageData pd = new PageData();
			// 商圈
			if (request.getParameter("street") == null || request.getParameter("street") == ""
					|| "".equals(request.getParameter("street"))) {
				pd.put("street", "");
			} else {
				pd.put("street", request.getParameter("street"));
			}
			// 商铺类型
			if (request.getParameter("shop_typeId") == null || request.getParameter("shop_typeId") == ""
					|| "".equals(request.getParameter("shop_typeId"))) {
				pd.put("shop_type", "");
			} else {
				if ("0".equals(request.getParameter("shop_typeId")) || request.getParameter("shop_typeId") == "0") {
					pd.put("shop_type", "");
				} else {
					pd.put("shop_type", request.getParameter("shop_typeId"));
				}
			}
			// 商铺或商品名称
			if (request.getParameter("condition") == null || request.getParameter("condition") == ""
					|| "".equals(request.getParameter("condition"))) {
				pd.put("condition", "");
			} else {
				pd.put("condition", request.getParameter("condition"));
			}
			// 排序参数
			if (request.getParameter("sort") == null || request.getParameter("sort") == ""
					|| "".equals(request.getParameter("sort"))) {
				pd.put("sort", "");
			} else {
				pd.put("sort", request.getParameter("sort"));
			}
			// 经纬度
			if (request.getParameter("lat") == null || request.getParameter("lat") == ""
					|| "".equals(request.getParameter("lat"))) {
				pd.put("lat", map.get("lat"));
			} else {
				pd.put("lat", request.getParameter("lat"));
			}
			if (request.getParameter("lng") == null || request.getParameter("lng") == ""
					|| "".equals(request.getParameter("lng"))) {
				pd.put("lng",  map.get("lng"));
			} else {
				pd.put("lng", request.getParameter("lng"));
			}
			// 分页参数
			if (request.getParameter("curpage") == null || request.getParameter("curpage") == ""
					|| "".equals(request.getParameter("curpage"))) {
				pd.put("num", 0);
			} else {
				pd.put("num", (Integer.parseInt(request.getParameter("curpage")) - 1) * General.EVERYPAGE);
			}

			// 市

			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				pd.put("city", "武汉市");
			} else {
				pd.put("city", request.getParameter("city"));
			}

			pd.put("everypage", General.EVERYPAGE);
			// 1.根据首页选择的类型查询商铺信息
			List<PageData> listShopInfo = indexService.findShopInfoList(pd);
			jsonobj.put("listShopInfo", listShopInfo);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 查询城市下面的区
	 * 
	 * @param lat
	 * @param lng
	 *
	 * @return
	 */
	@RequestMapping("/city_allarea")
	@ResponseBody
	public ResponseEntity<?> findCity_Allarea(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			/*
			 * //经纬度 if(request.getParameter("lat")==null ||
			 * request.getParameter("lat")==""
			 * ||"".equals(request.getParameter("lat"))){ pd.put("lat",
			 * "30.48846126258317"); }else{ pd.put("lat",
			 * request.getParameter("lat")); }
			 * if(request.getParameter("lng")==null ||
			 * request.getParameter("lng")==""
			 * ||"".equals(request.getParameter("lng"))){ pd.put("lng",
			 * "114.41765642657225"); }else{ pd.put("lng",
			 * request.getParameter("lng")); } JSONObject
			 * areaOjt=GetLatAndLngByBaidu.GetAddr(pd.get("lat").toString(),pd.
			 * get("lng").toString());//地区 String
			 * city=areaOjt.getString("city");
			 */
			String city = "";
			if (request.getParameter("city") == null || request.getParameter("city") == ""
					|| "".equals(request.getParameter("city"))) {
				city = "武汉市";
			} else {
				city = request.getParameter("city").toString();
			}
			pd.put("city", city);
			List<PageData> listarea = indexService.findCity_Allarea(pd);
			jsonobj.put("listarea", listarea);
			jsonobj.put("city", city);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 查询区下面的商圈
	 * 
	 * @param areaId
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/area_allstreet")
	@ResponseBody
	public ResponseEntity<?> findArea_Allstreet(HttpServletRequest request) {
		JSONObject jsonobj = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			if (null != request.getParameter("areaName") || "".equals(request.getParameter("areaName")))
				pd.put("areaId", request.getParameter("areaName"));
			else
				pd.put("areaId", request.getParameter("areaId"));
			List<PageData> liststreet = indexService.findArea_Allstreet(pd);
			jsonobj.put("liststreet", liststreet);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonobj).setMsg("获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(jsonobj)
					.setMsg(e.getMessage());
		}
	}

	/***
	 * 首页轮播图跳转地址
	 * 
	 * @param orderId
	 *            排序（根据排序选择类型模板）
	 * @param lat
	 *            纬度
	 * @param lng
	 *            经度
	 * @param banner_Id
	 *            广告ID
	 * @param banner_search
	 *            搜索条件
	 *
	 * @return
	 */
	@RequestMapping("/banner_detail")
	public ModelAndView findbanner_detail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			PageData pd = new PageData();
			// 经纬度
			if (request.getParameter("lat") == null || request.getParameter("lat") == ""
					|| "".equals(request.getParameter("lat"))) {
				pd.put("lat", "30.48846126258317");
			} else {
				pd.put("lat", request.getParameter("lat"));
			}

			if (request.getParameter("lng") == null || request.getParameter("lng") == ""
					|| "".equals(request.getParameter("lng"))) {
				pd.put("lng", "114.41765642657225");
			} else {
				pd.put("lng", request.getParameter("lng"));
			}
			// 筛选条件
			if (request.getParameter("banner_search") == null || request.getParameter("banner_search") == ""
					|| "".equals(request.getParameter("banner_search"))) {

			} else {
				pd.put("banner_search", request.getParameter("banner_search"));
			}
			// 广告 banner_Id
			if (request.getParameter("banner_Id") == null || request.getParameter("banner_Id") == ""
					|| "".equals(request.getParameter("banner_Id"))) {

			} else {
				pd.put("banner_Id", request.getParameter("banner_Id"));
			}
			// 广告 orderId
			if (request.getParameter("orderId") == null || request.getParameter("orderId") == ""
					|| "".equals(request.getParameter("orderId"))) {

			} else {
				pd.put("orderId", request.getParameter("orderId"));
			}
			List<PageData> listssearch = null;
			switch (pd.get("orderId").toString()) {
			case "1":
				mv.setViewName("forward:/res/banner/ban1.jsp");
				pd.put("banSearch", pd.get("banner_search").toString());
				// listssearch=indexService.findListssearch(pd);
				mv.addObject("listssearch", listssearch);
				break;
			case "2":
				pd.put("banSearch", pd.get("banner_search").toString());
				mv.setViewName("forward:/res/banner/ban2.jsp");
				break;
			case "3":
				pd.put("banSearch", pd.get("banner_search").toString());
				mv.setViewName("forward:/res/banner/ban3.jsp");
				// listssearch=indexService.findListssearch(pd);
				break;
			case "4":
				mv.setViewName("redirect:/res/banner/ban4.jsp");
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.toString());

		}
		return mv;
	}
	
	

	 /***
	  * 新版banner
	  * @param request
	  * @param model_id
	  * @return
	  */
	 @RequestMapping("/banner_show")
	 public ModelAndView  findbanner_show(HttpServletRequest request){
		 String model_id= request.getParameter("model_id");
		 ModelAndView mv =new ModelAndView();
		 try {
			 if(model_id=="" ||null==model_id ||model_id=="0" ||"0".equals(model_id)  ){
				  mv.setViewName("redirect:/res/banner/ban4.jsp");
			 }
			 else{
				 if( model_id=="A" ||"A".equals(model_id)  ){
					  mv.setViewName("redirect:/res/banner/ban5.jsp");
				 }else if( model_id=="B" ||"B".equals(model_id)  ){
					  mv.setViewName("redirect:/res/banner/ban6.jsp");
				 }else{
					  PageData pd=new PageData();
					  
					  pd.put("mid", model_id);
					  List<BannerM> mlist =bannerService.findBannerm(pd);
					  BannerM bm=null;
					  if(mlist.size()>0){
						    bm=mlist.get(0);
					  }
					  else{
						  
					  } 
					  mv.addObject("bm", bm);
					  mv.setViewName("forward:/res/banner/ban3.jsp");
				 }
			 }
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return mv;
	 }

}
