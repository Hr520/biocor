package com.biocor.controller.admin.prize;

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
import com.biocor.service.admin.prize.PrizeService;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="/prize")
public class PrizeController extends BaseController{

	Logger logger = Logger.getLogger(PrizeController.class);
	
	@Resource(name = "prizeService")
	private PrizeService prizeService;
	
	@RequestMapping(value="/prizeList")
	public ModelAndView prizeList(HttpServletRequest request,HttpServletResponse response,Page page) 
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
		PageData pd = new PageData();
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = prizeService.findPrizelistPage(page);
				
		mv.setViewName("prize/prize_list");
		mv.addObject("list", list);
		mv.addObject("num", page.getTotalResult());
		return mv;
	}
	
	
	
	@RequestMapping(value="/befAdd")
	public ModelAndView befAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("prize/prize_add");
		return mv;
	}
	

	@RequestMapping(value="/prizeAdd")
	public ModelAndView prizeAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		
		String name = request.getParameter("name");
		String probability = request.getParameter("probability");
		String num = request.getParameter("num");
		String remark = request.getParameter("remark");
		String level = request.getParameter("level");
		
		PageData pd = new PageData();
		pd.put("prizeg_gift_name", name);
		pd.put("prizeg_gift_probability", probability);
		pd.put("prizeg_gift_num", num);
		pd.put("prizeg_createdate", DateUtil.getTime());
		pd.put("prizeg_remark", remark);
		pd.put("level", level);
		prizeService.addPrize(pd);
		
		return prizeList(request,response,page);
	}
	
	@RequestMapping(value="/prizeEdit")
	public ModelAndView prizeEdit(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		String pgid = request.getParameter("pgid");
		PageData pd = new PageData();
		pd.put("pgid", pgid);
		pd = prizeService.findPrizeByID(pd);
		mv.setViewName("prize/prize_edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="/prizeUpdate")
	public ModelAndView prizeUpdate(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		
		String pgid = request.getParameter("pgid");
		String name = request.getParameter("name");
		String probability = request.getParameter("probability");
		String num = request.getParameter("num");
		String remark = request.getParameter("remark");
		String level = request.getParameter("level");
		
		PageData pd = new PageData();
		pd.put("pgid", pgid);
		pd.put("prizeg_gift_name", name);
		pd.put("prizeg_gift_probability", probability);
		pd.put("prizeg_gift_num", num);
		pd.put("prizeg_createdate", DateUtil.getTime());
		pd.put("prizeg_remark", remark);
		pd.put("level", level);
		prizeService.updatePrize(pd);
		
		return prizeList(request,response,page);
	}
}
