package com.biocor.controller.admin.find;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.find.FindsService;
import com.biocor.util.PageData;

@Controller
@RequestMapping(value="/finds")
public class FindsController extends BaseController{

	Logger logger = Logger.getLogger(FindsController.class);
	
	@Resource(name = "findsService")
	private FindsService findsService;
	
	//查询美食资讯列表
	@RequestMapping(value="getFoodInformationlistPage")
	public ModelAndView getFoodInformationlistPage(Page page){
		ModelAndView mv = new ModelAndView("find/findInformation_list");
		List<PageData> list = new ArrayList<>();
		PageData pd = this.getPageData();
		page.setPd(pd);
		try {
			list = findsService.getFoodInformationlistPage(page);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		return mv;
	}
	
	//进入新增或修改页面
	@RequestMapping(value="goAddOrEditView")
	public ModelAndView goAddOrEditView(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			String msg = pd.getString("msg");
			if ("add".equals(msg)) {
				mv.addObject("title", "新增资讯");
				mv.addObject("action_url", "addFoodInformation");
			}else if ("edit".equals(msg)) {
				pd = findsService.getInformationById(pd);
				mv.addObject("pd", pd);
				mv.addObject("title", "修改资讯");
				mv.addObject("action_url", "editFoodInformation");
			}
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("find/findInformation_edit");
		return mv;
	}
	//新增美食资讯
	@RequestMapping(value="addFoodInformation")
	@ResponseBody
	public Map<String, Object> addFoodInformation(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String discoveryf_type = request.getParameter("discoveryf_type");
			String discoveryf_image = request.getParameter("discoveryf_image");
			String discoveryf_title = request.getParameter("discoveryf_title");
			String discoveryf_content = request.getParameter("discoveryf_content");
			pd.put("discoveryf_type", discoveryf_type);
			pd.put("discoveryf_image", discoveryf_image);
			pd.put("discoveryf_title", discoveryf_title);
			pd.put("discoveryf_content", discoveryf_content);
			findsService.addFoodInformation(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	//修改美食资讯
	@RequestMapping(value="editFoodInformation")
	@ResponseBody
	public Map<String, Object> editFoodInformation(HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String dfid = request.getParameter("dfid");
			String discoveryf_type = request.getParameter("discoveryf_type");
			String discoveryf_image = request.getParameter("discoveryf_image");
			String discoveryf_title = request.getParameter("discoveryf_title");
			String discoveryf_content = request.getParameter("discoveryf_content");
			pd.put("dfid", dfid);
			pd.put("discoveryf_type", discoveryf_type);
			pd.put("discoveryf_image", discoveryf_image);
			pd.put("discoveryf_title", discoveryf_title);
			pd.put("discoveryf_content", discoveryf_content);
			findsService.editFoodInformation(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	//删除美食资讯
	@RequestMapping(value="delFoodInformation")
	public ModelAndView delFoodInformation(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			findsService.delFoodInformation(pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("save_result");
		mv.addObject("resultURL", "finds/getFoodInformationlistPage.do");
		return mv;
	}
	
}
