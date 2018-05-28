package com.biocor.controller.admin.appuser;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.appuser.AppUserService;
import com.biocor.util.Const;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.sun.istack.internal.logging.Logger;

@Controller
@RequestMapping(value = "/appuser")
public class AppUserController extends BaseController {

	Logger logger = Logger.getLogger(AppUserController.class);

	@Resource(name = "appuserService")
	private AppUserService appuserService;

	@RequestMapping(value = "/appUserList")
	public ModelAndView appUserList(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String phone = request.getParameter("phone");

		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}

		PageData pd = new PageData();
		pd.put("phone", phone);

		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = appuserService.findAppUserlistPage(page);

		mv.setViewName("appuser/appuser_list");
		mv.addObject("list", list);
		mv.addObject("phone", phone);
		return mv;
	}

	/**
	 * 店铺主新增店员类
	 *
	 **/
	// 查询店员列表
	@RequestMapping(value = "getShopAnduserlistPage")
	public ModelAndView getShopAnduserlistPage(HttpServletResponse response, HttpServletRequest request, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();
		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		PageData pd = new PageData();
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
		// 获取权限
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		// String role = sessionUser.getROLE_ID();// 角色
		String userid = sessionUser.getUSER_ID();
		// 根据用户id查询到店铺id
		pd.put("userid", userid);
		try {
			String shop_id = appuserService.getSHop_id(pd);
			// 店铺id查询到店员列表
			pd = new PageData();
			pd.put("shop_id", shop_id);
			list = appuserService.getShoAllUser(pd);
			mv.setViewName("shopUser/shopAlluserlist");
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 新增店员跳转页面
	@RequestMapping(value = "jupAddUSer")
	public ModelAndView jupAddUSer(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		// String role = sessionUser.getROLE_ID();// 角色
		String userid = sessionUser.getUSER_ID();
		// 根据用户id查询到店铺id
		pd.put("userid", userid);
		try {
			String shop_id = appuserService.getSHop_id(pd);
			pd.put("shop_id", shop_id);
			mv.setViewName("shopUser/addUser_shp");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 新增店员
	@RequestMapping(value = "addShopUser")
	public ModelAndView addShopUser(HttpServletRequest request, HttpServletResponse response, Page page) {
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		// String role = sessionUser.getROLE_ID();// 角色
		String userid = sessionUser.getUSER_ID();
		// 根据用户id查询到店铺id
		pd.put("userid", userid);
		try {
			String shop_id = appuserService.getSHop_id(pd);
			pd.put("shop_id", shop_id);
			String login_name = request.getParameter("login_name");
			String password = request.getParameter("password");
			String sex = request.getParameter("sex");
			String phone = request.getParameter("phone");
			String age = request.getParameter("age");
			pd.put("login_name", login_name);
			password = new SimpleHash("SHA-1", login_name, password).toString();
			pd.put("password", password);
			pd.put("sex", sex);
			pd.put("phone", phone);
			pd.put("age", age);
			// 新增店员
			appuserService.addShopUser(pd);
			return getShopAnduserlistPage(response, request, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 删除店员
	@RequestMapping(value = "deleteUser")
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response, Page page) {
		PageData pd = new PageData();
		String id = request.getParameter("id");
		pd.put("id", id);
		try {
			// 执行删除店员操作
			appuserService.deleteUser(pd);
			return getShopAnduserlistPage(response, request, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
