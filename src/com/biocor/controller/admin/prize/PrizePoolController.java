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
public class PrizePoolController extends BaseController{

	Logger logger = Logger.getLogger(PrizePoolController.class);
	
	@Resource(name = "prizeService")
	private PrizeService prizeService;
	
	@RequestMapping(value="/prizePoolList")
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
		list = prizeService.findPrizePoollistPage(page);
				
		mv.setViewName("prize/prizepool_list");
		mv.addObject("list", list);
		mv.addObject("num", page.getTotalResult());
		return mv;
	}
	
	
	
	@RequestMapping(value="/befAddPool")
	public ModelAndView befAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("prize/prizepool_add");
		return mv;
	}
	

	@RequestMapping(value="/prizePoolAdd")
	public ModelAndView prizeAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		
		String min_money = request.getParameter("min_money");
		String distributable_min = request.getParameter("distributable_min");
		String num = request.getParameter("num");
		String rate = request.getParameter("rate");
		String remark = request.getParameter("remark");
		
		PageData pd = new PageData();
		pd.put("bp_money", "0");
		pd.put("bp_min_money", min_money);
		pd.put("bp_distributable", "0");
		pd.put("bp_distributable_min", distributable_min);
		pd.put("bp_allocated", "0");
		pd.put("bp_distributable_men", num);
		pd.put("bp_increasing_rate", rate);
		pd.put("bp_createdate", DateUtil.getTime());
		pd.put("bp_remark", remark);
		prizeService.addPrizePool(pd);
		
		return prizeList(request,response,page);
	}
	
	@RequestMapping(value="/prizePoolEdit")
	public ModelAndView prizeEdit(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		String bpid = request.getParameter("bpid");
		PageData pd = new PageData();
		pd.put("bpid", bpid);
		pd = prizeService.findPrizePoolByID(pd);
		mv.setViewName("prize/prizepool_edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="/prizePoolUpdate")
	public ModelAndView prizeUpdate(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		
		String bpid = request.getParameter("bpid");
		String min_money = request.getParameter("min_money");
		String distributable_min = request.getParameter("distributable_min");
		String num = request.getParameter("num");
		String rate = request.getParameter("rate");
		String remark = request.getParameter("remark");
		
		PageData pd = new PageData();
		pd.put("bpid", bpid);
		pd.put("bp_min_money", min_money);
		pd.put("bp_distributable_min", distributable_min);
		pd.put("bp_distributable_men", num);
		pd.put("bp_increasing_rate", rate);
		pd.put("bp_remark", remark);
		prizeService.updatePrizePool(pd);
		
		return prizeList(request,response,page);
	}
}
