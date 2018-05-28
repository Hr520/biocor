package com.biocor.controller.admin.good;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.good.GoodService;
import com.biocor.util.Const;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value = "/good")
public class GoodController extends BaseController {

	Logger logger = Logger.getLogger(GoodController.class);

	@Resource(name = "goodService")
	private GoodService goodService;

	@RequestMapping(value = "/goodList")
	public ModelAndView goodList(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String goodName = request.getParameter("goodName");
		String shopName = request.getParameter("shopName");
		String goods_ISshelves=request.getParameter("goods_ISshelves");
		String goods_type=request.getParameter("goods_type");
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

		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		PageData pd = new PageData();
		if ("1".equals(role)) {// 系统用户
			pd.put("type", 1);
		} else { // 非系统用户
			pd.put("type", 0);
		}
		pd.put("goods_type", goods_type);
		pd.put("goods_ISshelves",goods_ISshelves);
		pd.put("userid", userid);
		pd.put("goodName", goodName);
		pd.put("shopName", shopName);
		page.setPd(pd);
		list = goodService.findGoodlistPage(page);

		// 所有商品类型
		List<PageData> goodtype = goodService.findAllGoodType(new PageData());
		 
		mv.setViewName("good/good_list");
		mv.addObject("list", list);
		mv.addObject("goodtype", goodtype);
		mv.addObject("goodName", goodName);
		mv.addObject("goods_ISshelves",goods_ISshelves);
		mv.addObject("goods_type",goods_type);
		return mv;
	}

	/**
	 * 添加前
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/befAdd")
	public ModelAndView befAdd(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();

		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();

		// 根据用户ID查询店铺信息
		PageData pd = new PageData();
		pd.put("userid", userid);
		pd = goodService.findShopByUserid(pd);
		// 商品类型列表
		List<PageData> typelist = goodService.findAllGoodType(new PageData());

		mv.setViewName("good/good_add");
		mv.addObject("pd", pd);
		mv.addObject("typelist", typelist);
		return mv;
	}

	/**
	 * 新增商品
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodAdd")
	public ModelAndView goodAdd(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {

		String goods_sid = request.getParameter("goods_sid");
		String goods_gtid = request.getParameter("goods_gtid");
		String goods_name = request.getParameter("goods_name");
		String goods_moeny = request.getParameter("goods_moeny");
		String goods_dis_money = request.getParameter("goods_dis_money");
		String goods_taste = request.getParameter("goods_taste");
		String goods_up_shelves = request.getParameter("starttime");
		String goods_dw_shelves = request.getParameter("endtime");
		String goods_remark = request.getParameter("remark");
		String goods_time = request.getParameter("goods_time");

		String[] good_urlsArr = request.getParameterValues("good_urls");
		String goods_images = "";
		if (good_urlsArr != null) {
			for (int i = 0; i < good_urlsArr.length; i++) {
				goods_images += good_urlsArr[i] + ",";
			}
			goods_images = goods_images.substring(0, goods_images.length() - 1);
		}

		PageData pd = new PageData();
		pd.put("goods_name", goods_name);
		pd.put("goods_moeny", goods_moeny);
		pd.put("goods_dis_money", goods_dis_money);
		pd.put("goods_images", goods_images);
		pd.put("goods_gtid", goods_gtid);
		pd.put("goods_sid", goods_sid);
		pd.put("goods_createdate", DateUtil.getTime());
		pd.put("goods_ISrecommend", "0");
		pd.put("goods_remark", goods_remark);
		pd.put("goods_taste", goods_taste);
		pd.put("goods_ISshelves", "2");// 新增商品 禁用状态
		pd.put("goods_up_shelves", goods_up_shelves);
		pd.put("goods_dw_shelves", goods_dw_shelves);
		pd.put("goods_time", goods_time);
		goodService.addGood(pd);
		return goodList(request, response, page);
	}

	/**
	 * 商品编辑
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodEdit")
	public ModelAndView goodEdit(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		String gid = request.getParameter("gid");
		pd.put("gid", gid);
		pd = goodService.findGoodBySid(pd);

		// 商品类型列表
		List<PageData> typelist = goodService.findAllGoodType(new PageData());

		mv.setViewName("good/good_edit");
		mv.addObject("typelist", typelist);
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 更新商品
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodUpdate")
	public ModelAndView goodUpdate(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {

		String gid = request.getParameter("gid");
		String goods_sid = request.getParameter("goods_sid");
		String goods_gtid = request.getParameter("goods_gtid");
		String goods_name = request.getParameter("goods_name");
		String goods_moeny = request.getParameter("goods_moeny");
		String goods_dis_money = request.getParameter("goods_dis_money");
		String goods_taste = request.getParameter("goods_taste");
		String goods_up_shelves = request.getParameter("starttime");
		String goods_dw_shelves = request.getParameter("endtime");
		String goods_remark = request.getParameter("remark");
		String goods_time = request.getParameter("goods_time");

		String[] good_urlsArr = request.getParameterValues("good_urls");
		String goods_images = "";
		if (good_urlsArr != null) {
			for (int i = 0; i < good_urlsArr.length; i++) {
				goods_images += good_urlsArr[i] + ",";
			}
			goods_images = goods_images.substring(0, goods_images.length() - 1);
		}

		PageData pd = new PageData();
		pd.put("gid", gid);
		pd.put("goods_name", goods_name);
		pd.put("goods_moeny", goods_moeny);
		pd.put("goods_dis_money", goods_dis_money);
		pd.put("goods_images", goods_images);
		pd.put("goods_gtid", goods_gtid);
		pd.put("goods_sid", goods_sid);
		pd.put("goods_createdate", DateUtil.getTime());
		pd.put("goods_remark", goods_remark);
		pd.put("goods_taste", goods_taste);
		pd.put("goods_up_shelves", goods_up_shelves);
		pd.put("goods_dw_shelves", goods_dw_shelves);
		pd.put("goods_time", goods_time);
		goodService.updateGood(pd);
		return goodList(request, response, page);
	}

	/**
	 * 禁用商品
	 * 售罄商品
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goodDel")
	public ModelAndView goodDel(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		String gid = request.getParameter("gid");
		String state = request.getParameter("state");
		PageData pd = new PageData();
		pd.put("gid", gid);
		pd.put("state", state);
		goodService.deleteGood(pd);
		return goodList(request, response, page);
	}

	// admin查询所有店铺的新的请求上架菜品0未启用状态
	@RequestMapping(value = "getallShopNewgoodslistPage")
	public ModelAndView getallShopNewgoodslistPage(HttpServletRequest request, HttpServletResponse response,
			Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();
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
			list = goodService.getallShopNewgoodslistPage(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("good/systemgoodlist");
		mv.addObject("list", list);
		return mv;
	}

	// admin启用审核通过启用商品
	@RequestMapping(value = "/goodagreen")
	public ModelAndView goodagreen(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		String gid = request.getParameter("gid");
		String state = request.getParameter("state");
		PageData pd = new PageData();
		pd.put("gid", gid);
		pd.put("state", state);
		goodService.deleteGood(pd);
		return getallShopNewgoodslistPage(request, response, page);
	}

	
}
