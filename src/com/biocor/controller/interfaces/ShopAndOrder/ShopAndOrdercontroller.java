package com.biocor.controller.interfaces.ShopAndOrder;

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
import com.biocor.entity.shoping.GoodsType;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.util.Constants;
import com.biocor.util.DateUtil;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.QRCode;
import com.biocor.util.ResponseEntity;
import com.biocor.util.StringUtil;
import com.biocor.util.UuidUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "interface/shoporder")
public class ShopAndOrdercontroller extends BaseController {
	// 商户大类
	@Resource
	private ShopAndorderService shopAndorderService;

	@Resource(name = "orderPrizeService")
	private OrderPrizeService orderPrizeService;

	// 用户关注和取消关注商户
	@RequestMapping(value = "FocusYesON")
	@ResponseBody
	public ResponseEntity<?> FocusYesON(HttpServletRequest request) {
		try {
			// 接收用户和传来用户id和商户号id的信息
			String uf_userId = request.getParameter("uf_userId");
			String uf_sid = request.getParameter("uf_sid");
			// 先判断该用户已经收藏这个店没有如果收藏了再次点击就取消收藏如果没有收藏就收藏
			PageData pd = new PageData();
			pd.put("uf_userId", uf_userId);
			pd.put("uf_sid", uf_sid);
			Integer count = shopAndorderService.getFocusIsOrno(pd);
			if (count > 0) {
				// 执行取消收藏操作
				shopAndorderService.CancelFocus(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("取消关注成功");
			} else {
				// 执行收藏操作
				// 先查询店铺相关信息
				pd = shopAndorderService.getshopInfoH5(pd);
				String uf_shop_name = pd.get("shop_name").toString();
				String uf_shop_images = pd.get("shop_images").toString();
				pd = new PageData();
				pd.put("uf_userId", uf_userId);
				pd.put("uf_sid", uf_sid);
				pd.put("uf_shop_name", uf_shop_name);
				pd.put("uf_shop_images", uf_shop_images);
				shopAndorderService.FoucsYes(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("关注成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 用户预约就餐
	@RequestMapping(value = "appointment")
	@ResponseBody
	public ResponseEntity<?> appointment(HttpServletRequest request) {

		try {
			// 接收预约者的信息
			// 接收预约者传来的信息
			String ub_userId = request.getParameter("ub_userId");
			PageData pd = new PageData();
			String ub_userName = request.getParameter("user_name").toString();
			String ub_userTel = request.getParameter("user_phone").toString();
			String ub_bespeakdate = request.getParameter("ub_bespeakdate").trim();
			String ub_dinersNum = request.getParameter("ub_dinersNum");
			String ub_ISroom = request.getParameter("ub_ISroom");
			String ub_sid = request.getParameter("ub_sid");
			String ub_remark = request.getParameter("remark");
			pd = new PageData();
			pd.put("ub_userId", ub_userId);
			pd.put("ub_userName", ub_userName);
			pd.put("ub_userTel", ub_userTel);
			pd.put("ub_bespeakdate", ub_bespeakdate);
			pd.put("ub_dinersNum", ub_dinersNum);
			pd.put("ub_ISroom", ub_ISroom);
			pd.put("ub_sid", ub_sid);
			pd.put("ub_state", 1);
			pd.put("ub_remark", ub_remark);
			// 创建预约信息
			shopAndorderService.createAppointment(pd);
			// 查询用户最新的一条预约并返回预约的id
			pd = new PageData();
			pd.put("ub_userId", ub_userId);
			String Yid = shopAndorderService.getUserYuyid(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(Yid).setMsg("预约成功，请先点菜");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 预约点餐创建订单
	@RequestMapping(value = "Bookingmeal")
	@ResponseBody
	public ResponseEntity<?> Bookingmeal(HttpServletRequest request) {
		try {
			// 接收预约者传来的信息预约id
			String Yid = request.getParameter("Yid");
			PageData pd = new PageData();
			pd.put("Yid", Yid);
			// 查询预约时间
			String ub_bespeakdate = shopAndorderService.getYuetime(pd);
			String data = request.getParameter("data");
			// 积分总数
			String ui_integral_score = request.getParameter("ui_integral_score");
			pd = new PageData();
			Integer order_type = 0;
			Integer order_pay_state = 0;
			Integer order_state = 0;
			String order_repast_date = ub_bespeakdate;
			String od_oNO = "BK" + StringUtil.getOrderNo();
			String str = request.getSession().getServletContext().getRealPath("/");
			String order_qcode = "upload/code/order/order_" + UuidUtil.get32UUID() + ".png";
			String content = General.HOST_URL + "scanCode?id=" + od_oNO;
			QRCode handler = new QRCode();
			handler.encoderQRCode(content, str + order_qcode);
			String order_userId = request.getParameter("order_userId");
			String order_sid = request.getParameter("order_sid");
			pd.put("order_userId", order_userId);
			int jifenCout = shopAndorderService.getUserJifenCount(pd);
			if (jifenCout >= Integer.parseInt(ui_integral_score)) {

				// 根据店铺Id查询店铺名称
				pd = new PageData();
				pd.put("order_sid", order_sid);
				String order_shopName = shopAndorderService.getshopName(pd);
				JSONArray jsonArray = JSONArray.fromObject(data);
				pd = new PageData();
				float totole = 0;
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject jsonDate = (JSONObject) jsonArray.get(i);
					String od_goodsId = jsonDate.get("od_goodsId").toString();
					String od_goodsName = jsonDate.get("od_goodsName").toString();
					String od_goodsNum = jsonDate.get("od_goodsNum").toString();
					String od_goods_Pmoeny = jsonDate.get("od_goods_Pmoeny").toString();
					pd.put("od_oNO", od_oNO);
					pd.put("od_goodsId", od_goodsId);
					pd.put("od_goodsName", od_goodsName);
					pd.put("od_goodsNum", od_goodsNum);
					// 计算小计
					float goodsSmoeny = Float.parseFloat(od_goodsNum) * Float.parseFloat(od_goods_Pmoeny);
					pd.put("od_goods_Pmoeny", od_goods_Pmoeny);
					pd.put("od_goods_Smoeny", goodsSmoeny);
					// 创建订单明细
					shopAndorderService.addorderMill(pd);
					// 计算订单总金额
					totole = totole + goodsSmoeny;
				}
				float order_money = totole;
				// 创建大订单主表
				pd = new PageData();
				pd.put("order_money", order_money);
				pd.put("order_type", order_type);
				pd.put("order_pay_state", order_pay_state);
				pd.put("order_state", order_state);
				pd.put("order_qcode", order_qcode);
				pd.put("order_userId", order_userId);
				pd.put("order_sid", order_sid);
				pd.put("order_no", od_oNO);
				pd.put("order_shopName", order_shopName);
				pd.put("order_repast_date", order_repast_date);
				// 创建订单明细
				shopAndorderService.createBigOrder(pd);
				// 查询预约信息
				pd = new PageData();
				pd.put("Yid", Yid);
				pd.put("order_no", od_oNO);
				// 将生成的订单id更新到预约的信息中
				shopAndorderService.updateYueInfo(pd);
				// 查询预约信息
				pd = new PageData();
				pd.put("Yid", Yid);
				pd = shopAndorderService.getUserYueinfo(pd);
				Map<String, Object> map = new HashMap<>();
				map.put("ub_userName", pd.get("ub_userName"));
				map.put("ub_userTel", pd.get("ub_userTel"));
				map.put("ub_bespeakdate", pd.get("ub_bespeakdate"));
				map.put("ub_dinersNum", pd.get("ub_dinersNum"));
				map.put("ub_ISroom", pd.get("ub_ISroom"));
				map.put("ub_sid", pd.get("ub_sid"));
				map.put("order_no", od_oNO);
				map.put("order_repast_date", order_repast_date);
				map.put("order_shopName", order_shopName);
				map.put("order_money", order_money);
				map.put("order_no", od_oNO);
				map.put("totalintegral", ui_integral_score);
				// 加入积分消费信息
				// 进行积分修改
				if (Integer.parseInt(ui_integral_score) > 0) {
					pd = new PageData();
					pd.put("ui_integral_score", ui_integral_score);
					pd.put("order_userId", order_userId);
					shopAndorderService.updatejifen(pd);
					// 写入用户积分消费记录
					pd = new PageData();
					pd.put("ui_userid", order_userId);
					pd.put("ui_integral_type", 2);
					pd.put("ui_integral_score", ui_integral_score);
					pd.put("ui_sid", order_sid);
					pd.put("ui_ISsid", 1);
					shopAndorderService.insertJifeninfo(pd);
				}
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("订单创建成功，未付款待预约");
			} else {
				// 积分余额不够
				Map<String, Object> map = new HashMap<>();
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("积分余额不够消费");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查看店家的菜谱
	@RequestMapping(value = "getFeedByshopGoodslist")
	@ResponseBody
	public ResponseEntity<?> getFeedBytypelist(HttpServletRequest request) {
		try {
			// 必传
			String goods_sid = request.getParameter("shop_id");
			// 接收菜品类型的id
			// 有就按类型查询没有查询
			PageData pd = new PageData();
			pd.put("goods_sid", goods_sid);
			// 查询全部菜品
			List<GoodsType> listGoods = shopAndorderService.findgoodsTypeList(goods_sid);
			// 根据店铺id查询餐位费信息
			pd = new PageData();
			pd.put("shop_id", goods_sid);
			pd = shopAndorderService.getShopInfo(pd);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("listGoods", listGoods);
			Map<String, Object> map = new HashMap<>();
			if (pd == null) {
				jsonObject.put("shopfees", map);
			} else {
				String goods_moeny = pd.get("shop_seat_money").toString();
				String shop_id = goods_sid;
				map.put("gid", 0);
				map.put("goods_moeny", goods_moeny);
				map.put("goods_sid", shop_id);
				map.put("goods_name", pd.get("shop_seat_name").toString());
				jsonObject.put("shopfees", map);
			}
			/*
			 * String goods_moeny = pd.get("shop_seat_money").toString(); String
			 * shop_id = goods_sid; Map<String, Object> map = new HashMap<>();
			 * map.put("gid", 0); map.put("goods_moeny", goods_moeny);
			 * map.put("goods_sid", shop_id); map.put("goods_name",
			 * pd.get("shop_seat_name").toString()); JSONObject jsonObject = new
			 * JSONObject(); jsonObject.put("listGoods", listGoods);
			 * jsonObject.put("shopfees", map);
			 */
			return new ResponseEntity<JSONObject>().setState(Constants.SUCCESS).setData(jsonObject)
					.setMsg("全部菜品数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 到店点菜创建订单
	@RequestMapping(value = "goSettlement")
	@ResponseBody
	public ResponseEntity<?> goSettlement(HttpServletRequest request) {
		try {
			String data = request.getParameter("data");
			String ui_integral_score = request.getParameter("ui_integral_score");
			Integer order_type = 1;
			Integer order_pay_state = 0;
			Integer order_state = 0;
			String order_repast_date = DateUtil.getTime();
			String od_oNO = "BK" + StringUtil.getOrderNo();
			String str = request.getSession().getServletContext().getRealPath("/");
			String order_qcode = "upload/code/order/order_" + UuidUtil.get32UUID() + ".png";
			String content = General.HOST_URL + "scanCode?id=" + od_oNO;
			QRCode handler = new QRCode();
			handler.encoderQRCode(content, str + order_qcode);
			String order_userId = request.getParameter("order_userId");
			String order_sid = request.getParameter("order_sid");
			PageData pd = new PageData();
			pd.put("order_userId", order_userId);
			int jifenCout = shopAndorderService.getUserJifenCount(pd);
			if (jifenCout >= Integer.parseInt(ui_integral_score)) {

				// 根据店铺Id查询店铺名称
				pd = new PageData();
				pd.put("order_sid", order_sid);
				String order_shopName = shopAndorderService.getshopName(pd);
				JSONArray jsonArray = JSONArray.fromObject(data);
				pd = new PageData();
				float totole = 0;
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject jsonDate = (JSONObject) jsonArray.get(i);
					String od_goodsId = jsonDate.get("od_goodsId").toString();
					String od_goodsName = jsonDate.get("od_goodsName").toString();
					String od_goodsNum = jsonDate.get("od_goodsNum").toString();
					float od_goods_Pmoeny = Float.parseFloat(jsonDate.get("od_goods_Pmoeny").toString());
					// 计算小计
					float goodsSmoeny = Float.parseFloat(od_goodsNum) * od_goods_Pmoeny;
					pd.put("od_oNO", od_oNO);
					pd.put("od_goodsId", od_goodsId);
					pd.put("od_goodsName", od_goodsName);
					pd.put("od_goodsNum", od_goodsNum);
					pd.put("od_goods_Pmoeny", od_goods_Pmoeny);
					pd.put("od_goods_Smoeny", goodsSmoeny);
					// 创建订单明细
					shopAndorderService.addorderMill(pd);
					totole = totole + goodsSmoeny;
				}
				float order_money = totole;
				// 创建大订单主表
				pd = new PageData();
				pd.put("order_money", order_money);
				pd.put("order_type", order_type);
				pd.put("order_pay_state", order_pay_state);
				pd.put("order_state", order_state);
				pd.put("order_qcode", order_qcode);
				pd.put("order_userId", order_userId);
				pd.put("order_sid", order_sid);
				pd.put("order_no", od_oNO);
				pd.put("order_shopName", order_shopName);
				pd.put("order_repast_date", order_repast_date);
				// 创建订单明细
				shopAndorderService.createBigOrder(pd);
				pd = new PageData();
				pd.put("order_no", od_oNO);
				pd.put("order_repast_date", order_repast_date);
				pd.put("order_shopName", order_shopName);
				pd.put("order_money", order_money);
				pd.put("order_no", od_oNO);
				pd.put("totalintegral", ui_integral_score);
				// 进行积分修改
				// 查询用户积分余额
				if (Integer.parseInt(ui_integral_score) > 0) {
					pd = new PageData();
					pd.put("ui_integral_score", ui_integral_score);
					pd.put("order_userId", order_userId);
					shopAndorderService.updatejifen(pd);
					// 写入用户积分消费记录
					pd = new PageData();
					pd.put("ui_userid", order_userId);
					pd.put("ui_integral_type", 2);
					pd.put("ui_integral_score", ui_integral_score);
					pd.put("ui_sid", order_sid);
					pd.put("ui_ISsid", 1);
					shopAndorderService.insertJifeninfo(pd);
				}
				Map<String, Object> map = new HashMap<>();
				map.put("order_no", od_oNO);
				map.put("order_repast_date", order_repast_date);
				map.put("order_shopName", order_shopName);
				map.put("order_money", order_money);
				map.put("order_no", od_oNO);
				map.put("totalintegral", ui_integral_score);
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("订单创建成功");

			} else {
				// 积分余额不够
				Map<String, Object> map = new HashMap<>();
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("积分余额不够消费");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 用户查询我的订单列表默认传1查询未消费订单
	@RequestMapping(value = "orderList")
	@ResponseBody
	public ResponseEntity<?> orderList(HttpServletRequest request) {
		try {
			// 按照订单类型来执行查询默认查询未消费订单
			String userid = request.getParameter("userid");
			String type = request.getParameter("type");
			Integer page = Integer.parseInt(request.getParameter("index"));
			Integer rows = 10;
			List<PageData> list = new ArrayList<>();
			Integer order_state = null;
			PageData pd = new PageData();
			pd.put("userid", userid);
			pd.put("startRows", (page - 1) * rows);
			pd.put("rows", rows);
			if (type.equals("1")) {
				// 查询未消费订单列表
				order_state = 1;
				pd.put("order_state", order_state);
				list = shopAndorderService.orderList(pd);
				if (list.size() > 0) {
					for (int i = 0; i < list.size(); i++) {
						PageData p = list.get(i);

						// 订单是否能抽奖
						pd = new PageData();
						pd.put("orderNo", p.get("order_no"));
						pd = orderPrizeService.isOrderCanPrize(pd);
						int cannum = Integer.parseInt(pd.get("num").toString());
						if (cannum == 0) {
							p.put("num", "-1");
						} else {

							// 订单是否抽奖
							pd = new PageData();
							pd.put("orderNo", p.get("order_no"));
							pd = orderPrizeService.isOrderPrize(pd);
							int num = Integer.parseInt(pd.get("num").toString());
							p.put("num", num);

							if (num == 1) {
								// 订单是否领取
								pd = new PageData();
								pd.put("orderNo", p.get("order_no"));
								pd = orderPrizeService.isOwnOrderPrize(pd);
								String state = pd.get("us_state").toString();
								if ("2".equals(state)) {
									p.put("num", 2);
								}
							}
						}

					}
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("暂无数据");
				}
			} else if (type.equals("2")) {
				// 查询未支付订单列表
				order_state = 0;
				pd.put("order_state", order_state);
				list = shopAndorderService.orderList(pd);
				if (list.size() > 0) {
					// 订单是否抽奖
					for (int i = 0; i < list.size(); i++) {
						PageData p = list.get(i);

						// 订单是否能抽奖
						pd = new PageData();
						pd.put("orderNo", p.get("order_no"));
						pd = orderPrizeService.isOrderCanPrize(pd);
						int cannum = Integer.parseInt(pd.get("num").toString());
						if (cannum == 0) {
							p.put("num", "-1");
						} else {
							p.put("num", 0);
						}
					}
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("暂无数据");
				}
			} else {
				// 查询已消费订单列表
				order_state = 2;
				pd.put("order_state", order_state);
				list = shopAndorderService.orderList(pd);
				if (list.size() > 0) {

					for (int i = 0; i < list.size(); i++) {
						PageData p = list.get(i);

						// 订单是否能抽奖
						pd = new PageData();
						pd.put("orderNo", p.get("order_no"));
						pd = orderPrizeService.isOrderCanPrize(pd);
						int cannum = Integer.parseInt(pd.get("num").toString());
						if (cannum == 0) {
							p.put("num", "-1");
						} else {

							// 订单是否抽奖
							pd = new PageData();
							pd.put("orderNo", p.get("order_no"));
							pd = orderPrizeService.isOrderPrize(pd);
							int num = Integer.parseInt(pd.get("num").toString());
							p.put("num", num);

							if (num == 1) {
								// 订单是否领取
								pd = new PageData();
								pd.put("orderNo", p.get("order_no"));
								pd = orderPrizeService.isOwnOrderPrize(pd);
								String state = pd.get("us_state").toString();
								if ("2".equals(state)) {
									p.put("num", 2);
								}
							}
						}

					}
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("数据获取成功");
				} else {
					return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
							.setMsg("暂无数据");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 删除我的订单
	@RequestMapping(value = "deleteOrderByorderno")
	@ResponseBody
	public ResponseEntity<?> deleteOrderByorderno(HttpServletRequest request) {
		try {
			String order_no = request.getParameter("order_no");
			String userid = request.getParameter("userid");
			PageData pd = new PageData();
			pd.put("order_no", order_no);
			pd.put("userid", userid);
			// 查询该订单的状态0:未付款；1:已付款;2:已消费;3已删除 状态等于2的不能删除
			Integer order_state = shopAndorderService.getOrderState(pd);
			if (order_state == 2) {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("不能删除");
			} else {
				// 执行订单状态修改为删除状态
				shopAndorderService.updateOrderdelete(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("删除成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询订单详情
	@RequestMapping(value = "getOrderInfo")
	@ResponseBody
	public ResponseEntity<?> getOrderInfo(HttpServletRequest request) {
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

	// 用户评价
	@RequestMapping(value = "userEvaluation")
	@ResponseBody
	public ResponseEntity<?> userEvaluation(HttpServletRequest request) {
		try {
			// 接收用户传递的参数
			String userid = request.getParameter("userid");
			String se_sid = request.getParameter("shopid");
			Integer se_service = Integer.parseInt(request.getParameter("se_service"));
			float service = se_service;
			Integer se_speed = Integer.parseInt(request.getParameter("se_speed"));
			float speed = se_speed;
			Integer se_environment = Integer.parseInt(request.getParameter("se_environment"));
			float environment = se_environment;
			String se_taste = request.getParameter("se_taste");
			String se_orderNo = request.getParameter("se_orderNo");
			PageData pd = new PageData();
			pd.put("userid", userid);
			pd.put("se_orderNo", se_orderNo);
			pd = shopAndorderService.orderEvalCount(pd);
			String num = pd.get("num").toString();
			if ("1".equals(num)) {
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("订单已经评论过");
			}
			pd.put("userid", userid);
			pd.put("se_sid", se_sid);
			pd.put("se_service", se_service);
			pd.put("se_speed", se_speed);
			pd.put("se_environment", se_environment);
			pd.put("se_taste", se_taste);
			// 获取最后的总评分四舍五入
			Integer se_grade = Math.round((service + speed + environment) / 3);
			pd.put("se_grade", se_grade);
			pd.put("userid", userid);
			pd.put("se_sid", se_sid);
			pd.put("se_service", se_service);
			pd.put("se_speed", se_speed);
			pd.put("se_environment", se_environment);
			pd.put("se_taste", se_taste);
			pd.put("se_orderNo", se_orderNo);
			// 添加评价
			shopAndorderService.userEvaluation(pd);
			// 根据店铺的id查询到用户评价表中对该店铺的最后总评分
			pd = new PageData();
			pd.put("se_sid", se_sid);
			float stratgrade = shopAndorderService.getshopSumAndranoud(pd);
			// 查询评论的数量
			float count = shopAndorderService.getshopcount(pd);
			if (count == 0) {
				count = 1;
			}
			Integer star = Math.round(stratgrade / count);
			pd.put("star", star);
			// 更新店铺的星级
			shopAndorderService.updateShopstar(pd);
			return new ResponseEntity<Integer>().setState(Constants.SUCCESS).setData(se_grade)
					.setMsg("评论成功最后店铺评分等级为" + se_grade);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 判断用户是否可以取消订单
	@RequestMapping(value = "isCancelOrder")
	@ResponseBody
	public ResponseEntity<?> isCancelOrder(HttpServletRequest request) {
		try {
			String order_no = request.getParameter("order_no");

			// 订单是否支付
			PageData pd = new PageData();
			pd.put("orderNo", order_no);
			pd = orderPrizeService.getOrderInfoByNo(pd);
			String pay_state = pd.get("order_pay_state").toString();
			String order_state = pd.get("order_state").toString();
			if (!"1".equals(pay_state)) {
				return new ResponseEntity<String>().setState(5).setData("").setMsg("订单未支付,不能取消");
			}
			if ("2".equals(order_state)) {
				return new ResponseEntity<String>().setState(5).setData("").setMsg("订单已完成,不能取消");
			}

			// 判断是否是预约单
			pd = new PageData();
			pd.put("orderNo", order_no);
			pd = shopAndorderService.isOrderBespeak(pd);
			String num = pd.get("num").toString();
			if ("0".equals(num)) {
				return new ResponseEntity<String>().setState(3).setData("").setMsg("非预约订单,不能取消");
			}
			// 判断是否领取过奖励
			pd = new PageData();
			pd.put("orderNo", order_no);
			pd = shopAndorderService.isOrderPrize(pd);
			String pnum = pd.get("num").toString();
			if ("1".equals(pnum)) {
				return new ResponseEntity<String>().setState(4).setData("").setMsg("订单已领取奖励,不能取消");
			}

			// 判断是否大于1小时，查询该订单预约时间
			pd = new PageData();
			pd.put("order_no", order_no);
			Long conventionTime = shopAndorderService.getorderConventionTime(pd);
			Long thtime = System.currentTimeMillis() / 1000;
			// 计算预约时间与取消订单的时间差
			double timeEnd = (Double.parseDouble(conventionTime.toString()) - Double.parseDouble(thtime.toString()))
					/ (3600);

			// 订单取消时间延后
			if (timeEnd < 0) {
				return new ResponseEntity<String>().setState(2).setData("").setMsg("订单取消时间延后，取消要收取30%手续费");
			} else if (timeEnd >= 0 && timeEnd < 1) {
				return new ResponseEntity<String>().setState(1).setData("").setMsg("订单取消时间小于1小时，取消要收取10%手续费");
			} else {// (timeEnd >= 1)
				return new ResponseEntity<String>().setState(0).setData("").setMsg("订单取消时间大于1小时,可以全额退款");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 用户取消订单申请
	@RequestMapping(value = "cancelOrder")
	@ResponseBody
	public ResponseEntity<?> cancelOrder(HttpServletRequest request) {
		try {
			String order_no = request.getParameter("order_no");
			String cancel_userid = request.getParameter("cancel_userid");

			// 订单是否支付
			PageData pd = new PageData();
			pd.put("orderNo", order_no);
			pd = orderPrizeService.getOrderInfoByNo(pd);
			String pay_state = pd.get("order_pay_state").toString();
			String order_state = pd.get("order_state").toString();
			if (!"1".equals(pay_state)) {
				return new ResponseEntity<String>().setState(5).setData("").setMsg("订单未支付,不能取消");
			}
			if ("2".equals(order_state)) {
				return new ResponseEntity<String>().setState(5).setData("").setMsg("订单已完成,不能取消");
			}

			// 判断是否是预约单
			pd = new PageData();
			pd.put("orderNo", order_no);
			pd = shopAndorderService.isOrderBespeak(pd);
			String num = pd.get("num").toString();
			if ("0".equals(num)) {
				return new ResponseEntity<String>().setState(3).setData("").setMsg("非预约订单,不能取消");
			}
			// 判断是否领取过奖励
			pd = new PageData();
			pd.put("orderNo", order_no);
			pd = shopAndorderService.isOrderPrize(pd);
			String pnum = pd.get("num").toString();
			if ("1".equals(pnum)) {
				return new ResponseEntity<String>().setState(4).setData("").setMsg("订单已领取奖励,不能取消");
			}

			// 查询该订单预约时间
			pd = new PageData();
			pd.put("order_no", order_no);
			Long conventionTime = shopAndorderService.getorderConventionTime(pd);

			// 通过订单ID查询订单详情
			pd = new PageData();
			pd.put("orderNo", order_no);
			pd = orderPrizeService.getOrderInfoByNo(pd);
			String cancel_moeny = pd.get("order_money").toString();
			Long thtime = System.currentTimeMillis() / 1000;
			// 计算预约时间与取消订单的时间差
			double timeEnd = (Double.parseDouble(conventionTime.toString()) - Double.parseDouble(thtime.toString()))
					/ (3600);
			double money = 0;
			String type = "";
			if (timeEnd < 0) {
				// 订单取消时间延后 收取30% 手续费
				money = Double.parseDouble(cancel_moeny) * 0.7;
				type = "2";
			} else if (timeEnd >= 0 && timeEnd < 1) {
				// 收取10%手续费用
				money = Double.parseDouble(cancel_moeny) * 0.9;
				type = "1";
			} else {
				// 全额退款
				money = Double.parseDouble(cancel_moeny);
				type = "0";
			}

			// 新增申请退款记录
			String cancel_no = StringUtil.getOrderNo();
			pd = new PageData();
			pd.put("cancel_state", "1");
			pd.put("cancel_userid", cancel_userid);
			pd.put("cancel_no", cancel_no);
			pd.put("order_no", order_no);
			pd.put("cancel_moeny", money);
			pd.put("cancel_type", type);
			shopAndorderService.cancelOrder(pd);
			// 修改订单的状态
			pd = new PageData();
			pd.put("order_no", order_no);
			pd.put("order_state", 4);
			shopAndorderService.updateOrderstate(pd);

			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("订单取消成功，等待审核");

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 判断用户的积分是否可以兑换菜品
	@RequestMapping(value = "Points")
	@ResponseBody
	public ResponseEntity<?> Points(HttpServletRequest request) {
		try {
			String userid = request.getParameter("userid");
			String user_integral = request.getParameter("user_integral");
			// 判断用户的积分是否够
			PageData pd = new PageData();
			pd.put("userid", userid);
			Integer integral = shopAndorderService.getUserintegral(pd);
			// 判断用户积分是够用
			Integer getintegral = Integer.parseInt(user_integral);
			if (getintegral > integral) {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("积分不够兑换条件不允许兑换");

			} else {
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("准许使用积分换购");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询用户是否关注当前店铺
	@RequestMapping(value = "UserIsnoAttention")
	@ResponseBody
	public ResponseEntity<?> UserIsnoAttention(HttpServletRequest request) {
		try {
			String userid = request.getParameter("userid");
			String shopid = request.getParameter("shopid");
			PageData pd = new PageData();
			pd.put("userid", userid);
			pd.put("shopid", shopid);
			Integer Attention = shopAndorderService.getUserIsnoAttention(pd);
			if (Attention > 0) {
				Attention = 1;
			} else {
				Attention = 0;
			}
			return new ResponseEntity<Integer>().setState(Constants.SUCCESS).setData(Attention).setMsg("成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店铺页面详情h5
	@RequestMapping(value = "getshopInfoH5")
	@ResponseBody
	public ResponseEntity<?> getshopInfoH5(HttpServletRequest request) {
		try {
			String uf_sid = request.getParameter("uf_sid");
			PageData pd = new PageData();
			pd.put("uf_sid", uf_sid);
			pd = shopAndorderService.getshopInfoH5(pd);
			if (pd != null) {
				// 进入该接口 执行浏览次数的累加每次加1每天只加入一条数据记录
				PageData pd2 = new PageData();
				pd2.put("uf_sid", uf_sid);
				// 先判断数据是否存在
				int count = shopAndorderService.getShopbrowse(pd2);
				if (count > 0) {
					// 存在 数据加1
					shopAndorderService.updateShopbrowsecount(pd2);
				} else {
					// 不存在插入第一条数据并 赋值为1
					shopAndorderService.insertShopbrowseinfo(pd2);
				}
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
			} else {
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询奖励页面详情h5
	@RequestMapping(value = "getRewardInfoH5")
	@ResponseBody
	public ResponseEntity<?> getRewardInfoH5(HttpServletRequest request) {
		try {
			List<PageData> list = new ArrayList<>();
			list = shopAndorderService.getRewardInfoH5();
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
			} else {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 用户评价查询
	@RequestMapping(value = "getUserToorderevaluationInfo")
	@ResponseBody
	public ResponseEntity<?> getUserToorderevaluationInfo(HttpServletRequest request) {
		try {
			String userid = request.getParameter("userid");
			String se_orderNo = request.getParameter("se_orderNo");
			PageData pd = new PageData();
			pd.put("userid", userid);
			pd.put("se_orderNo", se_orderNo);
			// 判断用户是否已经评价如果已经评价返回状态为1已评价
			pd = shopAndorderService.orderEvalCount(pd);
			if (pd.get("num").toString().equals("1")) {
				/*
				 * count(1) as num,se_service,se_speed,se_environment,se_taste
				 */
				String se_service = pd.get("se_service").toString();
				String se_speed = pd.get("se_speed").toString();
				String se_environment = pd.get("se_environment").toString();
				String se_taste = pd.get("se_taste").toString();
				pd = new PageData();
				pd.put("se_service", se_service);
				pd.put("se_speed", se_speed);
				pd.put("se_environment", se_environment);
				pd.put("se_taste", se_taste);
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("您已经评价过了");
			} else {
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("还没有评价");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}
}
