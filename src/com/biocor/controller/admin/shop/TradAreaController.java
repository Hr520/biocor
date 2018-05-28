package com.biocor.controller.admin.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.shop.TradAreaService;
import com.biocor.util.AppUtil;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;




@Controller
@RequestMapping(value="/tradArea")
public class TradAreaController extends BaseController{

	Logger logger = Logger.getLogger(TradAreaController.class);
	
	@Resource(name = "tradAreaService")
	private TradAreaService tradAreaService;
	
	/**
	 * 商圈列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tradAreaList")
	public ModelAndView tradAreaList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String tradAreaName = request.getParameter("tradAreaName");
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
		pd.put("tradAreaName", tradAreaName);
		page.setPd(pd);
		list = tradAreaService.findTradArealistPage(page);
		
		mv.setViewName("tradArea/tradArea_list");
		mv.addObject("list", list);
		mv.addObject("tradAreaName", tradAreaName);
		return mv;
	}
	
	/**
	 * 删除商圈
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tradAreaDel")
	public ModelAndView tradAreaDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String id = request.getParameter("id");
		PageData pd = new PageData();
		pd.put("id", id);
		tradAreaService.delTradArea(pd);
		return tradAreaList(request,response,page);
	}
	
	/**
	 * 新增商圈
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tradAreaAdd")
	public ModelAndView tradAreaAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String street = request.getParameter("street");
		String streetID = request.getParameter("streetID");
		String father = request.getParameter("father");
		String remark = request.getParameter("remark");
		PageData pd = new PageData();
		pd.put("street", street);
		pd.put("streetID", streetID);
		pd.put("father", father);
		pd.put("hats_createdate", DateUtil.getTime());
		pd.put("hats_remark", remark);
		tradAreaService.addTradArea(pd);
		
		return tradAreaList(request,response,page);
	}
	
	/**
	 * 添加商圈前
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
		List<PageData> list = new ArrayList<PageData>();
		PageData pd = new PageData();
		list = tradAreaService.findAllProvince(pd);
		
		mv.setViewName("tradArea/tradArea_add");
		mv.addObject("list", list);
		return mv;
	}
	
	
	/**
	 * Ajax 查询省市区
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/findTradArea")
	@ResponseBody
	public Object findTestResult(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<PageData> list = new ArrayList<PageData>();
		String type = request.getParameter("type");
		String father = request.getParameter("father");
		PageData pd = new PageData();
		pd.put("father", father);
		if ("1".equals(type)) {
			list = tradAreaService.findAllCity(pd);
		} else if("2".equals(type)) {
			list = tradAreaService.findAllArea(pd);			
		} else if("3".equals(type)){
			list = tradAreaService.findAllStreet(pd);
		}
		map.put("state", "success");
		map.put("list", list);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
}
