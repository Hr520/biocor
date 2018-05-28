package com.biocor.controller.interfaces.find;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.interfaces.find.FindService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="interface/find")
public class FindController extends BaseController{
	@Resource(name="findService")
	private FindService findService;
	
	//查询美食资讯列表H5用
	@RequestMapping(value="getFoodInfoListH5")
	@ResponseBody
	public Map<String, Object> getFoodInfoListH5(HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		try {
			String discoveryf_type = request.getParameter("discoveryf_type");
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
            pd.put("discoveryf_type", discoveryf_type);
            list = findService.getFoodInfoList(pd);
            map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	//查询美食资讯列表接口
	@RequestMapping(value="getFoodInfoList")
	@ResponseBody
	public ResponseEntity<?> getFoodInfoList(HttpServletRequest request){
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		try {
			String discoveryf_type = request.getParameter("discoveryf_type");
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
            pd.put("discoveryf_type", discoveryf_type);
            list = findService.getFoodInfoList(pd);
            String regEx_html = "<[^>]+>";// 定义HTML标签的正则表达式
            String regEx_space = "\\s*|\t|\r|\n";//定义空格回车换行符
            for(int i = 0;i<list.size();i++){
            	String content = list.get(i).getString("discoveryf_content");
            	Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);  
                Matcher m_html = p_html.matcher(content);  
                content = m_html.replaceAll(""); // 过滤html标签
                Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);  
                Matcher m_space = p_space.matcher(content);  
                content = m_space.replaceAll(""); // 过滤空格回车标签
                content = content.trim();
                list.get(i).put("discoveryf_content", content);
            }
            return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//查询咨询详情
	@RequestMapping(value="informationDetails")
	@ResponseBody
	public PageData informationDetails(HttpServletRequest request){
		PageData pd = new PageData();
		try {
			String dfid = request.getParameter("dfid");
			pd.put("dfid", dfid);
			pd = findService.informationDetails(pd);
			pd.put("state", 0);
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("state", 1);
		}
		return pd;
	}
	//查询健康测试问题
	@RequestMapping(value="questionList")
	@ResponseBody
	public Map<String, Object> questionList(){
		List<PageData> qlist = new ArrayList<>();
		List<PageData> alist = new ArrayList<>();
		int count = 0;
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<>();
		try {
			count = findService.getQuestionCount();
			qlist = findService.getQuestionList();
			for (int i = 0; i < qlist.size(); i++) {
				pd.put("qid", qlist.get(i).get("qid"));
				alist = findService.getAnswerList(pd);
				qlist.get(i).put("alist", alist);
			}
			map.put("qlist", qlist);
			map.put("count", count);
			map.put("msg","success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg","error");
		}
		return map;
	}
	//添加用户健康测试数据
	@RequestMapping(value="addUserQuestionTest")
	public ModelAndView addUserQuestionTest(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		ModelAndView mv = new ModelAndView("forward:/upload/html/food-res.jsp");
		try {
			String userid = request.getParameter("userid");
			String str = request.getParameter("str");
			pd.put("uq_userId", userid);
			pd.put("uq_answers", str);
			pd.put("uq_qno",StringUtil.getOrderNo());
			list = findService.getAllFood();
			Random random = new Random();
			int x = random.nextInt(list.size());
			String uq_random_goodsname = list.get(x).getString("goods_name");
			String uq_random_goodsimg = list.get(x).getString("goods_images").split(",")[0];
			String uq_random_sId = list.get(x).get("goods_sid")+"";
			pd.put("uq_random_goodsname", uq_random_goodsname);
			pd.put("uq_random_goodsimg", uq_random_goodsimg);
			pd.put("uq_random_sId", uq_random_sId);
			findService.addUserQuestionTest(pd);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "error");
		}
		mv.addObject("pd", pd);
		return mv;
	}

}
