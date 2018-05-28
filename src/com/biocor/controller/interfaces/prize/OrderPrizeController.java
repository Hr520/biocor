package com.biocor.controller.interfaces.prize;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.util.AppUtil;
import com.biocor.util.PageData;


@Controller
@RequestMapping(value = "interface/orderprize")
public class OrderPrizeController extends BaseController {

	Logger logger = Logger.getLogger(OrderPrizeController.class);

	@Resource(name = "orderPrizeService")
	private OrderPrizeService orderPrizeService;

	/**
	 * AJAX 获取抽奖信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getPriceLevel")
	@ResponseBody
	public Object getPriceLevel(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		String state = "";
		String orderNo = request.getParameter("orderNo");
		String userid = request.getParameter("userid");

		// 通过订单ID查询订单详情
		pd = new PageData();
		pd.put("orderNo", orderNo);
		pd = orderPrizeService.getOrderInfoByNo(pd);

		double plevel = 0;
		String money = "";
		if (pd != null) {

			double ordermoney = Double.parseDouble(pd.get("order_money")
					.toString());
			String paystate = pd.get("order_pay_state").toString();

			if ("1".equals(paystate)) {
				pd = new PageData();
				pd.put("userid", userid);
				pd.put("orderNo", orderNo);
				pd.put("ordermoney", ordermoney);
				pd = orderPrizeService.getPrizeInfo(pd);

				plevel = Double.parseDouble(pd.get("level_gift_t").toString()) * 100;
				money = pd.get("reward_money").toString();
				if (plevel == 0) {
					state = "error";
				} else {
					state = "success";
				}

			} else {
				state = "error";
			}

		} else {
			state = "error";
		}
		map.put("state", state);
		map.put("plevel", plevel);
		map.put("money", money);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * AJAX 退款状态信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getOrderReturn")
	@ResponseBody
	public Object getOrderReturn(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		String state = "";
		String orderNo = request.getParameter("orderNo");

		// 通过订单ID查询订单详情
		pd = new PageData();
		pd.put("orderNo", orderNo);
		pd = orderPrizeService.getOrderReturnInfo(pd);

		if (pd != null) {
			state = "success";
		} else {
			state = "error";
		}

		map.put("state", state);
		map.put("pd", pd);
		return AppUtil.returnObject(new PageData(), map);
	}

	
}
