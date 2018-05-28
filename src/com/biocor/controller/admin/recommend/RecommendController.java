package com.biocor.controller.admin.recommend;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.good.GoodService;
import com.biocor.service.admin.recommend.RecommendService;
import com.biocor.service.admin.shop.ShopService;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="/recommend")
public class RecommendController extends BaseController{

	Logger logger = Logger.getLogger(RecommendController.class);
	
	@Resource(name = "recommendService")
	private RecommendService recommendService;
	
	@Resource(name = "shopService")
	private ShopService shopService;
	
	@Resource(name = "goodService")
	private GoodService goodService;
	
	
	
	/**
	 * 推荐列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/recommendList")
	public ModelAndView recommendList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String type = request.getParameter("type");
		String state = request.getParameter("state");
		//当前页
		if( StringUtil.isNull(curpage) ){
			curpage = "1";
		}
		//每页条数
		if( StringUtil.isNull(showCount) ){
			showCount = "10";
		}	
		
		//默认不推荐
		if( StringUtil.isNull(state)){
			state = "-1";
		}
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		PageData pd = new PageData();
		
		pd.put("type", type);
		pd.put("state", state);
		page.setPd(pd);
		list = recommendService.findRecommendlistPage(page);
		
		//类型
		List<PageData> types = new ArrayList<>();
		if("1".equals(type)){
			types = shopService.findAllShopType(new PageData());
		}else if("2".equals(type)){
			types = goodService.findAllGoodType(new PageData());
		}
		//推荐总数
		pd = new PageData();
		pd.put("type", type);
		pd = recommendService.findRecommendCount(pd);
		int num = Integer.parseInt(pd.get("num").toString());
		
		
		if("1".equals(type)){
			mv.setViewName("recommend/shopR_list");
		}else if("2".equals(type)){
			mv.setViewName("recommend/goodR_list");
		}
		mv.addObject("list", list);
		mv.addObject("types", types);
		mv.addObject("type", type);
		mv.addObject("state", state);
		mv.addObject("num", num);
		return mv;
	}
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/recommendState")
	public ModelAndView recommend(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String state = request.getParameter("state");
		
	    PageData pd = new PageData();
	    pd.put("id", id);
	    pd.put("type", type);
		pd.put("state", state);
		recommendService.updateRecommend(pd);
		return recommendList(request,response,page);
	}
}
