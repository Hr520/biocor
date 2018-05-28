package com.biocor.controller.admin.financial;

import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.financial.FinancialPlatformService;
import com.biocor.util.DateUtil;
import com.biocor.util.ObjectExcelView;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;


/**
 * 平台财务管理
 * @author admin
 *
 */
@Controller
@RequestMapping(value = "financial")
public class FinancialPlatformController extends BaseController{

	@Resource(name = "platformService")
	private FinancialPlatformService platformService;
	
	
	/**
	 * 平台账务统计
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "findPlatFromFinancial")
	public ModelAndView findPlatFromFinancial(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			//统计平台账务
			pd = platformService.findPlatformFinancial(pd);
			
			//系统财务统计
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			dataset.addValue( Double.parseDouble( pd.get("total_order_money").toString() ), "biocor", "总订单金额");
			dataset.addValue( Double.parseDouble( pd.get("total_user_money").toString() ), "biocor", "用户总金额");
			dataset.addValue( Double.parseDouble( pd.get("total_order_shop").toString() ), "biocor", "商户总金额");
			dataset.addValue( Double.parseDouble( pd.get("total_platform").toString() ), "biocor", "平台总金额");
			String title1 = "系统财务统计";
			Map<String,String> map = createJfree(request, dataset, title1);
			mv.addObject("filename1", map.get("filename"));
			mv.addObject("graphURL1", map.get("graphURL"));
			
			//用户财务统计
			dataset = new DefaultCategoryDataset();
			dataset.addValue( Double.parseDouble( pd.get("total_user_money").toString() ), "biocor", "用户总金额");
			dataset.addValue( Double.parseDouble( pd.get("user_yue").toString() ), "biocor", "用户余额");
			dataset.addValue( Double.parseDouble( pd.get("user_withdraw").toString() ), "biocor", "用户提现金额");
			String title2 = "用户财务统计";
			map = createJfree(request, dataset, title2);
			mv.addObject("filename2", map.get("filename"));
			mv.addObject("graphURL2", map.get("graphURL"));
			
			//商户财务统计
			dataset = new DefaultCategoryDataset();
			dataset.addValue( Double.parseDouble( pd.get("total_order_shop").toString() ), "biocor", "商户总金额");
			dataset.addValue( Double.parseDouble( pd.get("shop_withdraw").toString() ), "biocor", "商户提现金额");
			dataset.addValue( Double.parseDouble( pd.get("shop_money").toString() ), "biocor", "商户余额");
			dataset.addValue( Double.parseDouble( pd.get("shop_un_commit").toString() ), "biocor", "未结算金额");
			String title3 = "商户财务统计";
			map = createJfree(request, dataset, title3);
			mv.addObject("filename3", map.get("filename"));
			mv.addObject("graphURL3", map.get("graphURL"));
			
			//平台财务
			dataset = new DefaultCategoryDataset();
			dataset.addValue( Double.parseDouble( pd.get("total_platform").toString() ), "biocor", "总金额");
			dataset.addValue( Double.parseDouble( pd.get("cancel_fee").toString() ), "biocor", "取消订单手续费");
			dataset.addValue( Double.parseDouble( pd.get("withdraw_fee").toString() ), "biocor", "提现手续费");
			dataset.addValue( Double.parseDouble( pd.get("pool_money").toString() ), "biocor", "盈利(8%)");
			dataset.addValue( Double.parseDouble( pd.get("pool_profit").toString() ), "biocor", "奖金池(12%)");
			dataset.addValue( Double.parseDouble( pd.get("redundancy_order").toString() ), "biocor", "未完成订单");
			String title4 = "平台财务统计";
			map = createJfree(request, dataset, title4);
			mv.addObject("filename4", map.get("filename"));
			mv.addObject("graphURL4", map.get("graphURL"));
			
			//平台使用信息
			dataset = new DefaultCategoryDataset();
			dataset.addValue( Double.parseDouble( pd.get("appusercount").toString() ), "biocor", "平台用户总计");
			dataset.addValue( Double.parseDouble( pd.get("shopcount").toString() ), "biocor", "平台店铺总计");
			dataset.addValue( Double.parseDouble( pd.get("goodscount").toString() ), "biocor", "商品总计");
			String title5 = "平台信息";
			map = createJfree(request, dataset, title5);
			mv.addObject("filename5", map.get("filename"));
			mv.addObject("graphURL5", map.get("graphURL"));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			mv.setViewName("financial/platform_financial");
			mv.addObject("pd", pd);
		}
		return mv;

	}
	
	//TODO 
	/**
	 * 平台账务统计 导出
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "platFromdown")
	public ModelAndView platFromdown(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		try {
			
			pd = platformService.findPlatformFinancial(pd);
			
			//设置excel头
			titles.add("系统财务统计"); 	
			titles.add("总订单金额");
			titles.add("用户总金额");  
			titles.add("商户总金额");	
			titles.add("平台总金额");
			titles.add("");
			titles.add("");
			dataMap.put("titles", titles);
			List<PageData> userList = new ArrayList<>();
			//系统财务统计
			PageData p = new PageData();
			p.put("var1", "");
			p.put("var2", pd.get("total_order_money").toString());
			p.put("var3", pd.get("total_user_money").toString());
			p.put("var4", pd.get("total_order_shop").toString());
			p.put("var5", pd.get("total_platform").toString());
			userList.add(p);

			//用户财务统计
			p = new PageData();
			p.put("var1", "用户财务统计");
			p.put("var2", "用户总金额");
			p.put("var3", "用户余额");
			p.put("var4", "用户提现金额");
			p.put("var5", "");
			userList.add(p);
			p = new PageData();
			p.put("var1", "");
			p.put("var2", pd.get("total_user_money").toString());
			p.put("var3", pd.get("user_yue").toString());
			p.put("var4", pd.get("user_withdraw").toString());
			p.put("var5", "");
			userList.add(p);
			
			//商户财务统计
			p = new PageData();
			p.put("var1", "商户财务统计");
			p.put("var2", "商户总金额");
			p.put("var3", "商户提现金额");
			p.put("var4", "商户余额");
			p.put("var5", "未结算金额");
			userList.add(p);
			p = new PageData();
			p.put("var1", "");
			p.put("var2", pd.get("total_order_shop").toString());
			p.put("var3", pd.get("shop_withdraw").toString());
			p.put("var4", pd.get("shop_money").toString());
			p.put("var5", pd.get("shop_un_commit").toString());
			userList.add(p);
			
			//平台财务
			p = new PageData();
			p.put("var1", "平台财务统计");
			p.put("var2", "总金额");
			p.put("var3", "取消订单手续费");
			p.put("var4", "提现手续费");
			p.put("var5", "盈利(8%)");
			p.put("var6", "奖金池(12%)");
			p.put("var7", "未完成订单");
			userList.add(p);
			p = new PageData();
			p.put("var1", "");
			p.put("var2", pd.get("total_platform").toString());
			p.put("var3", pd.get("cancel_fee").toString());
			p.put("var4", pd.get("withdraw_fee").toString());
			p.put("var5", pd.get("pool_money").toString());
			p.put("var6", pd.get("pool_profit").toString());
			p.put("var7", pd.get("redundancy_order").toString());
			userList.add(p);
			
			//平台信息
			p = new PageData();
			p.put("var1", "平台信息");
			p.put("var2", "平台用户总计");
			p.put("var3", "平台店铺总计");
			p.put("var4", "商品总计");
			userList.add(p);
			p = new PageData();
			p.put("var1", "");
			p.put("var2", pd.get("appusercount").toString());
			p.put("var3", pd.get("shopcount").toString());
			p.put("var4", pd.get("goodscount").toString());
			userList.add(p);
			
			dataMap.put("varList", userList);
			ObjectExcelView erv = new ObjectExcelView();//执行excel操作
			mv = new ModelAndView(erv,dataMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/************************************************************************/
	
	/**
	 * 平台订单统计
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "findPlatFromOrder")
	public ModelAndView findPlatFromOrder(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			
			String shopid = request.getParameter("shopid");//店铺ID
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String curpage = request.getParameter("currentPage");
			String showCount = request.getParameter("showCount");
			
			//当前页
			if( StringUtil.isNull(curpage) ){
				curpage = "1";
			}
			//每页条数
			if( StringUtil.isNull(showCount) ){
				showCount = "10";
			}
			
			if( StringUtil.isNull(start) || StringUtil.isNull(end)){
				String time = DateUtil.getDay();
				start = DateUtil.getMonthFirst() + " 00:00:00";
				end = time + " 23:59:59";
			}
			if( !StringUtil.isNull(start) && !StringUtil.isNull(end)){
				start = start +" 00:00:00";
				end = end + " 23:59:59";
			}
			
			//查询店铺列表
			pd = new PageData();
			List<PageData> shoplist = platformService.findAllShopList(pd);
			
			//统计平台(店铺)的订单信息
			pd = new PageData();
			pd.put("shopid", shopid);
			pd.put("start", start);
			pd.put("end", end);
			PageData res = platformService.findPlatformOrderInfo(pd);
			
			//统计平台(店铺)的商品信息
			pd = new PageData();
			pd.put("shopid", shopid);
			pd.put("start", start);
			pd.put("end", end);

			page.setCurrentPage(Integer.parseInt(curpage));
			page.setShowCount(Integer.parseInt(showCount));
			page.setPd(pd);
			List<PageData> goodlist = platformService.findAllGoodlistPage(page);
			
			mv.setViewName("financial/platform_order");
			
			mv.addObject("shoplist", shoplist);
			mv.addObject("goodlist", goodlist);
			mv.addObject("pd", res);
			
			mv.addObject("shopid", shopid);
			mv.addObject("start", start.substring(0, 10));
			mv.addObject("end", end.substring(0, 10));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	
	//TODO
	/**
	 * 平台订单统计导出
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "orderdown")
	public ModelAndView orderdown(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		try {
			
			String shopid = request.getParameter("shopid");//店铺ID
			String start = request.getParameter("start");
			String end = request.getParameter("end");

			if( StringUtil.isNull(start) || StringUtil.isNull(end)){
				String time = DateUtil.getDay();
				start = DateUtil.getMonthFirst() + " 00:00:00";
				end = time + " 23:59:59";
			}
			if( !StringUtil.isNull(start) && !StringUtil.isNull(end)){
				start = start +" 00:00:00";
				end = end + " 23:59:59";
			}
			
			//统计平台(店铺)的订单信息
			pd = new PageData();
			pd.put("shopid", shopid);
			pd.put("start", start);
			pd.put("end", end);
			PageData res = platformService.findPlatformOrderInfo(pd);
			
			//统计平台(店铺)的商品信息
			pd = new PageData();
			pd.put("shopid", shopid);
			pd.put("start", start);
			pd.put("end", end);

			page.setCurrentPage(1);
			page.setShowCount(1000);
			page.setPd(pd);
			List<PageData> goodlist = platformService.findAllGoodlistPage(page);
			
			
			//设置excel头
			String str = "店铺";
			String name = goodlist.get(0).get("shop_name").toString();
			if( StringUtil.isNull(shopid)){
				str = "平台";
				name = "";
			}
			titles.add(str); 	
			titles.add("总订单");
			titles.add("付款总订单");  
			titles.add("付款总金额");	
			titles.add("已消费订单");
			titles.add("未消费订单");
			titles.add("退款中订单");
			titles.add("退款订单");
			dataMap.put("titles", titles);
			List<PageData> userList = new ArrayList<>();
			//系统财务统计
			PageData p = new PageData();
			p.put("var1", name);
			p.put("var2", res.get("all_order").toString());
			p.put("var3", res.get("pay_order").toString());
			p.put("var4", res.get("pay_money").toString());
			p.put("var5", res.get("commit_order").toString());
			p.put("var6", res.get("un_commit_order").toString());
			p.put("var7", res.get("return_ing_order").toString());
			p.put("var8", res.get("return_order").toString());
			userList.add(p);
			
			p = new PageData();
			p.put("var1", "店铺");
			p.put("var2", "商品名称");
			p.put("var3", "单价");
			p.put("var4", "积分价");
			p.put("var5", "销售数量");
			userList.add(p);
			for( int i=0;i< goodlist.size() ;i++){
				p = new PageData();
				pd = goodlist.get(i);
				p.put("var1", pd.get("shop_name").toString());
				p.put("var2", pd.get("goods_name").toString());
				p.put("var3", pd.get("goods_moeny").toString());
				p.put("var4", pd.get("goods_dis_money").toString());
				p.put("var5", pd.get("num").toString());
				userList.add(p);
			}
			
			dataMap.put("varList", userList);
			ObjectExcelView erv = new ObjectExcelView();//执行excel操作
			mv = new ModelAndView(erv,dataMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**************************************************************************/
	
	/**
	 * 平台奖励统计
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "findPlatFromPrize")
	public ModelAndView findPlatFromPrize(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String curpage = request.getParameter("currentPage");
			String showCount = request.getParameter("showCount");
			
			//当前页
			if( StringUtil.isNull(curpage) ){
				curpage = "1";
			}
			//每页条数
			if( StringUtil.isNull(showCount) ){
				showCount = "10";
			}
			if( StringUtil.isNull(start) || StringUtil.isNull(end)){
				start = DateUtil.getMonthFirst();
				end = DateUtil.getDay();
			}
		
			//统计平台的奖金发放
			pd = new PageData();
			pd.put("start", start);
			pd.put("end", end);
			page.setCurrentPage(Integer.parseInt(curpage));
			page.setShowCount(Integer.parseInt(showCount));
			page.setPd(pd);
			List<PageData> list = platformService.findPlatformPrizelistPage(page);

			mv.setViewName("financial/platform_prize");
			mv.addObject("list", list);
			mv.addObject("start", start);
			mv.addObject("end", end);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	//TODO
	/**
	 * 平台奖励统计导出
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "prizedown")
	public ModelAndView down(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		try {
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			if( StringUtil.isNull(start) || StringUtil.isNull(end)){
				start = DateUtil.getMonthFirst();
				end = DateUtil.getDay();
			}
		
			//统计平台的奖金发放
			pd = new PageData();
			pd.put("start", start);
			pd.put("end", end);
			page.setCurrentPage(1);
			page.setShowCount(1000);
			page.setPd(pd);
			List<PageData> list = platformService.findPlatformPrizelistPage(page);

			//标题
			titles.add("日期");
			titles.add("排队总人数");  
			titles.add("发放率");	
			titles.add("发放额度");
			titles.add("发放人数");
			dataMap.put("titles", titles);
			List<PageData> userList = new ArrayList<>();
			//系统财务统计
			PageData p = null;
			for( int i=0;i< list.size();i++){
				pd = list.get(i);
				p = new PageData();
				p.put("var1", pd.get("prize_time").toString());
				p.put("var2", pd.get("prize_allnum").toString());
				p.put("var3", pd.get("prize_lv").toString());
				p.put("var4", pd.get("prize_jd").toString());
				p.put("var5", pd.get("prize_num").toString());
				userList.add(p);
			}
			
			dataMap.put("varList", userList);
			ObjectExcelView erv = new ObjectExcelView();//执行excel操作
			mv = new ModelAndView(erv,dataMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/*****************************************************************************/
	
	public static Map<String,String> createJfree(HttpServletRequest request,
			DefaultCategoryDataset dataset,String title){
		Map<String,String> map = new HashMap<String,String>();
		try{
			//创建主题样式  
		    StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
		    //设置标题字体  
		    standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));  
		    //设置图例的字体  
		    standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,15));  
		    //设置轴向的字体  
		    standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,15));  
		    //应用主题样式  
		    ChartFactory.setChartTheme(standardChartTheme);
			
			JFreeChart chart = ChartFactory.createBarChart3D(title, 
			                  "",
			                  "",
			                  dataset,
			                  PlotOrientation.VERTICAL,
			                  false,
			                  false,
			                  false);
			
			CategoryPlot plot = chart.getCategoryPlot();
			//设置网格背景颜色
			plot.setBackgroundPaint(Color.white);
			//设置网格竖线颜色
			plot.setDomainGridlinePaint(Color.pink);
			//设置网格横线颜色
			plot.setRangeGridlinePaint(Color.pink);
			//显示每个柱的数值，并修改该数值的字体属性

			BarRenderer3D renderer = new BarRenderer3D();
			renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
			renderer.setBaseItemLabelsVisible(true);
			//默认的数字显示在柱子中，通过如下两句可调整数字的显示
			//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
			renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
			renderer.setItemLabelAnchorOffset(10D);
			//设置每个地区所包含的平行柱的之间距离
			//renderer.setItemMargin(0.3);
			plot.setRenderer(renderer);
			//设置地区、销量的显示位置
			//将下方的“肉类”放到上方
			plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);
			//将默认放在左边的“销量”放到右方
			//plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
			
			
			String filename = ServletUtilities.saveChartAsPNG(chart, 800, 300, null, null);
			String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
			
			map.put("filename", filename);
			map.put("graphURL", graphURL);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
	}
}
