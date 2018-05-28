package com.biocor.controller.admin.integral;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.integral.IntegralByEndService;
import com.biocor.util.PageData;

@Controller
@RequestMapping(value="integral")
public class IntegralByEndController extends BaseController{
	@Resource(name="integralByEndService")
	private IntegralByEndService integralByEndService;
	
	//查询所有加速卡
	@RequestMapping(value="getSpeedCardlistPage")
	public ModelAndView getSpeedCardlistPage(Page page){
		ModelAndView mv = new ModelAndView("integral/speedCard_list");
		List<PageData> list = new ArrayList<>();
		try {
			list = integralByEndService.getSpeedCardlistPage(page);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
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
			if("add".equals(msg)){
				mv.addObject("title", "新增加速卡");
				mv.addObject("action_url", "addSpeedCard");
			}else if("edit".equals(msg)){
				pd = integralByEndService.getSpeedCardInfo(pd);
				mv.addObject("pd", pd);
				mv.addObject("title", "修改加速卡");
				mv.addObject("action_url", "editSpeedCard");
			}
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("integral/speedCard_edit");
		return mv;
	}
	//新增加速卡
	@RequestMapping(value="addSpeedCard")
	public ModelAndView addSpeedCard(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			integralByEndService.addSpeedCard(pd);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("save_result");
		mv.addObject("resultURL", "integral/getSpeedCardlistPage.do");
		return mv;
	}
	//修改加速卡
	@RequestMapping(value="editSpeedCard")
	public ModelAndView editSpeedCard(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			integralByEndService.editSpeedCard(pd);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("save_result");
		mv.addObject("resultURL", "integral/getSpeedCardlistPage.do");
		return mv;
	}
	//删除加速卡
	@RequestMapping(value="delSpeedCard")
	public ModelAndView delSpeedCard(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try {
			integralByEndService.delSpeedCard(pd);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.setViewName("save_result");
		mv.addObject("resultURL", "integral/getSpeedCardlistPage.do");
		return mv;
	}

}
