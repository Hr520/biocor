package com.biocor.controller.admin.find;

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
import com.biocor.service.admin.find.FindQuestService;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="/finds")
public class FindQuestController extends BaseController{

	Logger logger = Logger.getLogger(FindQuestController.class);
	
	@Resource(name = "findQuestService")
	private FindQuestService findQuestService;
	
	
	@RequestMapping(value="/questList")
	public ModelAndView questList(HttpServletRequest request,HttpServletResponse response,Page page) 
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
		list = findQuestService.getQuestlistPage(page);
		
		mv.setViewName("find/quest_list");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/befAdd")
	public ModelAndView befAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("find/quest_add");
		return mv;
	}
	
	@RequestMapping(value="/questAdd")
	public ModelAndView questAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String q_qname = request.getParameter("q_qname");
		String q_qNO = request.getParameter("q_qNO");
		String q_type = request.getParameter("q_type");
		String q_answer = request.getParameter("q_answer");
		String q_remark = request.getParameter("q_remark");
	    PageData pd = new PageData();
	    pd.put("q_qname", q_qname);
	    pd.put("q_qNO", q_qNO);
	    pd.put("q_type", q_type);
	    pd.put("q_answer", q_answer);
	    pd.put("q_createdate", DateUtil.getTime());
	    pd.put("q_remark", q_remark);
	    findQuestService.addQuest(pd);
		return questList(request,response,page);
	}
	
	
	@RequestMapping(value="/questDel")
	public ModelAndView questDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String qid = request.getParameter("qid");
	    PageData pd = new PageData();
	    pd.put("qid", qid);
	    findQuestService.deleteQuest(pd);
	    findQuestService.deleteQuestAllAnswer(pd);
		return questList(request,response,page);
	}
	
	
	
	/********************************答案******************************/
	
	
	
	@RequestMapping(value="/questAnswerList")
	public ModelAndView questAnswerList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		String qid = request.getParameter("qid");
		//当前页
		if( StringUtil.isNull(curpage) ){
			curpage = "1";
		}
		//每页条数
		if( StringUtil.isNull(showCount) ){
			showCount = "10";
		}
		
		PageData pd = new PageData();
		pd.put("qid", qid);
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = findQuestService.getQuestAnswerlistPage(page);
		
		mv.setViewName("find/questAnswer_list");
		mv.addObject("list", list);
		mv.addObject("qid", qid);
		return mv;
	}
	
	@RequestMapping(value="/befAddAnswer")
	public ModelAndView befAddAnswer(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		String qid = request.getParameter("qid");
		mv.addObject("qid", qid);
		mv.setViewName("find/questAnswer_add");
		return mv;
	}
	
	@RequestMapping(value="/questAnswerAdd")
	public ModelAndView questAnswerAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		String qa_qid = request.getParameter("qa_qid");
		String qa_no = request.getParameter("qa_no");
		String qa_content = request.getParameter("qa_content");
		String qa_remark = request.getParameter("qa_remark");
	    PageData pd = new PageData();
	    pd.put("qa_qid", qa_qid);
	    pd.put("qa_no", qa_no);
	    pd.put("qa_content", qa_content);
	    pd.put("qa_remark", qa_remark);
	    pd.put("qa_createdate", DateUtil.getTime());

	    findQuestService.addQuestAnswer(pd);
	    mv.setViewName("save_result");
		mv.addObject("resultURL", "finds/questAnswerList.do?qid="+qa_qid);
		return mv;
	}
	
	
	@RequestMapping(value="/questAnswerDel")
	public ModelAndView questAnswerDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		String qaid = request.getParameter("qaid");
		String qid = request.getParameter("qid");
	    PageData pd = new PageData();
	    pd.put("qaid", qaid);
	    findQuestService.deleteQuestAnswer(pd);
	    mv.setViewName("save_result");
		mv.addObject("resultURL", "finds/questAnswerList.do?qid="+qid);
		return mv;
	}
}
