package com.biocor.controller.admin.orders;

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
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.orders.OrdersService;
import com.biocor.util.Const;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value = "orders")
public class OrdersController  extends BaseController{

	Logger logger = Logger.getLogger(OrdersController.class);
	
	@Resource(name = "ordersService")
	private OrdersService ordersService;
	
	@RequestMapping(value="/ordersList")
	public ModelAndView ordersList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String orderNo = request.getParameter("orderNo");
		String orderstate=request.getParameter("orderstate");
		//当前页
		if( StringUtil.isNull(curpage) ){
			curpage = "1";
		}
		//每页条数
		if( StringUtil.isNull(showCount) ){
			showCount = "10";
		}
		
		//获取权限
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User sessionUser = (User)session.getAttribute(Const.SESSION_USER);
		String role = sessionUser.getROLE_ID();//角色
		String userid = sessionUser.getUSER_ID();
		
		PageData pd = new PageData();
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		
		if("1".equals(role)){//系统用户
			pd.put("type", 1);
		}else{ //非系统用户
			pd.put("type", 0);
		}
		pd.put("userid", userid);
		pd.put("orderNo", orderNo);
		pd.put("orderstate",orderstate);
		page.setPd(pd);
		list = ordersService.findOrderslistPage(page);
				
		mv.setViewName("orders/orders_list");
		mv.addObject("list", list);
		mv.addObject("orderNo", orderNo);
		pd.put("orderstate",orderstate);
		return mv;
	}
	
	
	
	@RequestMapping(value="/ordersShow")
	public ModelAndView ordersShow(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData res = new PageData();
		
		String orderNo = request.getParameter("orderNo");
		
		//查询订单详情
		PageData pd = new PageData();
		pd.put("orderNo", orderNo);
		res = ordersService.findOrdersInfo(pd);

		//查询订单所有商品
		pd = new PageData();
		pd.put("orderNo", orderNo);
		List<PageData> list = ordersService.findOrdersGoods(pd);
		
		mv.setViewName("orders/orders_show");
		mv.addObject("list", list);
		mv.addObject("pd", res);
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/ordersScan")
	public ModelAndView ordersScan(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("scan/scan");
		return mv;
	}
}
