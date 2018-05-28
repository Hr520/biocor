package com.biocor.controller.interfaces.backShop;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.service.interfaces.backShop.ShopUserservice;
import com.biocor.util.Constants;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

/**
 * 
 * @author Administrator 查询用户相关信息大类主要与财务统计方面有关
 */
@Controller
@RequestMapping(value = "interface/user")
public class ShopUser extends BaseController {

	@Resource
	private ShopUserservice userservice;

	@Resource
	private ShameiShopUserService shopuserService;

	/* 查询店主提现记录 */
	@RequestMapping(value = "getsaleList")
	@ResponseBody
	public ResponseEntity<?> getsaleList(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		int page = Integer.parseInt(request.getParameter("index").toString());
		int rows = 10;
		try {
			PageData pd = new PageData();
			pd.put("shop_id", shop_id);
			pd.put("userid", userid);
			pd.put("startrows", (page - 1) * rows);
			pd.put("rows", rows);
			List<PageData> list = new ArrayList<>();
			list = userservice.getsaleList(pd);
			if (list.size() > 0) {
				// 查询到提现相关数据
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");

			} else {
				list = new ArrayList<>();
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 商品销量排行情况
	@RequestMapping(value = "goodsSaleslist")
	@ResponseBody
	public ResponseEntity<?> goodsSaleslist(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer page = Integer.parseInt(request.getParameter("index"));
		String datetime = request.getParameter("time");
		Integer rows = 10;
		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			pd.put("rows", rows);
			pd.put("datetime", datetime);
			pd.put("startrows", (page - 1) * rows);
			List<PageData> list = new ArrayList<>();
			// 定义一个新的list
			List<PageData> list2 = new ArrayList<>();

			list = userservice.goodsSaleslist(pd);
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					pd = new PageData();
					pd.put("od_goodsName", list.get(i).get("od_goodsName").toString());
					pd.put("goods_images", list.get(i).get("goods_images").toString());
					pd.put("salesTotal", list.get(i).get("salesTotal").toString());
					pd.put("salesMOney", list.get(i).get("salesMOney").toString());
					list2.add(pd);
				}
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list2).setMsg("数据获取成功");
			} else {
				list2 = new ArrayList<>();
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list2).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询收入明细
	@RequestMapping(value = "getShopMOneyInfoList")
	@ResponseBody
	public ResponseEntity<?> getShopMOneyInfoList(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		Integer page = Integer.parseInt(request.getParameter("index"));
		Integer rows = 10;
		try {
			PageData pd = new PageData();
			pd.put("userid", userid);
			pd.put("shop_id", shop_id);
			pd.put("startrows", (page - 1) * rows);
			pd.put("rows", rows);
			List<PageData> list = new ArrayList<>();
			list = userservice.getShopMOneyInfoList(pd);
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
			} else {
				list = new ArrayList<>();
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");

			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询我的收入
	@RequestMapping(value = "getShopMOneyInfo")
	@ResponseBody
	public ResponseEntity<?> getShopMOneyInfo(HttpServletRequest request) {
		// 获取店铺id
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		try {
			pd = userservice.getShopMOneyInfo(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询 店铺我的报表
	@RequestMapping(value = "getShopThereport")
	@ResponseBody
	public ResponseEntity<?> getShopThereport(HttpServletRequest request) {
		// 获取客户端传递的 参数
		String shop_id = request.getParameter("shop_id");
		String datetime = request.getParameter("time");
		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			pd.put("datetime", datetime);
			// 该部分数据包括今日出售菜品份数总金额今日访问人数
			pd = userservice.getShopThereport(pd);
			// 判断该订单是否是预约订单时预约订单查询就餐人数总数
			PageData pd2 = new PageData();
			pd2.put("shop_id", shop_id);
			pd2.put("datetime", datetime);
			// 查询店铺浏览次数
			int browsetotal = 0;
			String browsecount = userservice.geShopbrowseTotal(pd2);
			if (browsecount != null) {
				browsetotal = Integer.parseInt(browsecount);
			} else {

			}
			// 查询总的订单数
			int prepeople = userservice.getpeopletotal(pd2);
			// // 查询餐位费类型的人数总数
			// int people = userservice.getshopusertoatl(pd2);
			// 总人数
			int totalpeople = prepeople;
			// 获取总金额
			double totalmoney = Double.parseDouble(pd.get("moneytotalnumber").toString());
			// 订单均价
			double avgmoney = 0;
			if (totalpeople > 0) {
				avgmoney = (totalmoney / totalpeople);
			}
			// 计算转化率
			if (browsetotal == 0) {
				pd.put("browsetotal", browsetotal);
				browsetotal = 1;
			} else {
				pd.put("browsetotal", browsetotal);
			}
			float returnrate = (float) (Double.parseDouble(String.valueOf(prepeople))
					/ Double.parseDouble(String.valueOf(browsetotal)));
			// 去两位有效数字
			pd.put("totalpeople", totalpeople);
			BigDecimal b = new BigDecimal(avgmoney);
			double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			pd.put("returnrate", returnrate);
			pd.put("avgmoney", f1);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店铺可提现余额
	@RequestMapping(value = "getShopCanwithdrawalMOney")
	@ResponseBody
	public ResponseEntity<?> getShopCanwithdrawalMOney(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		PageData pd = new PageData();
		try {
			pd.put("userid", userid);
			pd.put("shop_id", shop_id);
			// 先判断用户是否是店主
			int count = userservice.getISNOshopper(pd);
			if (count > 0) {
				// 是店主可以操作
				double Shop_money = userservice.getShopCanwithdrawalMOney(pd);
				return new ResponseEntity<Double>().setState(Constants.SUCCESS).setData(Shop_money).setMsg("数据获取成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("没有操作权限");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setData("").setState(Constants.ERROR).setMsg(e.getMessage());
		}
	}

	// tag值设置
	@RequestMapping(value = "SetTagvalueShopandUser")
	@ResponseBody
	public ResponseEntity<?> SetTagvalueShopandUser(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		String tag_name = request.getParameter("tag_name");
		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			pd.put("userid", userid);
			pd.put("tag_name", tag_name);
			// 设置用户的tag值注店主和电源的tag值不同 ，店员tag值一样
			userservice.SetTagvalueShopandUser(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("设置成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 店主设置系统通知
	@RequestMapping(value = "setJPush")
	@ResponseBody
	public ResponseEntity<?> setJPush(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			int cancel = Integer.parseInt(request.getParameter("cancel"));// 1表示开启0表示
			int pay = Integer.parseInt(request.getParameter("pay"));// 1表示开启0表示
			int confirm = Integer.parseInt(request.getParameter("confirm"));// 1表示开启0表示
			int withdrawal = Integer.parseInt(request.getParameter("withdrawal"));// 1表示开启0表示
			// 将数据存为joson对象
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("cancel", cancel);
			jsonObject.put("pay", pay);
			jsonObject.put("confirm", confirm);
			jsonObject.put("withdrawal", withdrawal);
			// 将json对象转为json字符串
			String push = jsonObject.toString();
			// 执行设置
			pd.put("push", push);
			userservice.setJPush(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("设置成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 商户意见反馈
	@RequestMapping(value = "shopfeedback")
	@ResponseBody
	public ResponseEntity<?> shopfeedback(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String userid = request.getParameter("userid");
		String content = request.getParameter("content");
		Integer type = Integer.parseInt(request.getParameter("type").toString());
		// 查询该用户今日是否提交过
		PageData pd = new PageData();
		try {
			pd.put("shop_id", shop_id);
			pd.put("userid", userid);
			pd.put("content", content);
			pd.put("type", type);
			int count = userservice.getFeedback(pd);
			if (count > 0) {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("请勿重复提交");
			} else {
				userservice.addfeedback(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("提交成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询我的消息列表接口
	@RequestMapping(value = "getshopMessagelistpage")
	@ResponseBody
	public ResponseEntity<?> getshopMessagelistpage(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		Integer page = Integer.parseInt(request.getParameter("index"));
		String type = request.getParameter("type");
		Integer rows = 10;
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			pd.put("shop_id", shop_id);
			pd.put("startrows", (page - 1) * rows);
			pd.put("rows", rows);
			pd.put("type", type);
			// 查询我的消息列表
			list = userservice.getshopMessagelistpage(pd);
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
			} else {
				list = new ArrayList<>();
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 根据订单查询提现详情
	@RequestMapping(value = "getwithdrawalInfo")
	@ResponseBody
	public ResponseEntity<?> getwithdrawalInfo(HttpServletRequest request) {
		String order_no = request.getParameter("order_no");
		PageData pd = new PageData();
		pd.put("order_no", order_no);
		try {
			pd = userservice.getwithdrawalInfo(pd);
			if (pd != null) {
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
			} else {
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("传入id有误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 查询我的店铺今日订单和今日营业额
	@RequestMapping(value = "getTodayMOneyAndOrderTotal")
	@ResponseBody
	public ResponseEntity<?> getTodayMOneyAndOrderTotal(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		try {
			pd = shopuserService.getSHOpperINfo(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			pd = new PageData();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}

	}

	// 通过用户id查询到当前登录用户的rid
	@RequestMapping(value = "getUseregID")
	@ResponseBody
	public ResponseEntity<?> getUseregID(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		PageData pd = new PageData();
		pd.put("userid", userid);
		try {
			String regID = shopuserService.getUseregID(pd);
			if (regID != null && !regID.equals("")) {
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(regID).setMsg("获取成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("用户不存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());

		}
	}

	// 查询店铺的消息开关
	@RequestMapping(value = "getShopMessagePage")
	@ResponseBody
	public ResponseEntity<?> getShopMessagePage(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		try {
			PageData pd = new PageData();
			pd.put("shop_id", shop_id);
			// 查询当前店铺的消息开关
			String jstr = shopuserService.getShopMessagePage(pd);
			net.sf.json.JSONObject jsonObject2=net.sf.json.JSONObject.fromObject(jstr);
			return new ResponseEntity<net.sf.json.JSONObject>().setState(Constants.SUCCESS).setData(jsonObject2).setMsg("数据获取成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(null).setMsg(e.getMessage());
		}

	}
	//test
	@RequestMapping(value="test")
	@ResponseBody
	public ResponseEntity<?> testtee(@RequestParam String userid,String age){
		PageData pd=new PageData();
		pd.put("userid", userid);
		pd.put("age", age);
		return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("数据接收到了");
	}

}
