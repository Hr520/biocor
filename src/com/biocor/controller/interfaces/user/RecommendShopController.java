package com.biocor.controller.interfaces.user;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.user.RecommendShopService;
import com.biocor.util.Constants;
import com.biocor.util.GetLatAndLngByBaidu;
import com.biocor.util.Location;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

@Controller
@RequestMapping(value="interface/recommendShop")
public class RecommendShopController extends BaseController{
	@Resource(name="recommendShopService")
	private RecommendShopService recommendShopService;
	
	//查询省市区及餐厅类型
	@RequestMapping(value="getPcaAndShopType")
	@ResponseBody
	public ResponseEntity<?> getPcaAndShopType(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> type = new ArrayList<>();
		List<PageData> province = new ArrayList<>();
		List<PageData> city = new ArrayList<>();
		List<PageData> area = new ArrayList<>();
		try {
			type = recommendShopService.getShopType();
			province = recommendShopService.getProvince();
			city = recommendShopService.getCity();
			area = recommendShopService.getArea();
			pd.put("type", type);
			pd.put("province", province);
			pd.put("city", city);
			pd.put("area", area);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//推荐餐厅
	@RequestMapping(value="addRecommendShop")
	@ResponseBody
	public ResponseEntity<?> addRecommendShop(HttpServletRequest request){
		PageData pd = new PageData();
		try {
			String urr_userId = request.getParameter("userid");
			String urr_restaurant_name = request.getParameter("urr_restaurant_name");
			String urr_restaurant_tyepId = request.getParameter("urr_restaurant_tyepId");
			String urr_restaurant_address = request.getParameter("urr_restaurant_address");
			String urr_restaurant_tel = request.getParameter("urr_restaurant_tel");
			Map<String, BigDecimal> map2 = GetLatAndLngByBaidu.getLatAndLngByAddress2(urr_restaurant_address);
			String urr_restaurant_longitude = map2.get("lng").toString();
			String urr_restaurant_latitude = map2.get("lat").toString();
			pd.put("urr_userId", urr_userId);
			pd.put("urr_restaurant_name", urr_restaurant_name);
			pd.put("urr_restaurant_tyepId", urr_restaurant_tyepId);
			pd.put("urr_restaurant_address", urr_restaurant_address);
			pd.put("urr_restaurant_tel", urr_restaurant_tel);
			pd.put("urr_state", 0);
			pd.put("urr_restaurant_longitude", urr_restaurant_longitude);
			pd.put("urr_restaurant_latitude", urr_restaurant_latitude);
			recommendShopService.addRecommendShop(pd);
			pd = new PageData();
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("推荐成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

}
