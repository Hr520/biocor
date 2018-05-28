package com.biocor.controller.admin.good;

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
import com.biocor.service.admin.good.GoodTypeService;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="/goodType")
public class GoodTypeController extends BaseController{

	Logger logger = Logger.getLogger(GoodTypeController.class);
	
	@Resource(name = "goodTypeService")
	private GoodTypeService goodTypeService;
	
	/**
	 * 商品类型列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodTypeList")
	public ModelAndView goodTypeList(HttpServletRequest request,HttpServletResponse response,Page page) 
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
		list = goodTypeService.findGoodTypelistPage(page);
		
		mv.setViewName("goodType/goodType_list");
		mv.addObject("list", list);
		return mv;
	}
	
	
	/**
	 * 新增商品类型
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodTypeAdd")
	public ModelAndView goodTypeAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		
	    PageData pd = new PageData();
	    pd.put("ft_foodtype_name", name);
	    pd.put("ft_foodtype_createdate", DateUtil.getTime());
	    pd.put("ft_foodtype_remark", remark);
		goodTypeService.addGoodType(pd);
		return goodTypeList(request,response,page);
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
		mv.setViewName("goodType/goodType_add");
		return mv;
	}
	
	/**
	 * 删除商品类型
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodTypeDel")
	public ModelAndView goodTypeDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String stid = request.getParameter("id");
	    PageData pd = new PageData();
	    pd.put("ftid", stid);
		goodTypeService.delGoodType(pd);
		return goodTypeList(request,response,page);
	}
}
