package com.biocor.controller.admin.shop;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.shop.ShopService;
import com.biocor.service.admin.shop.TradAreaService;
import com.biocor.util.Const;
import com.biocor.util.GetLatAndLngByBaidu;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.biocor.util.UuidUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/shop")
public class ShopController extends BaseController {

	Logger logger = Logger.getLogger(ShopController.class);

	@Resource(name = "shopService")
	private ShopService shopService;

	@Resource(name = "tradAreaService")
	private TradAreaService tradAreaService;

	/**
	 * 店铺列表
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shopList")
	public ModelAndView shopList(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String shopName = request.getParameter("shopName");
		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}

		// 获取权限
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String role = sessionUser.getROLE_ID();// 角色
		String userid = sessionUser.getUSER_ID();

		PageData pd = new PageData();
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));

		if ("1".equals(role)) {// 系统用户
			pd.put("type", 1);
		} else { // 非系统用户
			pd.put("type", 0);
		}
		pd.put("userid", userid);
		pd.put("shopName", shopName);
		page.setPd(pd);
		list = shopService.findShoplistPage(page);

		// 店铺类型
		List<PageData> typelist = shopService.findAllShopType(new PageData());

		mv.setViewName("shop/shop_list");
		mv.addObject("list", list);
		mv.addObject("typelist", typelist);
		mv.addObject("shopName", shopName);
		return mv;
	}

	/**
	 * 编辑店铺
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shopEdit")
	public ModelAndView shopEdit(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		String sid = request.getParameter("sid");
		pd.put("shopid", sid);
		pd = shopService.findShopBySid(pd);

		// 店铺类型
		List<PageData> typelist = shopService.findAllShopType(new PageData());

		// 所有省
		List<PageData> list = new ArrayList<PageData>();
		list = tradAreaService.findAllProvince(new PageData());

		mv.setViewName("shop/shop_edit");
		mv.addObject("typelist", typelist);
		mv.addObject("list", list);
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 修改店铺 ajax
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "shopUpdate")
	@ResponseBody
	public Map<String, Object> updateShopInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = this.getPageData();
		try {
			String sid = request.getParameter("sid");
			String shop_name = request.getParameter("shop_name");
			String shop_consume = request.getParameter("shop_consume");

			String shop_province = request.getParameter("shop_province");
			String shop_city = request.getParameter("shop_city");
			String shop_area = request.getParameter("shop_area");
			String shop_street = request.getParameter("shop_street");
			String shop_time = request.getParameter("shop_time");
			String shop_type = request.getParameter("shop_type");
			// 其他费用暂时定为餐位费
			int shop_seat_money = 0;
			String shop_seat_name = request.getParameter("shop_seat_name");
			String shop_money = request.getParameter("shop_seat_money");
			if (shop_money != null && !shop_money.equals("")) {
				shop_seat_money = Integer.parseInt(shop_money);
			} else {
				shop_seat_money = 0;
			}

			String shop_adders = request.getParameter("shop_adders");
			String shop_tel = request.getParameter("shop_tel");
			String shop_activity = request.getParameter("shop_activity");
			String shop_draw = request.getParameter("shop_draw");
			String shop_introduce = request.getParameter("shop_introduce");
			String remark = request.getParameter("remark");
			String machine_code = request.getParameter("machine_code");
			String mKey = request.getParameter("mKey");

			String[] shop_urlsArr = request.getParameterValues("shop_urls");
			JSONObject map2 = GetLatAndLngByBaidu.addressToGPS(shop_adders, shop_name);
			// Map<String, BigDecimal> map2 =
			// GetLatAndLngByBaidu.getLatAndLngByAddress2(shop_adders);
			logger.info("经纬度:" + map2.toString());
			String shop_x = map2.get("lng").toString();
			String shop_y = map2.get("lat").toString();

			String shop_urls = "";
			if (shop_urlsArr != null) {
				for (int i = 0; i < shop_urlsArr.length; i++) {
					shop_urls += shop_urlsArr[i] + ",";
				}
				shop_urls = shop_urls.substring(0, shop_urls.length() - 1);
			}

			pd.put("sid", sid);
			pd.put("shop_name", shop_name);
			pd.put("shop_consume", shop_consume);
			pd.put("machine_code", machine_code);
			pd.put("mKey", mKey);
			pd.put("shop_seat_name", shop_seat_name);
			pd.put("shop_seat_money", shop_seat_money);
			pd.put("shop_province", shop_province);
			pd.put("shop_city", shop_city);
			pd.put("shop_area", shop_area);
			pd.put("shop_street", shop_street);
			pd.put("shop_time", shop_time);
			pd.put("shop_type", shop_type);

			pd.put("shop_adders", shop_adders);
			pd.put("shop_tel", shop_tel);
			pd.put("shop_images", shop_urls);
			pd.put("shop_activity", shop_activity);
			pd.put("shop_draw", shop_draw);
			pd.put("shop_longitude", shop_x);
			pd.put("shop_latitude", shop_y);
			pd.put("remark", remark);
			pd.put("shop_introduce", shop_introduce);

			shopService.updateShop(pd);

			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}

	/**
	 * 禁用店铺
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shopDel")
	public ModelAndView shopDel(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		String sid = request.getParameter("sid");
		String state = request.getParameter("state");
		PageData pd = new PageData();
		pd.put("shopid", sid);
		pd.put("state", state);
		shopService.deleteShop(pd);
		return shopList(request, response, page);
	}

	/**
	 * 推荐店铺
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shopCommend")
	public ModelAndView shopCommend(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		String sid = request.getParameter("sid");
		String state = request.getParameter("state");
		PageData pd = new PageData();
		pd.put("shopid", sid);
		pd.put("state", state);
		shopService.commendShop(pd);
		return shopList(request, response, page);
	}

	/**************************************************************************/

	/**
	 * 图片上传 Ajax
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "uploadImg")
	@ResponseBody
	public Map<String, Object> uploadImg(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String image = "";
		String img_name = "";
		try {
			String img_u = request.getParameter("img_u");
			img_name = request.getParameter("img_name");
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			// 获取文件
			CommonsMultipartFile imageFile = (CommonsMultipartFile) multipartHttpServletRequest.getFile(img_name);
			String imgname = UuidUtil.get32UUID();
			String fileName = imageFile.getOriginalFilename();
			String prefix = fileName.substring(fileName.lastIndexOf("."));
			fileName = imgname + prefix;

			String str = request.getSession().getServletContext().getRealPath("/");
			String url = str + "upload/img/" + img_u + "/";
			File targetFile = new File(url, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			imageFile.transferTo(targetFile);

			image = "upload/img/" + img_u + "/" + fileName;
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		map.put(img_name, image);
		return map;
	}

	// 查询用户意见反馈
	@RequestMapping(value = "getShopUseropinionlistPage")
	public ModelAndView getShopUseropinionlistPage(HttpServletRequest request, HttpServletResponse response,
			Page page) {
		ModelAndView mv = this.getModelAndView();
		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));

		try {
			List<PageData> list = new ArrayList<>();
			list = shopService.getShopUseropinionlistPage(page);
			mv.setViewName("shop/shopuseropinion");
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 删除店铺意见反馈
	@RequestMapping(value = "delShopoption")
	public ModelAndView delShopoption(HttpServletResponse response, HttpServletRequest request, Page page) {
		try {
			String id = request.getParameter("id");
			// 删除
			PageData pd = new PageData();
			pd.put("id", id);
			shopService.delShopoption(pd);
			return getShopUseropinionlistPage(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
