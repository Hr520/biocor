package com.biocor.controller.admin.apply;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.User;
import com.biocor.service.admin.apply.ApplyService;
import com.biocor.util.Const;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;


@Controller
@RequestMapping(value="/apply")
public class ApplyController extends BaseController{

	Logger logger = Logger.getLogger(ApplyController.class);
	
	@Resource(name = "applyService")
	private ApplyService applyService;
	
	/**
	 * 申请列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/applyList")
	public ModelAndView applyList(HttpServletRequest request,HttpServletResponse response,Page page) 
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
		list = applyService.findApplylistPage(page);

		mv.setViewName("apply/apply_list");
		mv.addObject("list", list);
		return mv;
	}
	
	/**
	 * 改变前
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/befChange")
	public ModelAndView befChange(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		String id = request.getParameter("id");
		mv.setViewName("apply/apply_edit");
		mv.addObject("id", id);
		return mv;
	}
	
	/**
	 * 更改状态
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/applyUpdate")
	public ModelAndView applyUpdate(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		
		String id = request.getParameter("id");
		String state = request.getParameter("state");
		String remark = request.getParameter("remark");
		
		PageData pd = new PageData();
		pd.put("urrid", id);
		pd.put("state", state);
		pd.put("remark", remark);
        applyService.updateApplyState(pd);
		
		return applyList(request,response,page);
	}
}
