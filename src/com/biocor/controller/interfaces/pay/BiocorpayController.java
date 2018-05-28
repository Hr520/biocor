package com.biocor.controller.interfaces.pay;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.service.interfaces.pay.Biocorservice;
import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.MD5;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.StringUtil;
import com.biocor.util.alipay.util.AlipayNotify;
import com.biocor.util.alipay.util.AlipaySign;
import com.biocor.util.alipay.util.UtilDate;
import com.biocor.util.push.JPush;
import com.biocor.util.push.JPushshanmei;
import com.biocor.util.wx.WxSign;

/**
 * 
 * @author Administrator 支付类
 */
@Controller
@RequestMapping(value = "interface/pay")
public class BiocorpayController extends BaseController {
	@Resource
	private Biocorservice biocorservice;
	@Resource
	private ShopAndorderService shopAndorderService;

	@Resource(name = "orderPrizeService")
	private OrderPrizeService orderPrizeService;
	@Resource
	private  ShameiShopUserService shop;

	/**
	 * 选择支付类型
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "choosepay")
	@ResponseBody
	public ResponseEntity<?> choosepay(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 获取订单id和支付类型订单支付类型：1：支付宝；2:微信; 3余额 0：现金
			String order_no = request.getParameter("order_no");
			String order_pay_type = request.getParameter("order_pay_type");
			PageData pd = new PageData();
			pd.put("order_no", order_no);
			// 判断该订单已经支付没有
			Integer count = biocorservice.getorderpayIsOrNo(pd);
			if (count > 0) {
				// 表示已经支付过的
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("已支付，请勿重复支付");
			} else {
				pd.put("order_pay_type", order_pay_type);
				biocorservice.updatePaytype(pd);
				String str = "";
				pd = new PageData();
				pd.put("order_no", order_no);
				pd = biocorservice.getOrderInfo(pd);
				double money = 0;
				if (pd != null) {
					money = Double.parseDouble(pd.get("order_money").toString());
					if ("1".equals(order_pay_type)) {
						// 获取签名
						str = AlipaySign.getSign(order_no, money);
						return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(str).setMsg("支付方式已选择");
					} else if ("2".equals(order_pay_type)) {
						// 获取签名
						String fee = (int) (money * 100) + "";
						Map<String, Object> res = WxSign.createSign(request, response, order_no, fee);
						String state = res.get("state").toString();
						if (state != "0") {
							String msg = res.get("msg").toString();
							return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(msg);
						} else {
							Map<String, String> map = (Map<String, String>) res.get("map");
							return new ResponseEntity<Map<String, String>>().setState(Constants.SUCCESS).setData(map)
									.setMsg("支付方式已选择");
						}

					} else {
						return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(str).setMsg("支付方式已选择");
					}
				} else {
					return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg("订单不存在");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	/**
	 * 余额支付
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "yuepay")
	@ResponseBody
	public ResponseEntity<?> yuepay(HttpServletRequest request) {
		try {
			String order_userId = request.getParameter("userid");
			String order_no = request.getParameter("order_no");
			String order_money = request.getParameter("order_money");
			// 获取用户支付密码
			String pwd = request.getParameter("paypwd");

			logger.info("interface---yuepay---userid=" + order_userId + ",order_no" + order_no + ",order_money="
					+ order_money + ",pwd=" + pwd);

			String paypwd = MD5.md5(pwd);
			PageData pd = new PageData();
			pd.put("order_userId", order_userId);
			String userPaypwd = biocorservice.getUserpaypwd(pd);
			// 判断用户的支付密码是否正确
			if (paypwd.equals(userPaypwd) && paypwd != null && !paypwd.equals("")) {
				pd = new PageData();
				pd.put("order_userId", order_userId);
				pd.put("order_no", order_no);
				pd.put("order_money", order_money);
				Integer count = biocorservice.findOrderByorderAndUser(pd);
				// 判断该订单是否存在
				if (count > 0) {
					// 查询该用户余额
					double yumoney = biocorservice.getUsermoney(pd);
					// 判断余额是否够支付
					if (yumoney > Double.parseDouble(order_money)) {
						// 扣除余额
						double endmoeny = yumoney - (Double.parseDouble(order_money));
						pd.put("endmoeny", endmoeny);
						biocorservice.updateUserYumoney(pd);
						// 修改订单状态
						pd.put("order_pay_state", 1);
						pd.put("order_pay_type", 3);
						pd.put("order_state", 1);
						biocorservice.updateOrderpayState(pd);
						// 添加余额消费记录
						pd.put("uw_userId", order_userId);
						pd.put("uw_type", 3);
						pd.put("uw_money", order_money);
						biocorservice.insertwithdraw(pd);

						// 商户账单计算
						/*
						 * pd = new PageData(); pd.put("orderNo", order_no); pd
						 * =
						 * orderPrizeService.getOrderInfoByNo(pd);//通过订单No查询商品ID
						 * String sid = pd.get("order_sid").toString(); pd = new
						 * PageData(); pd.put("shop_money",
						 * Double.parseDouble(order_money)*0.8); pd.put("sid",
						 * sid); biocorservice.updateShopMoney(pd);
						 */

						// 奖金池
						payUtile(order_userId, order_no, order_money);

						// 余额支付成功给用户推送一条消息
						String content = "您的订单" + order_no + "已用余额付款，请注意安全，防止泄露密码。";
						JPush.sendByAlias(content, order_userId);

						pd = new PageData();
						pd.put("um_userId", order_userId);
						pd.put("um_msg_type", 2);
						pd.put("um_orderId", "");
						pd.put("um_orderNO", order_no);
						pd.put("um_msgcontent", content);
						pd.put("u_tuistate", 0);
						pd.put("um_msgtitle", "订单通知");
						biocorservice.saveMessageByorder(pd);
						/**
						 * 店铺系统推送
						 */
						// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
						PageData pdr = new PageData();
						pdr.put("order_no", order_no);
						// 查询店主tag
						String shoptag = shop.getShoppertag(pdr);
						String content1 = order_no + "订单已付款成功";
						// 执行往数据库中添加数据
						/**
						 * 拿到需要的数据 写入数据库中 1
						 */
						PageData pd3 = new PageData();
						pd3.put("order_no", order_no);
						String shop_id = shop.getJPushneedInfo(pd3);
						pd3 = new PageData();
						pd3.put("shop_id", shop_id);
						pd3.put("state", 0);
						pd3.put("sendobject", 1);// 注1为店主
						pd3.put("type", 1);// 类型已付款
						pd3.put("title", "已付款");
						pd3.put("content", content1);
						pd3.put("order_no", order_no);
						shop.sendJpush(pd3);
						
								/*** 写入数据库成功后执行推送 先查询出店铺的核销订单通知是否开启 ***/
								pd = new PageData();
								pd.put("shop_id", shop_id);
								String push = shop.getShoppush(pd);
								// 将json字符串转json对象
								org.json.JSONObject jstr = new org.json.JSONObject(push);
								int pay = Integer.parseInt(jstr.get("pay").toString());
								if (pay > 0) {
									// 表示该功能开启执行推送否则不推送
									JPushshanmei.sendByAlias(content1, shoptag);
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
							pd3.put("shop_id", shop_id);
							pd3.put("state", 0);
							pd3.put("sendobject", 2);// 注2为店员
							pd3.put("type", 1);// 类型核已付款
							pd3.put("title", "已付款");
							pd3.put("content", content1);
							pd3.put("order_no", order_no);
							shop.sendJpush(pd3);
							pay = Integer.parseInt(jstr.get("pay").toString());
							if (pay > 0) {
								// 表示该功能开启执行推送否则不推送
								JPushshanmei.sendByAlias(content1, usertag);
							}
						}
						return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(order_money)
								.setMsg("余额支付成功");
					} else {
			 			return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("余额不足");
					}
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData(order_no).setMsg("该订单不存在");
				}

			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("支付密码错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	/**
	 * 支付宝回调
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "alipay")
	@ResponseBody
	public void alipay(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8"); // 目的是为了控制浏览器的行为，即控制浏览器用UTF-8进行解码；
		response.setCharacterEncoding("UTF-8"); // 的目的是用于response.getWriter()输出的字符流的乱码问题，如果是response.getOutputStream()是不
		PrintWriter out = null;
		String state = "";
		String msg = "";
		String result = "";
		try {
			out = response.getWriter();
			// 支付宝必备代码不懂什么意思直接cope
			Map<String, String> params = new HashMap<String, String>();
			Map<?, ?> requestParams = request.getParameterMap();
			for (Iterator<?> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				// valueStr = new String(valueStr.getBytes("ISO-8859-1"),
				// "gbk");
				params.put(name, valueStr);
			}
			// 接收app传来的参数
			String notify_time = request.getParameter("notify_time");
			String order_no = request.getParameter("out_trade_no");
			String trade_no = request.getParameter("trade_no");
			String trade_status = request.getParameter("trade_status");
			String order_money = request.getParameter("total_fee");
			logger.info("infaces--alipay:" + notify_time + "," + order_no + "," + trade_no + "," + trade_status);
			// 对必传参数进行验证是否为空
			if (StringUtil.isNull(notify_time) || StringUtil.isNull(order_no) || StringUtil.isNull(trade_no)
					|| StringUtil.isNull(trade_status)) {
				state = General.ERROR_1001;
				msg = "请求参数错误";
			} else {
				// 获取支付返回的地址
				String url = request.getRequestURI();

				// 打印日志
				logger.info("----url=" + url);
				logger.info("----params-----" + params);
				logger.info("----result-----" + AlipayNotify.verify(params));

				// 支付宝验证
				// boolean b = AlipaySignature.rsaCheckV2(params,
				// AlipayConfig.ali_public_key,"UTF-8");
				// logger.info("----result-----" + b);

				// 支付宝验证
				if (AlipayNotify.verify(params)) {
					// 验证成功
					int byustate = 2;

					if ("WAIT_BUYER_PAY".equals(trade_status)) {
						return;
					} else if ("TRADE_SUCCESS".equals(trade_status) || ("TRADE_FINISHED").equals(trade_status)) {
						byustate = 1;// 订单支付状态订单支付状态：0:未付款；1:付款成功;2:付款失败
					}
					double money = Double.parseDouble(order_money);
					PageData pd = new PageData();
					// 支付成功 修改订单状态
					pd.put("order_no", order_no);
					pd.put("order_pay_state", byustate);
					pd.put("order_state", 1);
					pd.put("order_money", money);
					biocorservice.payUpdateOrderState(pd);
					// 插入用户的消费记录
					// 根据订单查询到用户的id
					String userid = biocorservice.getuseridbyOrderNO(pd);
					// 往用户消费记录里面添加数据
					pd.put("uw_userId", userid);
					pd.put("uw_type", 4);
					pd.put("uw_money", money);
					biocorservice.insertwithdraw(pd);
					// 给用户推送订单付款消息
					String content = "您的订单" + order_no + "已用支付宝付款，请注意安全，防止泄露密码。";
					// 执行单推并插入数据库
					JPush.sendByAlias(content, userid);
					// 推送内容写入数据库中
					pd = new PageData();
					pd.put("um_userId", userid);
					pd.put("um_msg_type", 2);
					pd.put("um_orderId", "");
					pd.put("um_orderNO", order_no);
					pd.put("um_msgcontent", content);
					pd.put("u_tuistate", 0);
					pd.put("um_msgtitle", "订单通知");
					biocorservice.saveMessageByorder(pd);
					// 1查询用户的信息
					pd = new PageData();
					pd.put("order_no", order_no);
					// 查询订单的id和商铺id
					pd = biocorservice.getorderId(pd);

					/**
					 * 店铺系统推送
					 */
					// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
					PageData pdr = new PageData();
					pdr.put("order_no", order_no);
					// 查询店主tag
					String shoptag = shop.getShoppertag(pdr);
					String content1 = order_no + "订单已付款成功";
					// 执行往数据库中添加数据
					/**
					 * 拿到需要的数据 写入数据库中 1
					 */
					PageData pd3 = new PageData();
					pd3.put("order_no", order_no);
					String shop_id = shop.getJPushneedInfo(pd3);
					pd3 = new PageData();
					pd3.put("shop_id", shop_id);
					pd3.put("state", 0);
					pd3.put("sendobject", 1);// 注1为店主
					pd3.put("type", 1);// 类型已付款
					pd3.put("title", "已付款");
					pd3.put("content", content1);
					pd3.put("order_no", order_no);
					shop.sendJpush(pd3);
					
							/*** 写入数据库成功后执行推送 先查询出店铺的核销订单通知是否开启 ***/
							pd = new PageData();
							pd.put("shop_id", shop_id);
							String push = shop.getShoppush(pd);
							// 将json字符串转json对象
							org.json.JSONObject jstr = new org.json.JSONObject(push);
							int pay = Integer.parseInt(jstr.get("pay").toString());
							if (pay > 0) {
								// 表示该功能开启执行推送否则不推送
								JPushshanmei.sendByAlias(content1, shoptag);
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
						pd3.put("shop_id", shop_id);
						pd3.put("state", 0);
						pd3.put("sendobject", 2);// 注2为店员
						pd3.put("type", 1);// 类型核已付款
						pd3.put("title", "已付款");
						pd3.put("content", content1);
						pd3.put("order_no", order_no);
						shop.sendJpush(pd3);
						pay = Integer.parseInt(jstr.get("pay").toString());
						if (pay > 0) {
							// 表示该功能开启执行推送否则不推送
							JPushshanmei.sendByAlias(content1, usertag);
						}
					}

					// 商户账单计算
					/*
					 * pd = new PageData(); pd.put("orderNo", order_no); pd =
					 * orderPrizeService.getOrderInfoByNo(pd);//通过订单No查询商品ID
					 * String sid = pd.get("order_sid").toString(); pd = new
					 * PageData(); pd.put("shop_money",
					 * Double.parseDouble(order_money)*0.8); pd.put("sid", sid);
					 * biocorservice.updateShopMoney(pd);
					 */

					// 奖金池
					String order_userId = userid;
					payUtile(order_userId, order_no, order_money);
					state = General.SUCCESS;
					msg = "请求成功";
					result = "success";
				} else {
					state = General.ERROR_1001;
					msg = "验证失败";
					result = "error";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			state = General.ERROR_2001;
			msg = "系统异常";
			logger.info("infaces--alipay:系统错误,e=" + e);
			result = "error";
		} finally {
			logger.info("infaces--alipay=" + state + ",msg=" + msg);
			out.print(result);

		}

	}

	/**
	 * 微信回调
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "Wechatepay")
	@ResponseBody
	public void Wechatepay(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8"); // 目的是为了控制浏览器的行为，即控制浏览器用UTF-8进行解码；
		response.setCharacterEncoding("UTF-8"); // 的目的是用于response.getWriter()输出的字符流的乱码问题，如果是response.getOutputStream()是不
		PrintWriter out = null;
		PageData pd = new PageData();
		Map<String, String> map = null;
		try {
			out = response.getWriter();
			// 获取微信返回的url
			String url = request.getRequestURI();
			logger.info("infaces--Wechatepay:url=" + url);
			logger.info("infaces--Wechatepay:map=" + request.getParameterMap());
			logger.info("infaces--Wechatepay:in=" + request.getInputStream());
			// 处理接收消息
			ServletInputStream in = request.getInputStream();
			// 读取输出流
			SAXReader reader = new SAXReader();
			Document doc = reader.read(in);
			String requestXml = doc.asXML();
			logger.info("infaces--Wechatepay:requestXml=" + requestXml);

			String subXml = requestXml.split(">")[0] + ">";
			requestXml = requestXml.substring(subXml.length());
			// 得到xml根元素
			Element root = doc.getRootElement();
			// 得到根元素的全部子节点
			List<Element> elementList = root.elements();
			// 遍历全部子节点
			map = new HashMap<String, String>();
			for (Element e : elementList) {
				map.put(e.getName(), e.getText());
			}
			// 获取返回参数
			String result_code = map.get("result_code").toString();// 结果状态
			String order_no = map.get("out_trade_no").toString();// 商户订单ID
			String transaction_id = map.get("transaction_id").toString();// 支付订单ID
			String order_money = map.get("cash_fee").toString();// 支付金额

			logger.info("infaces--Wechatepay:result_code=" + result_code + ",order_no=" + order_no + ",transaction_id="
					+ transaction_id);
			pd = new PageData();
			double money = Double.parseDouble(order_money) / 100;
			int byustate = 2;
			// 判断签名及结果
			if ("SUCCESS".equals(result_code)) {
				// 订单支付状态订单支付状态：0:未付款；1:付款成功;2:付款失败
				byustate = 1;
			}
			pd = new PageData();
			// 支付成功 修改订单状态
			pd.put("order_no", order_no);
			pd.put("order_pay_state", byustate);
			pd.put("order_state", 1);
			pd.put("order_money", money);
			biocorservice.payUpdateOrderState(pd);
			// 插入用户的消费记录
			// 根据订单查询到用户的id
			String userid = biocorservice.getuseridbyOrderNO(pd);
			// 往用户消费记录里面添加数据
			pd.put("uw_userId", userid);
			pd.put("uw_type", 4);
			pd.put("uw_money", money);
			biocorservice.insertwithdraw(pd);
			// 给用户推送订单付款消息
			String content = "您的订单" + order_no + "已用微信付款，请注意安全，防止泄露密码" + UtilDate.getOrderNum();
			// 执行单推并插入数据库
			JPush.sendByAlias(content, userid);
			// 推送内容写入数据库中
			pd = new PageData();
			pd.put("um_userId", userid);
			pd.put("um_msg_type", 2);
			pd.put("um_orderId", "");
			pd.put("um_orderNO", order_no);
			pd.put("um_msgcontent", content);
			pd.put("u_tuistate", 0);
			pd.put("um_msgtitle", "订单通知");
			biocorservice.saveMessageByorder(pd);
			/**
			 * 店铺系统推送
			 */
			// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
			PageData pdr = new PageData();
			pdr.put("order_no", order_no);
			// 查询店主tag
			String shoptag = shop.getShoppertag(pdr);
			String content1 = order_no + "订单已付款成功";
			// 执行往数据库中添加数据
			/**
			 * 拿到需要的数据 写入数据库中 1
			 */
			PageData pd3 = new PageData();
			pd3.put("order_no", order_no);
			String shop_id = shop.getJPushneedInfo(pd3);
			pd3 = new PageData();
			pd3.put("shop_id", shop_id);
			pd3.put("state", 0);
			pd3.put("sendobject", 1);// 注1为店主
			pd3.put("type", 1);// 类型已付款
			pd3.put("title", "已付款");
			pd3.put("content", content1);
			pd3.put("order_no", order_no);
			shop.sendJpush(pd3);
			
					/*** 写入数据库成功后执行推送 先查询出店铺的核销订单通知是否开启 ***/
					pd = new PageData();
					pd.put("shop_id", shop_id);
					String push = shop.getShoppush(pd);
					// 将json字符串转json对象
					org.json.JSONObject jstr = new org.json.JSONObject(push);
					int pay = Integer.parseInt(jstr.get("pay").toString());
					if (pay > 0) {
						// 表示该功能开启执行推送否则不推送
						JPushshanmei.sendByAlias(content1, shoptag);
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
				pd3.put("shop_id", shop_id);
				pd3.put("state", 0);
				pd3.put("sendobject", 2);// 注2为店员
				pd3.put("type", 1);// 类型核已付款
				pd3.put("title", "已付款");
				pd3.put("content", content1);
				pd3.put("order_no", order_no);
				shop.sendJpush(pd3);
				pay = Integer.parseInt(jstr.get("pay").toString());
				if (pay > 0) {
					// 表示该功能开启执行推送否则不推送
					JPushshanmei.sendByAlias(content1, usertag);
				}
			}

			// 商户账单计算
			/*
			 * pd = new PageData(); pd.put("orderNo", order_no); pd =
			 * orderPrizeService.getOrderInfoByNo(pd);//通过订单No查询商品ID String sid
			 * = pd.get("order_sid").toString(); pd = new PageData();
			 * pd.put("shop_money", Double.parseDouble(order_money)*0.8);
			 * pd.put("sid", sid); biocorservice.updateShopMoney(pd);
			 */

			// 奖金池
			String order_userId = userid;
			payUtile(order_userId, order_no, money + "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("infaces--Wechatepay:系统错误,e=" + e);
		} finally {
			map = new HashMap<String, String>();
			map.put("return_code", "SUCCESS");
			map.put("return_msg", "OK");
			out.print(map2XmlString(map));

		}
	}

	/*************************************************************/
	// map 转为微信xml
	public static String map2XmlString(Map<String, String> map) {
		String xmlResult = "";
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		for (String key : map.keySet()) {
			String value = "<![CDATA[" + map.get(key) + "]]>";
			sb.append("<" + key + ">" + value + "</" + key + ">");
			System.out.println();
		}
		sb.append("</xml>");
		xmlResult = sb.toString();
		return xmlResult;
	}
	//
	// @RequestMapping(value = "test")
	// @ResponseBody
	// public ResponseEntity<?> test(HttpServletRequest request,
	// HttpServletResponse response, Page page) {
	// String order_userId = request.getParameter("order_userId");
	// String order_no = request.getParameter("order_no");
	// String order_money = request.getParameter("order_money");
	// try {
	// payUtile(order_userId, order_no, order_money);
	// return new
	// ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("成功");
	// } catch (Exception e) {
	// e.printStackTrace();
	// return new
	// ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
	// }
	//
	// }

	// 支付环节的不属于支付操作的通用方法

	@RequestMapping(value = "test")
	@ResponseBody
	public ResponseEntity<?> test(HttpServletRequest request) {
		try {
			String order_userId = request.getParameter("order_userId");
			String order_no = request.getParameter("order_no");
			String order_money = request.getParameter("order_money");
			payUtile(order_userId, order_no, order_money);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	public void payUtile(String order_userId, String order_no, String order_money) throws Exception {
		PageData pd = new PageData();
		pd.put("order_no", order_no);
		// 查询订单的id和商铺id
		try {
			pd = biocorservice.getorderId(pd);
			String order_id = pd.get("oid").toString();
			String shop_id = pd.get("order_sid").toString();
			String shopname = pd.get("order_shopName").toString();
			pd = new PageData();
			pd.put("order_userId", order_userId);
			// 查询用户信息
			String us_usertel = biocorservice.getUserInfo(pd);
			pd = new PageData();
			pd.put("us_userid", order_userId);
			pd.put("us_usertel", us_usertel);
			pd.put("us_sid", shop_id);
			pd.put("us_shopname", shopname);
			pd.put("order_no", order_no);
			pd.put("us_oid", order_id);
			pd.put("us_rate", 0.15);
			// 余额支付成功向奖励表预添加奖励进度15%
			// 查询 订单金额
			if (Float.parseFloat(order_money) >= 10) {
				biocorservice.insertuserRate(pd);
			}

			// 支付成功后获取积分奖励
			// 用户消费获得积分规则
			//
			// * V6等级会员：订单实付金额X100% V5等级会员：订单实付金额X80% V4等级会员：订单实付金额X70%
			// * V3等级会员：订单实付金额X60% V2等级会员：订单实付金额X55% V1等级会员：订单实付金额X50%
			// *
			// 查询用户信息
			pd = new PageData();
			pd.put("order_userId", order_userId);
			// 查询用户的注册时间
			// String date1 = shopAndorderService.getUserRegTime(pd);
			Integer score = shopAndorderService.getUserVipinfo(pd);
			int viplevel = 0;
			// 查询积分分类确定等级
			int userLevel = 0;
			List<PageData> list = shopAndorderService.getViolevel();
			for (int i = 0; i < list.size(); i++) {
				if (score >= Integer.parseInt(list.get(i).get("uig_grade_begin").toString())
						&& score < Integer.parseInt(list.get(i).get("uig_grade_end").toString()))
					viplevel = Integer.parseInt(list.get(i).get("uig_grade_No").toString());
				userLevel = viplevel;
			}

			// 用户消费成功赠送积分
			Integer payscore = 0;
			// 用户0等级时 消费金额小于100不给积分 消费超过5000时5000部分按照等级 给积分超过部分按0.1给积分
			if (userLevel == 0) {
				if (Double.parseDouble(order_money) < 100) {
				} else {
					if (Double.parseDouble(order_money) > 5000) {
						payscore = (int) (5000 * 0.5 + (Double.parseDouble(order_money) - 5000) * 0.1);
					} else {
						payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.5));
					}

				}
				// 用户等级大于1时 消费超过5000时5000部分按照等级 给积分超过部分按0.1给积分
			} else if (userLevel == 1) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 0.5 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.5));
				}

			} else if (userLevel == 2) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 0.55 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.55));
				}
			} else if (userLevel == 3) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 0.6 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.6));
				}

			} else if (userLevel == 4) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 0.7 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.7));
				}
			} else if (userLevel == 5) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 0.8 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 0.8));
				}

			} else if (userLevel == 6) {
				if (Double.parseDouble(order_money) > 5000) {
					payscore = (int) (5000 * 1 + (Double.parseDouble(order_money) - 5000) * 0.1);
				} else {
					payscore = (int) (Math.round(Double.parseDouble(order_money.toString()) * 1));
				}

			}

			// 对用户积分进行增加
			pd = new PageData();
			pd.put("order_userId", order_userId);
			// 加入成长值计算
			if (userLevel == 0 && Float.parseFloat(order_money) < 100) {

			} else if (userLevel > 0) {

				if (Double.parseDouble(order_money) < 10) {
					payscore = 0;
				} else if (Double.parseDouble(order_money) >= 10 && Double.parseDouble(order_money) <= 500) {
					pd.put("order_money", Float.parseFloat(order_money) * 0.5);
				} else {
					if (Double.parseDouble(order_money) > 500 && Double.parseDouble(order_money) <= 2000) {
						pd.put("order_money", Float.parseFloat(order_money) * 0.8);
					} else if (Double.parseDouble(order_money) > 2000 && Double.parseDouble(order_money) <= 4000) {
						pd.put("order_money", Float.parseFloat(order_money) * 1);
					} else if (Double.parseDouble(order_money) > 4000) {
						pd.put("order_money", 4000);
					}

				}
				if (payscore > 0) {
					pd.put("payscore", payscore);
					pd.put("order_no", order_no);
					// shopAndorderService.adduserscore(pd);
					// 将该订单获的积分和成长值插入到订单表中
					shopAndorderService.sendOrderSore(pd);
					// // 添加用户积分增加记录
					// pd = new PageData();
					// pd.put("ui_userid", order_userId);
					// pd.put("ui_integral_type", 0);
					// pd.put("ui_integral_score", payscore);
					// pd.put("ui_sid", shop_id);
					// pd.put("ui_ISsid", 1);
					// shopAndorderService.insertJifeninfo(pd);
				}
			} else if (userLevel == 0 && Double.parseDouble(order_money) >= 100
					&& Double.parseDouble(order_money) <= 500) {
				pd.put("order_money", Float.parseFloat(order_money) * 0.5);
				pd.put("payscore", payscore);
				pd.put("order_no", order_no);
				// shopAndorderService.adduserscore(pd);
				shopAndorderService.sendOrderSore(pd);
				// // 添加用户积分增加记录
				// pd = new PageData();
				// pd.put("ui_userid", order_userId);
				// pd.put("ui_integral_type", 0);
				// pd.put("ui_integral_score", payscore);
				// pd.put("ui_sid", shop_id);
				// pd.put("ui_ISsid", 1);
				// shopAndorderService.insertJifeninfo(pd);
			} else if (userLevel == 0 && Double.parseDouble(order_money) > 500
					&& Double.parseDouble(order_money) <= 2000) {
				pd.put("order_money", Float.parseFloat(order_money) * 0.8);
				pd.put("payscore", payscore);
				pd.put("order_no", order_no);
				// shopAndorderService.adduserscore(pd);
				shopAndorderService.sendOrderSore(pd);
				// 添加用户积分增加记录
				// pd = new PageData();
				// pd.put("ui_userid", order_userId);
				// pd.put("ui_integral_type", 0);
				// pd.put("ui_integral_score", payscore);
				// pd.put("ui_sid", shop_id);
				// pd.put("ui_ISsid", 1);
				// shopAndorderService.insertJifeninfo(pd);
			} else if (userLevel == 0 && Double.parseDouble(order_money) > 2000
					&& Double.parseDouble(order_money) <= 4000) {
				pd.put("order_money", Float.parseFloat(order_money) * 1);
				pd.put("payscore", payscore);
				pd.put("order_no", order_no);
				// shopAndorderService.adduserscore(pd);
				shopAndorderService.sendOrderSore(pd);
				// 添加用户积分增加记录
				// pd = new PageData();
				// pd.put("ui_userid", order_userId);
				// pd.put("ui_integral_type", 0);
				// pd.put("ui_integral_score", payscore);
				// pd.put("ui_sid", shop_id);
				// pd.put("ui_ISsid", 1);
				// shopAndorderService.insertJifeninfo(pd);
			} else if (userLevel == 0 && Double.parseDouble(order_money) > 4000) {
				pd.put("order_money", 4000);
				pd.put("payscore", payscore);
				pd.put("order_no", order_no);
				// shopAndorderService.adduserscore(pd);
				shopAndorderService.sendOrderSore(pd);
				// // 添加用户积分增加记录
				// pd = new PageData();
				// pd.put("ui_userid", order_userId);
				// pd.put("ui_integral_type", 0);
				// pd.put("ui_integral_score", payscore);
				// pd.put("ui_sid", shop_id);
				// pd.put("ui_ISsid", 1);
				// shopAndorderService.insertJifeninfo(pd);
			}
			// 查询奖金池各个金额信息
			pd = biocorservice.getprizepoolinfo();
			// 将订单支付成功的金额抽取12%到奖金池中
			float omoney = (float) (Float.parseFloat(order_money) * 0.12);
			// 将订单支付成功的金额抽取8%到奖金池的纯利润中
			float profit = (float) (Float.parseFloat(order_money) * 0.08);
			// 取到奖金池的id
			String bpid = pd.get("bpid").toString();
			pd.put("bpid", bpid);
			pd.put("omoney", omoney);
			pd.put("profit", profit);
			// 往奖金池注入资金
			biocorservice.updateprizepool(pd);
			// 重新查询最新的奖金池信息
			pd = biocorservice.getprizepoolinfo();
			// 奖金池金额
			float bp_money = Float.parseFloat(pd.get("bp_money").toString());
			// 最少金额
			float bp_min_money = Float.parseFloat(pd.get("bp_min_money").toString());
			// 可分配金额
			float bp_distributable = Float.parseFloat(pd.get("bp_distributable").toString());
			// 最小支配金额
			float bp_distributable_min = Float.parseFloat(pd.get("bp_distributable_min").toString());
			if (bp_money > bp_min_money && bp_money < bp_distributable_min) {
				// 奖金池金额大于最少金额并且小于最小支配金额就将奖金池金额减去最少金额 结果放入可分配金额
				bp_distributable = bp_money - bp_min_money;// 可分配金额
				bpid = pd.get("bpid").toString();
				pd.put("bp_distributable", bp_distributable);
				pd.put("bpid", bpid);
				// 执行奖金池信息更新
				biocorservice.updateBonuspools(pd);
			} else if (bp_money > bp_min_money && bp_money > bp_distributable_min) {
				bp_distributable = bp_money - bp_distributable_min;// 可分配金额
				bpid = pd.get("bpid").toString();
				pd.put("bp_distributable", bp_distributable);
				pd.put("bpid", bpid);
				biocorservice.updateBonuspools(pd);
			} else if (bp_money < bp_min_money) {
				// 这个时候奖金池金额不向任何地方流动
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
