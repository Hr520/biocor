package com.biocor.controller.admin.financial;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.financial.FinancialService;
import com.biocor.util.Const;
import com.biocor.util.Constants;
import com.biocor.util.DateUtil;
import com.biocor.util.ObjectExcelView;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value = "financial")
/**
 * 财务管理 商户端
 * 
 * @author Administrator
 *
 */
public class FinancialController extends BaseController {
	@Resource
	private FinancialService financial;

	@RequestMapping(value = "Getfinancial")
	public ModelAndView Getfinancial(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<>();
		try {
			// 获取登录者的用户id
			// 获取权限
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
			String userid = sessionUser.getUSER_ID();
			// 根据用户的id查询店铺id
			PageData pd = new PageData();
			pd.put("userid", userid);
			String shop_id = financial.getshopid(pd);
			pd = new PageData();
			pd.put("shop_id", shop_id);
			// 查询当前店铺下的统计数据
			list = financial.getShopallMOneyfinancialInfo(pd);
			mv.setViewName("financial/Shop_financial");
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 商户端提现申请记录查询
	@RequestMapping(value = "getShopapplymoneylistPage")
	public ModelAndView getShopapplymoneylistPage(HttpServletResponse response, HttpServletRequest request, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<>();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();
		// 根据用户的id查询店铺id
		PageData pd = new PageData();
		pd.put("userid", userid);

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
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
		try {
			String shop_id = financial.getshopid(pd);
			pd.put("shop_id", shop_id);
			page.setPd(pd);
			// 查询商户提现列表
			list = financial.getShopapplymoneylistPage(page);
			mv.setViewName("financial/shop_applymoneylist");
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 新增提现申请跳转详情页面
	@RequestMapping(value = "jupAddapplymoney")
	public ModelAndView jupAddapplymoney(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		// 获取用户id
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();
		// 根据用户的id查询店铺id
		PageData pd = new PageData();
		pd.put("userid", userid);
		try {
			String shop_id = financial.getshopid(pd);
			// 根据店铺id查询到店铺的可以提现的总金额
			pd = new PageData();
			pd.put("shop_id", shop_id);
			pd = financial.getShopCanmoneyapply(pd);
			mv.setViewName("financial/shop_applyAddInfo");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 新增提现申请
	@RequestMapping(value = "addapplyMoney")
	@ResponseBody
	public ResponseEntity<?> addapplyMoney(HttpServletRequest request) {
		String money = request.getParameter("money");
		String shop_id = request.getParameter("shop_id");
		PageData pd = new PageData();
		pd.put("money", money);
		pd.put("shop_id", shop_id);
		// 先判断店家提交的金额是否大于可以提现金额
		try {
			pd = financial.getShopCanmoneyapply(pd);
			if (Double.parseDouble(pd.get("money").toString()) < Double.parseDouble(money)) {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
						.setMsg("失败,您的提现金额超过了您的可提现金额！");
			} else {
				pd.put("money", money);
				pd.put("shop_id", shop_id);
				financial.addapplyMoney(pd);
				// 扣除用户的提现的金额
				financial.updateSHopUserMOney(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("提现申请成功，我们会尽快为您审核");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}

	// 统计当前店铺下面的菜品销量情况列表
	@RequestMapping(value = "getShopGoodsList")
	public ModelAndView getShopGoodsList(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();
		List<PageData> list2 = new ArrayList<>();

		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");

		if (beginTime != null && beginTime != "" && endTime != null && endTime != "") {

		} else {
			beginTime = DateUtil.getMonthFirst();
			endTime = DateUtil.getDay();
		}
		// 当前页
		// 获取权限
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();
		// 根据用户的id查询店铺id
		PageData pd = new PageData();
		pd.put("userid", userid);
		try {
			// 获取登录用户的id加入权限限制
			String shop_id = financial.getshopid(pd);
			pd.put("shop_id", shop_id);
			pd.put("beginTime", beginTime);
			pd.put("endTime", endTime);
			// 查询商户提现列表
			// 先查询当前店铺下面的所有菜品
			list = financial.getShopByallGoodslistPage(pd);
			// 查询所有已经完成订单的菜品销量情况按时间查询
			list2 = financial.getOrderByshopallgoodBywithTime(pd);
//查询店铺的餐位费
			pd = financial.getShopBYcanfei(pd);
			if(pd!=null){
				List<PageData> list3=new ArrayList<>();
				int good_id = 0;
				String goods_name = String.valueOf(pd.get("goods_name"));
				String goods_moeny = String.valueOf(pd.get("goods_moeny"));
				String goods_images = "";
				int goods_dis_money = 0;
				String ft_foodtype_name ="";
				pd=new PageData();
				pd.put("good_id", good_id);
				pd.put("goods_name", goods_name);
				pd.put("goods_moeny", goods_moeny);
				pd.put("goods_images",goods_images);
				pd.put("goods_dis_money", goods_dis_money);
				pd.put("ft_foodtype_name", ft_foodtype_name);
				list3.add(pd);
				list.addAll(list3);	
			}
			for (int j = 0; j < list.size(); j++) {
				for (int i = 0; i < list2.size(); i++) {
					if (list2.get(i).get("good_id").toString().equals(list.get(j).get("good_id").toString())) {
						list.get(j).put("count", list2.get(i).get("count").toString());
						break;
					} else {
						list.get(j).put("count", 0);
					}
				}

			}
			mv.setViewName("financial/shopGoodListpage");
			mv.addObject("list", list);
			mv.addObject("beginTime", beginTime);
			mv.addObject("endTime", endTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 商户统计导出excel示例
	@RequestMapping(value = "shopstatisticalExcel")
	public ModelAndView testExcel(HttpServletRequest request, HttpServletResponse response, Page page) {
		List<PageData> list = new ArrayList<>();
		ModelAndView mv = this.getModelAndView();
		Map<String, Object> map = new HashMap<>();
		List<String> titles = new ArrayList<>();
		titles.add("序号");
		titles.add("累计订单笔数");
		titles.add("每日订单总数");
		titles.add("商户余额");
		titles.add("今日收益");
		titles.add("今日已消费订单数量");
		titles.add("今日订单未消费数量");
		titles.add("今日预约订单数量");
		titles.add("今日取消订单数量");
		map.put("titles", titles);
		List<PageData> lis = new ArrayList<>();

		try {
			// 获取登录者的用户id
			// 获取权限
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
			String userid = sessionUser.getUSER_ID();
			// 根据用户的id查询店铺id
			PageData pd = new PageData();
			pd.put("userid", userid);
			String shop_id = financial.getshopid(pd);
			pd = new PageData();
			pd.put("shop_id", shop_id);
			// 查询当前店铺下的统计数据
			list = financial.getShopallMOneyfinancialInfo(pd);
			for (int i = 0; i < list.size(); i++) {
				PageData p = list.get(i);
				pd = new PageData();
				pd.put("var1", (i + 1) + "");
				pd.put("var2", p.get("order_total").toString());
				pd.put("var3", p.get("order_total_day").toString());
				pd.put("var4", p.get("order_money").toString());
				pd.put("var5", p.get("order_money_day").toString());
				pd.put("var6", p.get("order_total_spending").toString());
				pd.put("var7", p.get("order_total_Notspending").toString());
				pd.put("var8", p.get("order_total_appointment").toString());
				pd.put("var9", p.get("order_total_Cancel").toString());
				lis.add(pd);
			}
			map.put("varList", lis);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	// 商户提现统计
	@RequestMapping(value = "shopTXmoneyexcel")
	public ModelAndView shopTXmoneyexcel(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		List<String> titles = new ArrayList<>();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();
		// 根据用户的id查询店铺id
		PageData pd = new PageData();
		pd.put("userid", userid);

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
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
		titles.add("序号");
		titles.add("提现金额");
		titles.add("申请时间");
		titles.add("提现状态");
		titles.add("审核通过时间");
		map.put("titles", titles);
		List<PageData> lis = new ArrayList<>();
		try {
			String shop_id = financial.getshopid(pd);
			pd.put("shop_id", shop_id);
			page.setPd(pd);
			// 查询商户提现列表
			list = financial.getShopapplymoneylistPage(page);
			for (int i = 0; i < list.size(); i++) {
				PageData p = list.get(i);
				pd = new PageData();
				pd.put("var1", (i + 1) + "");
				pd.put("var2", p.get("money").toString());
				pd.put("var3", p.get("getmoney_time").toString());
				String state = p.get("state").toString();
				String statemsg = "";
				if ("0".equals(state)) {
					statemsg = "申请中";
				} else if ("1".equals(state)) {
					statemsg = "成功";
				} else if ("2".equals(state)) {
					statemsg = "失败";
				}
				pd.put("var4", statemsg);
				String agreen_time = String.valueOf(p.get("agreen_time"));
				if (agreen_time != null && agreen_time != "null") {
					pd.put("var5", p.get("agreen_time").toString());
				} else {
					pd.put("var5", "");
				}

				lis.add(pd);
			}
			map.put("varList", lis);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 店铺菜品销售统计excel导出
	@RequestMapping(value = "shop_goodExcel")
	public ModelAndView shop_goodExcel(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list2 = new ArrayList<>();
		List<PageData> list = new ArrayList<>();
		List<PageData> lis = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		List<String> titles = new ArrayList<>();
		// 获取权限
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User sessionUser = (User) session.getAttribute(Const.SESSION_USER);
		String userid = sessionUser.getUSER_ID();
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");

		if (beginTime != null && beginTime != "" && endTime != null && endTime != "") {

		} else {
			beginTime = DateUtil.getMonthFirst();
			endTime = DateUtil.getDay();
		}

		// 设置excel表头
		titles.add("序号");
		titles.add("菜品名称");
		titles.add("菜品类型");
		titles.add("菜品价格");
		titles.add("菜品积分价格");
		titles.add("销售数量");
		map.put("titles", titles);
		// 根据用户的id查询店铺id
		PageData pd = new PageData();
		pd.put("userid", userid);
		try {
			// 获取登录用户的id加入权限限制
			String shop_id = financial.getshopid(pd);
			pd.put("shop_id", shop_id);
			pd.put("beginTime", beginTime);
			pd.put("endTime", endTime);
			// 查询商户提现列表
			// 先查询当前店铺下面的所有菜品
			list = financial.getShopByallGoodslistPage(pd);
			// 查询所有已经完成订单的菜品销量情况按时间查询
			list2 = financial.getOrderByshopallgoodBywithTime(pd);
			//查询店铺的餐位费
			pd = financial.getShopBYcanfei(pd);
			if(pd!=null){
				List<PageData> list3=new ArrayList<>();
				int good_id = 0;
				String goods_name = String.valueOf(pd.get("goods_name"));
				String goods_moeny = String.valueOf(pd.get("goods_moeny"));
				String goods_images = "";
				int goods_dis_money = 0;
				String ft_foodtype_name ="";
				pd=new PageData();
				pd.put("good_id", good_id);
				pd.put("goods_name", goods_name);
				pd.put("goods_moeny", goods_moeny);
				pd.put("goods_images",goods_images);
				pd.put("goods_dis_money", goods_dis_money);
				pd.put("ft_foodtype_name", ft_foodtype_name);
				list3.add(pd);
				list.addAll(list3);	
			}
			for (int j = 0; j < list.size(); j++) {
				for (int i = 0; i < list2.size(); i++) {
					if (list2.get(i).get("good_id").toString().equals(list.get(j).get("good_id").toString())) {
						list.get(j).put("count", list2.get(i).get("count").toString());
						break;
					} else {
						list.get(j).put("count", 0);
					}
				}

			}
			for (int i = 0; i < list.size(); i++) {
				PageData p = list.get(i);
				pd = new PageData();
				pd.put("var1", (i + 1) + "");
				pd.put("var2", p.get("goods_name").toString());
				pd.put("var3", p.get("ft_foodtype_name").toString());
				pd.put("var4", p.get("goods_moeny").toString());
				pd.put("var5", p.get("goods_dis_money").toString());
				String count = String.valueOf(p.get("count"));
				String counts = "";
				if (count != "null" && count != "") {
					counts = count;
				} else {
					counts = String.valueOf(0);
				}
				pd.put("var6", counts);

				lis.add(pd);
			}
			map.put("varList", lis);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	public static void main(String[] args) {
		
	}
	

}
