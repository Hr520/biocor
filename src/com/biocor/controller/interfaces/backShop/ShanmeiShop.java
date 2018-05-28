package com.biocor.controller.interfaces.backShop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.admin.financial.FinancialService;
import com.biocor.service.admin.orders.OrdersService;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.util.Constants;
import com.biocor.util.PageData;
/***
 * 
 * @author Administrator
 *山莓商户端店铺相关接口
 */
import com.biocor.util.ResponseEntity;
import com.biocor.util.SDKUtils;
import com.biocor.util.push.JPushshanmei;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "interface/shop")
public class ShanmeiShop extends BaseController {

	@Resource
	private ShameiShopUserService shop;

	@Resource
	private ShopAndorderService shopAndorderService;
	@Resource
	private FinancialService financl;
	@Resource
	private OrdersService ordersService;

	// 修改店铺设置
	@RequestMapping(value = "updateShop")
	@ResponseBody
	public ResponseEntity<?> updateShop(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer type = Integer.parseInt(request.getParameter("type").toString());
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		try {
			if (type == 1) {
				// 修改店铺地址
				String shopAdrees = request.getParameter("shopAdrees");
				if (shopAdrees != null && !shopAdrees.equals("")) {
					pd.put("shopAdrees", shopAdrees);
					// 执行修改
					shop.updateShop(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("店铺地址成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
				}
			} else if (type == 2) {
				// 设置联系电话
				String phone = request.getParameter("phone");
				if (phone != null && !phone.equals("")) {
					pd.put("phone", phone);
					shop.updateShop(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("电话设置成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
				}
			} else if (type == 3) {
				// 设置店铺名称
				String shop_name = request.getParameter("shop_name");
				if (shop_name != null && !shop_name.equals("")) {
					pd.put("shop_name", shop_name);
					shop.updateShop(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("店名设置成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
				}
			} else if (type == 4) {
				// 设置营业时间
				String business_time = request.getParameter("business_time");
				if (business_time != null && !business_time.equals("")) {
					pd.put("business_time", business_time);
					shop.updateShop(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("营业时间设置成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
				}
			} else if (type == 5) {
				// 设置人均消费
				String Permoney = request.getParameter("Permoney");
				if (Permoney != null && !Permoney.equals("")) {
					pd.put("Permoney", Permoney);
					shop.updateShop(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("人均消费设置成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
				}
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店铺详情商户端详情
	@RequestMapping(value = "getShopInfo")
	@ResponseBody
	public ResponseEntity<?> getShopInfo(HttpServletRequest request) {
		// 传入店铺id
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		pd.put("uf_sid", shop_id);
		try {
			pd = shopAndorderService.getshopInfoH5(pd);
			if (pd != null) {
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
			} else {
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());

		}
	}

	// 店主修改店可以直接修改
	@RequestMapping(value = "updatSHopALL")
	@ResponseBody
	public ResponseEntity<?> updatSHopBystate(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		try {
			String shop_name = request.getParameter("shop_name");
			String shop_img = request.getParameter("shop_img");
			String Permoney = request.getParameter("Permoney");
			String business_time = request.getParameter("business_time");
			String phone = request.getParameter("phone");
			String shopAdrees = request.getParameter("shopAdrees");
			pd.put("shop_name", shop_name);
			pd.put("shop_img", shop_img);
			pd.put("Permoney", Permoney);
			pd.put("phone", phone);
			pd.put("business_time", business_time);
			pd.put("shopAdrees", shopAdrees);
			// 修改店铺信息
			shop.updatSHopALL(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 根据订单类型查询订单列表
	@RequestMapping(value = "getOrderBytypelistpage")
	@ResponseBody
	public ResponseEntity<?> getOrderBytypelistpage(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer type = Integer.parseInt(request.getParameter("type").toString());
		Integer page = Integer.parseInt(request.getParameter("index").toString());
		Integer rows = 10;
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		pd.put("stratrows", (page - 1) * rows);
		pd.put("rows", rows);
		try {
			if (type == 1) {
				// 未完成订单列表
				pd.put("type", type);
				list = shop.getOrderBytypelistpage(pd);
				if (list.size() > 0) {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					list = new ArrayList<>();
					return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
				}
			} else if (type == 2) {
				// 已完成订单
				pd.put("type", type);
				list = shop.getOrderBytypelistpage(pd);
				if (list.size() > 0) {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					list = new ArrayList<>();
					return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
				}
			} else if (type == 3) {
				// 失效订单
				pd.put("type", type);
				list = shop.getOrderBytypelistpage(pd);
				if (list.size() > 0) {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					list = new ArrayList<>();
					return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
				}
			} else {
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("参数输入错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询店铺订单模块上部分数据
	@RequestMapping(value = "getShopOrderCount")
	@ResponseBody
	public ResponseEntity<?> getShopOrderCount(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
//		List<PageData> list = new ArrayList<>();
		pd.put("shop_id", shop_id);
//		int order_totalDay = 0;
//		int order_aboutday = 0;
//		int order_intoday = 0;
		try {
			// 查询今日订单总数
//			list = shop.getShopOrderCount(pd);
			pd = new PageData();
//			根据店铺id查询出订单相应的数据
			pd.put("shop_id", shop_id);
			//查询消费时间在今日的所有订单
			int ordertotalDay=shop.getOrdertotalBytoday(pd);
			//查询今日预约订单总数
			int alredytotal=shop.getordertotalByYuetomory(pd);
			//查询今日预约订单未消费的总数
			int orderaboutday=shop.getOrdertotalByaboutday(pd);
			//查询今日进店还未消费的订单
			int Hordertotal=shop.getHordertotal(pd);
			//明日预约
			int orderintoday=shop.getOrdertotalBytomoney(pd);
//				
//			for (int i = 0; i < list.size(); i++) {
//				if (list.get(i).get("type").toString().equals("1")) {
//					order_totalDay = Integer.parseInt(list.get(i).get("order_total").toString());
//				} else if (list.get(i).get("type").toString().equals("2")) {
//					order_aboutday = Integer.parseInt(list.get(i).get("order_total").toString());
//				} else {
//					order_intoday = Integer.parseInt(list.get(i).get("order_total").toString());
//				}
//			}
			pd = new PageData();
			pd.put("order_totalDay", ordertotalDay+orderaboutday+Hordertotal);
			pd.put("order_aboutday", alredytotal);
			pd.put("order_intoday", orderintoday);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 更换店铺头像只能是店主修改
	@RequestMapping(value = "updateShopHeadImg")
	@ResponseBody
	public ResponseEntity<?> updateShopHeadImg(HttpServletRequest request) {
		String userid = request.getParameter("Shop_userid");
		String shop_id = request.getParameter("shop_id");
		String img = request.getParameter("img");
		// 查询用户身份
		PageData pd = new PageData();
		try {
			pd.put("userid", userid);
			pd.put("shop_id", shop_id);
			pd.put("img", img);
			int isno = shop.getShopUserisnoleder(pd);
			if (isno > 0) {
				// 是店主
				// 查询到店铺图片
				String shop_img = shop.getShopImgs(pd);
				// 先进行判断是否为空
				StringBuffer bfBuffer = new StringBuffer();
				// 对字符串进行分割
				String[] arr = shop_img.split(",");
				if (arr.length > 0) {
					// 说明中间有多张图片
					arr[0] = img;
					for (int i = 0; i < arr.length; i++) {
						bfBuffer.append(arr[i] + ",");
					}
					// 删除字符串中最后一个逗号
					bfBuffer.deleteCharAt(bfBuffer.length() - 1);
					shop_img = bfBuffer.toString();
				} else {
					shop_img = img;
				}
				// 执行图片修改操作
				pd = new PageData();
				pd.put("shop_id", shop_id);
				pd.put("shop_img", shop_img);
				shop.updateShopimg(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("修改成功");
			} else {
				// 不是店主返回状态不可修改
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("不可修改");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店铺评价列表
	@RequestMapping(value = "getShopevaluationList")
	@ResponseBody
	public ResponseEntity<?> getShopevaluationList(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer page = Integer.parseInt(request.getParameter("index"));
		int rows = 10;
		List<PageData> list = new ArrayList<>();

		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			pd.put("stratRows", (page - 1) * rows);
			pd.put("rows", rows);
			// 查询当前店铺下查询评价列表
			list = shop.getShopevaluationList(pd);
			// 查询到店铺的评分和好评率
			pd = shop.getShopevaluationInfo(pd);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("shopevaluationInfo", pd);
			jsonObject.put("evaluationlist", list);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonObject).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 订单扫描查询结果
	@RequestMapping(value = "OrderscanningResult")
	@ResponseBody
	public ResponseEntity<?> OrderscanningResult(HttpServletRequest request) {
		// 获取订单id
		String order_no = request.getParameter("order_no");
		// 查询所点菜品
		PageData pd = new PageData();
		pd.put("order_no", order_no);
		List<PageData> list = new ArrayList<>();
		try {
			// 查询出该订单所点菜品
			list = shop.getOrderGoodlist(pd);
			// 查询出订单总计
			Integer moneySum = shop.orderMoneyTotal(pd);
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("moneySum", moneySum);
			// 查询订单其他信息
			pd = shop.getorderInfo(pd);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("goodlist", map);
			jsonObject.put("orderInfo", pd);
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonObject).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 确认订单
	@RequestMapping(value = "confirmOrder")
	@ResponseBody
	public ResponseEntity<?> confirmOrder(HttpServletRequest request) {
		String order_no = request.getParameter("order_no");
		String shopid = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		PageData pd = new PageData();
		try {
			// 判断扫描用户的权限
			pd.put("order_no", order_no);
			pd.put("shopid", shopid);
			pd.put("userid", userid);
			String shopids = shop.getUserCanconfirmder(pd);
			if (shopids.equals(shopid)) {
				// 可以操作
				pd.put("order_state", 2);
				shop.confirmOrder(pd);
				
				
				/**
				 * 执行订单确认逻辑送积分给用户
				 * 
				 */
				pd.put("order_no", order_no);
				ordersService.updateOrdersState(pd);
				// 根据的id查询出订单相关的数据该订单下获得的积分和成长值
				pd = ordersService.getOrderMoneyAndscoreInfo(pd);
				String order_userId = pd.get("order_userId").toString();
				String payscore = pd.get("order_getIntegral").toString();
				String order_money = pd.get("order_Growth").toString();
				String shop_id1 = pd.get("shop_id").toString();
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
					pd.put("ui_sid", shop_id1);
					pd.put("ui_ISsid", 1);
					shopAndorderService.insertJifeninfo(pd);
				}
				/**
				 * 店铺系统推送
				 */
				// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
				PageData pdr = new PageData();
				pdr.put("order_no", order_no);
				// 查询店主tag
				String shoptag = shop.getShoppertag(pdr);
				String content = order_no + "订单已确认";
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
				pd3.put("type", 3);// 类型核销订单
				pd3.put("title", "核销订单");
				pd3.put("content", content);
				pd3.put("order_no", order_no);
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
					pd3.put("shop_id", shop_id);
					pd3.put("state", 0);
					pd3.put("sendobject", 2);// 注2为店员
					pd3.put("type", 3);// 类型核销订单
					pd3.put("title", "核销订单");
					pd3.put("content", content);
					pd3.put("order_no", order_no);
					shop.sendJpush(pd3);
					confirm = Integer.parseInt(jstr.get("confirm").toString());
					if (confirm > 0) {
						// 表示该功能开启执行推送否则不推送
						JPushshanmei.sendByAlias(content, usertag);
					}
				}

				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("已确认");
			} else {
				// 不可操作
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("不可确认");
			}
		} catch (Exception e) {
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 添加银行卡
	@RequestMapping(value = "addBankCar")
	@ResponseBody
	public ResponseEntity<?> addBankCar(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		pd.put("userid", userid);
		try {
			// 接收银行卡相关信息
			String name = request.getParameter("name");
			String Bankname = request.getParameter("Bankname");
			String Bank_no = request.getParameter("Bank_no");
			String provinces = request.getParameter("provinces");
			String branch = request.getParameter("branch");
			int count = shop.getShopUserisnoleder(pd);
			if (count > 0) {
				// 是店主
				pd.put("name", name);
				pd.put("Bankname", Bankname);
				pd.put("Bank_no", Bank_no);
				pd.put("branch", branch);
				pd.put("provinces", provinces);
				shop.addBankCar(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("添加成功");
			} else {
				// 不是店主不允许添加
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("不是店主不可添加");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 提现申请
	@RequestMapping(value = "shopApplyMOney")
	@ResponseBody
	public ResponseEntity<?> shopApplyMOney(HttpServletRequest request) {
		// 发起提现申请
		String bankNO = request.getParameter("bankNO");
		String userid = request.getParameter("userid");
		String shop_id = request.getParameter("shop_id");
		String money = request.getParameter("money");
		String code = request.getParameter("code");
		// 判断是不是店员
		PageData pd = new PageData();
		pd.put("bankNO", bankNO);
		pd.put("userid", userid);
		pd.put("shop_id", shop_id);
		pd.put("money", money);
		try {
			int count = shop.getShopUserisnoleder(pd);
			if (count > 0) {
				// 是店主
				// 查询到用户的验证码和验证码发送时间
				pd = shop.getUSerTxcode(pd);
				String bingtel = pd.get("bingtel").toString();
				int time = (int) (System.currentTimeMillis() / 1000);
				int begintime = Integer.parseInt(pd.get("codetime").toString());
				int over = time - begintime;
				if (pd.get("code").toString().equals(code)) {
					if (over <= 120) {
						// 验证啊正确且在规定时间之内
						// 再验证店铺的提现金额是否大于可提现金额
						pd = new PageData();
						pd.put("shop_id", shop_id);
						pd = financl.getShopCanmoneyapply(pd);
						if (Double.parseDouble(pd.get("money").toString()) < Double.parseDouble(money)) {
							return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
									.setMsg("失败,您的提现金额超过了您的可提现金额！");
						} else {
							String TXorderNO = "bk" + System.currentTimeMillis() / 1000;
							pd = new PageData();
							pd.put("TXorderNO", TXorderNO);
							pd.put("bankNO", bankNO);
							pd.put("userid", userid);
							pd.put("shop_id", shop_id);
							pd.put("money", money);
							pd.put("bingtel", bingtel);
							// 执行提现申请操作
							shop.shopUserTx(pd);
							pd = new PageData();
							pd.put("money", money);
							pd.put("bankNO", bankNO);
							pd.put("TXorderNO", TXorderNO);
							pd.put("shop_id", shop_id);
							// 更新店铺余额
							shop.updateShopMoney(pd);

							return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd)
									.setMsg("提现申请成功");
						}

					} else {
						pd = new PageData();
						return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("验证码过期");
					}
				} else {
					pd = new PageData();
					return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("验证码错误");
				}

			} else {
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.EXCEPTION).setData(pd).setMsg("不是店主");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 提现获取验证码
	@RequestMapping(value = "getUserCode")
	@ResponseBody
	public ResponseEntity<?> getUserCode(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		try {
			pd.put("userid", userid);
			pd.put("shop_id", shop_id);
			// 根据店铺id和用户id查询到店铺绑定的手机号码
			String phone = shop.getShopPhone(pd);
			// 将手机号码更新到店主的账号中
			pd.put("phone", phone);
			shop.updateshopUsertel(pd);
			// 发送验证码
			String random = SDKUtils.getVerificationCode();
			HashMap<String, Object> result = SDKUtils.sendmessger(phone, random);
			if ("000000".equals(result.get("statusCode"))) {
				// 发送成功将数据写入到数据库中
				pd.put("random", random);
				shop.updatesendCode(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("验证码获取成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("号码错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询订单详情
	@RequestMapping(value = "getOrderbackInfo")
	@ResponseBody
	public ResponseEntity<?> getOrderbackInfo(HttpServletRequest request) {
		try {
			String order_no = request.getParameter("order_no");
			List<PageData> list = new ArrayList<>();
			PageData pd = new PageData();
			pd.put("order_no", order_no);
			list = shopAndorderService.getOrderGoods(pd);
			// 判断该订单是否是预约类型的
			Integer count = shopAndorderService.getOrderIsbasepeak(pd);
			if (count > 0) {
				// 预约类型的订单
				pd = shopAndorderService.getbasespeakInfo(pd);
			} else {
				// 进店点菜类型的订单详情查询
				pd = new PageData();
				pd.put("order_no", order_no);
				pd = shopAndorderService.getOrderGOType(pd);
			}
			pd.put("list", list);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店主的银行卡列表
	@RequestMapping(value = "getUserBanklist")
	@ResponseBody
	public ResponseEntity<?> getUserBanklist(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		PageData pd = new PageData();
		try {
			pd.put("userid", userid);
			// 根据用户id查询到店主的银行卡列表
			List<PageData> list = new ArrayList<>();
			list = shop.getShopBankList(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询系统下允许添加的银行
	@RequestMapping(value = "getSysBankList")
	@ResponseBody
	public ResponseEntity<?> getSysBankList(HttpServletRequest request) {
		try {
			String[] str = { "中国银行", "建设银行", "农业银行", "工商银行" };
			return new ResponseEntity<String[]>().setState(Constants.SUCCESS).setData(str).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询今日预约订单/明日预约订单
	@RequestMapping(value = "getOrderaboutorderList")
	@ResponseBody
	public ResponseEntity<?> getOrderaboutorderList(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer page = Integer.parseInt(request.getParameter("index"));
		Integer rows = 10;
		Integer type = Integer.parseInt(request.getParameter("type"));

		try {
			PageData pd = new PageData();
			pd.put("shop_id", shop_id);
			pd.put("startrows", (page - 1) * rows);
			pd.put("rows", rows);
			List<PageData> list = new ArrayList<>();
			if(type==1){
				//查询今日预约订单列表
				pd.put("type", 1);
				list = shop.getOrderaboutorderList(pd);
				if (list.size() > 0) {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
				} else {
					return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
				}
			}else{
				//查询明日订单预约列表
				pd.put("type", 2);
				list = shop.getOrderaboutorderList(pd);
				if (list.size() > 0) {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
				} else {
					return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg("暂无数据");

		}
	}

}
