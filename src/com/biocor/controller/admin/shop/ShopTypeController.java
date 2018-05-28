package com.biocor.controller.admin.shop;

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
import com.biocor.service.admin.shop.ShopTypeService;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="/shopType")
public class ShopTypeController extends BaseController{

	Logger logger = Logger.getLogger(ShopTypeController.class);
	
	@Resource(name = "shopTypeService")
	private ShopTypeService shopTypeService;
	
	@RequestMapping(value="/shopTypeList")
	public ModelAndView shopTypeList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

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
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		PageData pd = new PageData();
		page.setPd(pd);
		list = shopTypeService.findShopTypelistPage(page);
		
		mv.setViewName("shopType/shopType_list");
		mv.addObject("list", list);
		return mv;
	}
	
	
	/**
	 * 新增店铺类型
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/shopTypeAdd")
	public ModelAndView shopTypeAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String st_name = request.getParameter("name");
		String st_img = request.getParameter("img");
		String st_remark = request.getParameter("remark");
		String type = request.getParameter("type");
		
	    PageData pd = new PageData();
	    pd.put("st_name", st_name);
	    pd.put("st_img", st_img);
	    pd.put("st_name", st_name);
	    pd.put("st_createdate", DateUtil.getTime());
	    pd.put("st_remark", st_remark);
	    pd.put("type", type);
	    
		shopTypeService.addShopType(pd);
		return shopTypeList(request,response,page);
	}
	
	/**
	 * 添加前
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/befAdd")
	public ModelAndView befAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("shopType/shopType_add");
		return mv;
	}
	
	/**
	 * 删除店铺类型
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/shopTypeDel")
	public ModelAndView shopTypeDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String stid = request.getParameter("id");
	    PageData pd = new PageData();
	    pd.put("stid", stid);
		shopTypeService.delShopType(pd);
		return shopTypeList(request,response,page);
	}
}
