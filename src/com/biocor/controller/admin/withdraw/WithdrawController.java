package com.biocor.controller.admin.withdraw;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.withdraw.WithdrawService;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.util.ObjectExcelView;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.biocor.util.push.JPushshanmei;

@Controller
@RequestMapping(value = "/withdraw")
public class WithdrawController extends BaseController {

	Logger logger = Logger.getLogger(WithdrawController.class);

	@Resource(name = "withdrawService")
	private WithdrawService withdrawService;
	@Resource
	private ShameiShopUserService shop;

	/**
	 * 用户提现列表
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdrawList")
	public ModelAndView withdrawList(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String type = request.getParameter("type");

		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}

		PageData pd = new PageData();
		pd.put("type", type);
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = withdrawService.findWithDrawlistPage(page);

		mv.setViewName("withdraw/withdraw_list");
		mv.addObject("list", list);
		return mv;
	}

	/**
	 * 改变前
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/befChange")
	public ModelAndView befChange(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();

		String orderNo = request.getParameter("orderNo");
		mv.setViewName("withdraw/withdraw_edit");
		mv.addObject("orderNo", orderNo);
		return mv;
	}

	/**
	 * 更改状态
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withDrawUpdate")
	public ModelAndView withDrawUpdate(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {

		String orderNo = request.getParameter("orderNo");
		String state = request.getParameter("state");
		String remark = request.getParameter("remark");

		PageData pd = new PageData();
		pd.put("orderNo", orderNo);
		pd.put("state", state);
		pd.put("remark", remark);
		withdrawService.updateWithDraw(pd);

		return withdrawList(request, response, page);
	}

	/***********************************************************************/

	/**
	 * 商铺提现列表
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withdrawShopList")
	public ModelAndView withdrawShopList(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String type = request.getParameter("type");

		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}

		PageData pd = new PageData();
		pd.put("type", type);
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = withdrawService.findWithDrawShoplistPage(page);

		mv.setViewName("withdraw/withdraw_shop_list");
		mv.addObject("list", list);
		mv.addObject("type", type);
		return mv;
	}

	/**
	 * 改变前
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/befChangeShop")
	public ModelAndView befChangeShop(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {
		ModelAndView mv = this.getModelAndView();

		String id = request.getParameter("id");
		mv.setViewName("withdraw/withdraw_shop_edit");
		mv.addObject("id", id);
		return mv;
	}

	/**
	 * 更改状态
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/withDrawShopUpdate")
	public ModelAndView withDrawShopUpdate(HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {

		String id = request.getParameter("id");
		String state = request.getParameter("state");
		String remark = request.getParameter("remark");

		PageData pd = new PageData();
		pd.put("id", id);
		pd.put("state", state);
		pd.put("remark", remark);
		withdrawService.updateWithDrawShop(pd);
		/**
		 * 店铺系统推送
		 */
		// 先判断state状态
		pd = new PageData();
		pd.put("id", id);

		// 根据订单的id查询到店铺主的tag值和消息开关和店铺id
		pd = shop.getTXBYidgetshop_id(pd);
		String shoptag = pd.get("tag_name").toString();
		String content = "您的提现申请已经通过";
		String shop_id = pd.get("shop_id").toString();
		String push = pd.get("push").toString();
		if (state.equals("1")) {
			// 成功的
			/* 只针对店铺主发出的额推送 */
			org.json.JSONObject jstr = new org.json.JSONObject(push);
			int withdrawal = Integer.parseInt(jstr.get("withdrawal").toString());
			if (withdrawal > 0) {
				// 表示该功能开启执行推送否则不推送
				JPushshanmei.sendByAlias(content, shoptag);
			}

		} else {
			// 提现失败
			content = "您的提现申请被驳回";
			/* 只针对店铺主发出的额推送 */
			org.json.JSONObject jstr = new org.json.JSONObject(push);
			int withdrawal = Integer.parseInt(jstr.get("withdrawal").toString());
			if (withdrawal > 0) {
				// 表示该功能开启执行推送否则不推送
				JPushshanmei.sendByAlias(content, shoptag);
			}
			// 提现被驳回将钱返回到商户余额中
			PageData pd4 = new PageData();
			pd4.put("id", id);
			// 查询提现相关信息
			pd4 = shop.getShopTXmoney(pd4);
			// 退还金额
			String shopid = pd4.get("shop_id").toString();
			String money = pd4.get("money").toString();
			pd4 = new PageData();
			pd4.put("shopid", shopid);
			pd4.put("money", money);
			// 执行数据库操作
			shop.refundShop(pd4);
		}
		// 执行往数据库中添加数据
		PageData pd3 = new PageData();
		pd3.put("shop_id", shop_id);
		pd3.put("state", 0);
		pd3.put("sendobject", 1);
		pd3.put("type", 4);
		pd3.put("title", "提现");
		pd3.put("content", content);
		pd3.put("order_no", id);
		shop.sendJpush(pd3);

		return withdrawShopList(request, response, page);
	}

	/*************************** 导出 *******************************/
	// TODO
	/**
	 * 用户提现导出
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/down")
	public ModelAndView down(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {

		ModelAndView mv = this.getModelAndView();
		String type = request.getParameter("type");

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		List<PageData> list = new ArrayList<PageData>();

		try {
			PageData pd = new PageData();
			pd.put("type", type);
			page.setCurrentPage(0);
			page.setShowCount(1000);
			page.setPd(pd);
			list = withdrawService.findWithDrawlistPage(page);

			// 设置excel头
			titles.add("序号");
			titles.add("订单号");
			titles.add("用户名称");
			titles.add("类型");
			titles.add("金额");
			titles.add("类型");
			titles.add("金额");
			titles.add("状态");
			titles.add("提现时间");
			titles.add("支付宝账号");
			dataMap.put("titles", titles);
			List<PageData> userList = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				PageData p = list.get(i);
				pd = new PageData();
				pd.put("var1", (i + 1) + "");
				pd.put("var2", p.get("uw_orderNO").toString());
				pd.put("var3", p.get("user_name").toString());
				pd.put("var4", "提现");
				pd.put("var5", p.get("uw_money").toString());
				pd.put("var6", "手续费");
				pd.put("var7", p.get("cuw_money").toString());
				String state = p.get("uw_state").toString();
				String statemsg = "";
				if ("0".equals(state)) {
					statemsg = "提现中";
				} else if ("1".equals(state)) {
					statemsg = "成功";
				} else if ("2".equals(state)) {
					statemsg = "失败";
				}
				pd.put("var8", statemsg);
				pd.put("var9", p.get("uw_createdate").toString());
				pd.put("var10", p.get("ua_user_account").toString());
				userList.add(pd);
			}

			dataMap.put("varList", userList);
			ObjectExcelView erv = new ObjectExcelView(); // 执行excel操作
			mv = new ModelAndView(erv, dataMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	/**
	 * 店铺提现导出
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/downShop")
	public ModelAndView downShop(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {

		ModelAndView mv = this.getModelAndView();
		String type = request.getParameter("type");

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		List<PageData> list = new ArrayList<PageData>();

		try {
			PageData pd = new PageData();
			pd.put("type", type);
			page.setCurrentPage(0);
			page.setShowCount(1000);
			page.setPd(pd);
			list = withdrawService.findWithDrawShoplistPage(page);

			// 设置excel头
			titles.add("序号");
			titles.add("店铺名称");
			titles.add("提取金额");
			titles.add("提取时间");
			titles.add("状态");
			// titles.add("备注");
			dataMap.put("titles", titles);
			List<PageData> userList = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				PageData p = list.get(i);
				pd = new PageData();
				pd.put("var1", (i + 1) + "");
				pd.put("var2", p.get("shop_name").toString());
				pd.put("var3", p.get("money").toString());
				pd.put("var4", p.get("getmoney_time").toString());
				String state = p.get("state").toString();
				String statemsg = "";
				if ("0".equals(state)) {
					statemsg = "申请中";
				} else if ("1".equals(state)) {
					statemsg = "成功";
				} else if ("2".equals(state)) {
					statemsg = "失败";
				}
				pd.put("var5", statemsg);
				// pd.put("var6", p.get("remark").toString());
				userList.add(pd);
			}

			dataMap.put("varList", userList);
			ObjectExcelView erv = new ObjectExcelView(); // 执行excel操作
			mv = new ModelAndView(erv, dataMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

}
