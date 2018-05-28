package com.biocor.controller.interfaces.scan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.orders.OrdersService;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.util.AppUtil;
import com.biocor.util.PageData;
import com.biocor.util.push.JPushshanmei;

@Controller
@RequestMapping(value = "interface/")
public class ScanController extends BaseController {

	@Resource(name = "ordersService")
	private OrdersService ordersService;
	@Resource
	private ShameiShopUserService shop;

	@Resource
	private ShopAndorderService shopAndorderService;

	@RequestMapping(value = "/scanCode")
	public ModelAndView scanCode(HttpServletRequest request, HttpServletResponse response, Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData res = new PageData();

		String orderNo = request.getParameter("id");

		// 查询订单详情
		PageData pd = new PageData();
		pd.put("orderNo", orderNo);
		res = ordersService.findOrdersInfo(pd);

		// 查询订单所有商品
		pd = new PageData();
		pd.put("orderNo", orderNo);
		List<PageData> list = ordersService.findOrdersGoods(pd);

		mv.setViewName("scan/orderScan");
		mv.addObject("list", list);
		mv.addObject("pd", res);
		return mv;

	}

	/**
	 * Ajax 更改订单状态
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateScanOrder")
	@ResponseBody
	public Object updateScanOrder(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		String state = "success";
		String orderNo = request.getParameter("orderNo");

		// 更改订单状态
		try {
			pd.put("order_no", orderNo);
			ordersService.updateOrdersState(pd);
			// 根据的id查询出订单相关的数据该订单下获得的积分和成长值
			pd = ordersService.getOrderMoneyAndscoreInfo(pd);
			String order_userId = pd.get("order_userId").toString();
			String payscore = pd.get("order_getIntegral").toString();
			String order_money = pd.get("order_Growth").toString();
			String shop_id = pd.get("shop_id").toString();
			pd.put("order_userId", order_userId);
			pd.put("payscore", payscore);
			pd.put("order_money", order_money);
			shopAndorderService.adduserscore(pd);
			// 添加用户积分增加记录
			if(Integer.parseInt(payscore)>0){
				pd = new PageData();
				pd.put("ui_userid", order_userId);
				pd.put("ui_integral_type", 0);
				pd.put("ui_integral_score", payscore);
				pd.put("ui_sid", shop_id);
				pd.put("ui_ISsid", 1);
				shopAndorderService.insertJifeninfo(pd);
				/**
				 * 店铺系统推送
				 */
				// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
				PageData pdr = new PageData();
				pdr.put("order_no", orderNo);
				// 查询店主tag
				String shoptag = shop.getShoppertag(pdr);
				String content = orderNo + "订单已确认";
				// 执行往数据库中添加数据
				/**
				 * 拿到需要的数据 写入数据库中 1
				 */
				PageData pd3 = new PageData();
				pd3.put("order_no", orderNo);
				String shop_ids = shop.getJPushneedInfo(pd3);
				pd3 = new PageData();
				pd3.put("shop_id", shop_ids);
				pd3.put("state", 0);
				pd3.put("sendobject", 1);// 注1为店主
				pd3.put("type", 3);// 类型核销订单
				pd3.put("title", "核销订单");
				pd3.put("content", content);
				pd3.put("order_no", orderNo);
				shop.sendJpush(pd3);
				/*** 写入数据库成功后执行推送 先查询出店铺的核销订单通知是否开启 ***/
				pd = new PageData();
				pd.put("shop_id", shop_id);
				String push = shop.getShoppush(pd);
				// 将json字符串转json对象
				org.json.JSONObject jstr = new org.json.JSONObject(push);
				int confirm = Integer.parseInt(jstr.get("confirm").toString());
				if (confirm > 0) {
					// 表示该功能开启执行推送否则不推送
					JPushshanmei.sendByAlias(content, shoptag);
				}
				List<PageData> listr = new ArrayList<>();
				// 店员tag
				listr = shop.getUsertag(pdr);
				if (listr.size() > 0) {
					// 推送给店员
					String usertag = "";
					usertag = listr.get(0).get("tag_name").toString();
					// 执行推送

					/* 2写入店员 */
					pd3 = new PageData();
					pd3.put("shop_id", shop_ids);
					pd3.put("state", 0);
					pd3.put("sendobject", 2);// 注2为店员
					pd3.put("type", 3);// 类型核销订单
					pd3.put("title", "核销订单");
					pd3.put("content", content);
					pd3.put("order_no", orderNo);
					shop.sendJpush(pd3);
					confirm = Integer.parseInt(jstr.get("confirm").toString());
					if (confirm > 0) {
						// 表示该功能开启执行推送否则不推送
						JPushshanmei.sendByAlias(content, usertag);
					}
				}
			}else{
				
			}
			
		} catch (Exception e) {
			state = "error";
		}

		map.put("state", state);
		return AppUtil.returnObject(new PageData(), map);
	}

}
