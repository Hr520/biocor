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
import com.biocor.service.admin.prize.PrizeService;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.util.Const;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.biocor.util.push.JPushshanmei;

@Controller
@RequestMapping(value = "orders")
public class OrderBackController extends BaseController {

	Logger logger = Logger.getLogger(OrderBackController.class);

	@Resource(name = "ordersService")
	private OrdersService ordersService;

	@Resource(name = "prizeService")
	private PrizeService prizeService;
	@Resource
	private ShameiShopUserService shop;

	@Resource
	private ShopAndorderService shopAndorderService;

	@RequestMapping(value = "/orderBackList")
	public ModelAndView orderBackList(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String orderNo = request.getParameter("orderNo");

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
		pd.put("orderNo", orderNo);
		page.setPd(pd);
		list = ordersService.findOrderBacklistPage(page);

		mv.setViewName("orders/orderback_list");
		mv.addObject("list", list);
		mv.addObject("orderNo", orderNo);

		return mv;
	}

	@RequestMapping(value = "/ordersReturn")
	public ModelAndView ordersReturn(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {

		String id = request.getParameter("id");

		PageData res = new PageData();
		// 根据退订ID查询退订详情
		PageData pd = new PageData();
		pd.put("tuid", id);
		res = ordersService.findOrdersReturnInfo(pd);

		// 更改订单状态
		pd = new PageData();
		String order_no = res.get("order_no").toString();
		pd.put("orderNo", res.get("order_no"));
		pd.put("state", "5");
		// 查询订单金额
		PageData pd2 = ordersService.getOrder_money(pd);
		String order_money = pd2.get("order_money").toString();
		// String shop_id = pd2.get("order_sid").toString();
		ordersService.updateOrderState(pd);

		// 余额增加
		pd = new PageData();
		pd.put("money", res.get("cancel_moeny"));
		pd.put("userid", res.get("cancel_userid"));
		// pd.put("order_getIntegral", pd2.get("order_getIntegral").toString());
		// pd.put("order_Growth", pd2.get("order_Growth").toString());
		ordersService.updateUserMoney(pd);
		// // 添加用户积分增加记录
		// pd = new PageData();
		// pd.put("ui_userid", res.get("cancel_userid"));
		// pd.put("ui_integral_type", 4);
		// pd.put("ui_integral_score",-Integer.parseInt(pd2.get("order_getIntegral").toString()));
		// pd.put("ui_sid", shop_id);
		// pd.put("ui_ISsid", 1);
		// shopAndorderService.insertJifeninfo(pd);
		// 取消订单成功后写入用户金额明细记录表
		pd.put("uw_userId", res.get("cancel_userid"));
		pd.put("uw_money", order_money);
		pd.put("uw_type", 6);
		ordersService.insertuserwithdraw_info(pd);

		// 奖金池金额减少
		List<PageData> list = prizeService.findPrizePoollistPage(page);
		PageData prizepd = list.get(0);// 奖金池对象

		pd = new PageData();// 订单详情
		pd.put("orderNo", res.get("order_no"));
		pd = ordersService.findOrdersInfo(pd);

		double money = 0;
		double profit = 0;
		double bp_distributable = Double.parseDouble(prizepd.get("bp_distributable").toString());
		String type = res.get("cancel_type").toString();
		double order_money1 = Double.parseDouble(pd.get("order_money").toString());
		if ("0".equals(type)) {
			money = order_money1 * 0.12;
			profit = order_money1 * 0.08;
		} else if ("1".equals(type)) {
			money = order_money1 * 0.12 * 0.9;// 付永军说改为0.9
			profit = order_money1 * 0.08 * 0.9;// 付永军说改为0.9
		} else if ("2".equals(type)) {
			money = order_money1 * 0.12 * 0.7;
			profit = order_money1 * 0.08 * 0.7;
		}

		double total = Double.parseDouble(prizepd.get("bp_money").toString());
		double total_min = Double.parseDouble(prizepd.get("bp_min_money").toString());
		double total_dis_min = Double.parseDouble(prizepd.get("bp_distributable_min").toString());

		if (bp_distributable - money >= 0) {
			bp_distributable = bp_distributable - money;
		} else {
			if (total - money > total_min && total - money < total_dis_min) {
				bp_distributable = bp_distributable - money + (total_dis_min - total_min);
			}
		}

		pd = new PageData();
		pd.put("money", money);
		pd.put("profit", profit);
		pd.put("bp_distributable", bp_distributable);
		pd.put("bpid", prizepd.get("bpid"));
		ordersService.updatePrizePool(pd);

		// 更改申请状态
		pd = new PageData();
		pd.put("tuid", id);
		pd.put("state", "0");
		ordersService.updateReturnState(pd);

		/**
		 * 店铺系统推送
		 */
		// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
		PageData pdr = new PageData();
		pdr.put("order_no", order_no);
		// 查询店主tag
		String shoptag = shop.getShoppertag(pdr);
		String content = order_no + "订单已取消";
		// 执行往数据库中添加数据
				/**
				 * 拿到需要的数据 写入数据库中 1
				 */
				PageData pd3 = new PageData();
				pd3.put("order_no", order_no);
				String shop_id = shop.getJPushneedInfo(pd3);
				pd3 = new PageData();
				pd3.put("order_no", order_no);
				pd3.put("shop_id", shop_id);
				pd3.put("state", 0);
				pd3.put("sendobject", 1);// 注1为店主
				pd3.put("type", 2);// 类型取消订单
				pd3.put("title", "取消订单");
				pd3.put("content", content);
				shop.sendJpush(pd3);

				/*** 写入数据库成功后执行推送 先查询出店铺的核销订单通知是否开启 ***/
				pd = new PageData();
				pd.put("shop_id", shop_id);
				String push = shop.getShoppush(pd);
				// 将json字符串转json对象
				org.json.JSONObject jstr = new org.json.JSONObject(push);
				int cancel = Integer.parseInt(jstr.get("cancel").toString());
				if (cancel > 0) {
					// 表示该功能开启执行推送否则不推送
					JPushshanmei.sendByAlias(content, shoptag);
				}
		List<PageData> listr = new ArrayList<>();
		// 店员tag
		listr = shop.getUsertag(pdr);
		if(listr.size()>0){
			//推送给店员
			String usertag = "";
			usertag = listr.get(0).get("tag_name").toString();
			// 执行推送

			/* 2写入店员 */
			pd3 = new PageData();
			pd3.put("order_no", order_no);
			pd3.put("shop_id", shop_id);
			pd3.put("state", 0);
			pd3.put("sendobject", 2);// 注2为店员
			pd3.put("type", 2);// 类型取消订单
			pd3.put("title", "取消订单");
			pd3.put("content", content);
			shop.sendJpush(pd3);
			 cancel = Integer.parseInt(jstr.get("cancel").toString());
			if (cancel > 0) {
				// 表示该功能开启执行推送否则不推送
				JPushshanmei.sendByAlias(content, usertag);
			}
		}
		return orderBackList(request, response, page);
	}
}
