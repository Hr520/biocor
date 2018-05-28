package com.biocor.controller.admin.message;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.service.admin.message.Messageservice;
import com.biocor.service.interfaces.notice.NoticeService;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.biocor.util.push.JPush;
import com.biocor.util.push.JPushshanmei;

/**
 * 
 * @author Administrator 系统消息管理后台
 *
 */

@Controller
@RequestMapping(value = "messege")
public class MessgeController extends BaseController {
	@Resource
	private Messageservice messageservice;
	@Resource
	private NoticeService noticeService;

	// 系统消息查询列表
	@RequestMapping(value = "geteMessageList")
	public ModelAndView geteMessageList(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			ModelAndView mv = this.getModelAndView();
			List<PageData> list = new ArrayList<PageData>();
			String curpage = request.getParameter("currentPage");
			String showCount = request.getParameter("showCount");
			// 当前页
			if (StringUtil.isNull(curpage)) {
				curpage = "1";
			}
			// 每页条数
			if (StringUtil.isNull(showCount)) {
				showCount = "10";
			}
			page.setCurrentPage(Integer.parseInt(curpage));
			page.setShowCount(Integer.parseInt(showCount));
			list = messageservice.geteMessageList(page);
			mv.setViewName("message/message_list");
			mv.addObject("list", list);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 删除推送消息
	@RequestMapping(value = "deleteMessage")
	public ModelAndView deleteMessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			String umid = request.getParameter("umid");
			PageData pd = new PageData();
			pd.put("umid", umid);
			messageservice.deleteMessage(pd);
			return geteMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 新增推送消息
	@RequestMapping(value = "addMessage")
	public ModelAndView addMessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			Integer um_msg_type = 1;
			String um_msgcontent = request.getParameter("um_msgcontent");
			String um_msgtitle = request.getParameter("um_msgtitle");
			Integer u_tuistate = 1;
			PageData pd = new PageData();
			pd.put("um_msg_type", um_msg_type);
			pd.put("um_msgcontent", um_msgcontent);
			pd.put("um_msgtitle", um_msgtitle);
			pd.put("u_tuistate", u_tuistate);
			// 执行系统消息添加
			messageservice.addMessage(pd);
			return geteMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 新增页面跳转
	@RequestMapping(value = "jupAddmsg")
	public ModelAndView jupAddmsg(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("message/message_add");
		return mv;
	}

	// 消息推送
	@RequestMapping(value = "TUImessage")
	public ModelAndView TUImessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			String msgcontent = request.getParameter("um_msgcontent");
			String um_msgcontent = new String(msgcontent.getBytes("iso-8859-1"), "UTF-8");
			System.out.println(um_msgcontent);
			String umid = request.getParameter("umid");
			JPush.sendAll(um_msgcontent);
			// 推送成功后更改该条信息的状态
			PageData pd = new PageData();
			pd.put("umid", umid);
			pd.put("u_tuistate", 0);
			messageservice.updateMessagestate(pd);
			return geteMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 店铺加盟列表
	@RequestMapping(value = "shareListPage")
	public ModelAndView shareListPage(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();
		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		// 当前页
		if (StringUtil.isNull(curpage)) {
			curpage = "1";
		}
		// 每页条数
		if (StringUtil.isNull(showCount)) {
			showCount = "10";
		}
		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		try {
			list = noticeService.getsharelistPage(page);
			mv.setViewName("shop/shopshare");
			mv.addObject("list", list);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 删除加盟商信息
	@RequestMapping(value = "deleteshare")
	public ModelAndView deleteshare(HttpServletRequest request, HttpServletResponse response, Page page) {
		PageData pd = this.getPageData();
		try {
			messageservice.deleteshare(pd);
			return shareListPage(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * 
	 * @return
	 * 山莓商户端系统消息推送管理
	 */
	// 商户端系统消息查询列表
	@RequestMapping(value = "getshanmeibackMessageList")
	public ModelAndView getshanmeibackMessageList(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			ModelAndView mv = this.getModelAndView();
			List<PageData> list = new ArrayList<PageData>();
			String curpage = request.getParameter("currentPage");
			String showCount = request.getParameter("showCount");
			// 当前页
			if (StringUtil.isNull(curpage)) {
				curpage = "1";
			}
			// 每页条数
			if (StringUtil.isNull(showCount)) {
				showCount = "10";
			}
			page.setCurrentPage(Integer.parseInt(curpage));
			page.setShowCount(Integer.parseInt(showCount));
			list = messageservice.getshanmeibackMessageList(page);
			mv.setViewName("message/backmessage_list");
			mv.addObject("list", list);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 删除推送消息
	@RequestMapping(value = "shopdeleteMessage")
	public ModelAndView shopdeleteMessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			String id = request.getParameter("id");
			PageData pd = new PageData();
			pd.put("id", id);
			messageservice.shopdeleteMessage(pd);
			return getshanmeibackMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 新增推送消息
	@RequestMapping(value = "backaddMessage")
	public ModelAndView backaddMessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			PageData pd = new PageData();
			pd.put("content", content);
			pd.put("title", title);
			// 执行系统消息添加
			messageservice.backaddMessage(pd);
			return getshanmeibackMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 新增页面跳转
	@RequestMapping(value = "backjupAddmsg")
	public ModelAndView backjupAddmsg(HttpServletRequest request, HttpServletResponse response, Page page) {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("message/backmessage_add");
		return mv;
	}

	// 消息推送
	@RequestMapping(value = "backTUImessage")
	public ModelAndView backTUImessage(HttpServletRequest request, HttpServletResponse response, Page page) {
		try {
			String msgcontent = request.getParameter("content");
			String content = new String(msgcontent.getBytes("iso-8859-1"), "UTF-8");
			String id = request.getParameter("id");
			JPushshanmei.sendAll(content);
			// 推送成功后更改该条信息的状态
			PageData pd = new PageData();
			pd.put("id", id);
			pd.put("state", 0);
			messageservice.updatebackMessagestate(pd);
			return getshanmeibackMessageList(request, response, page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
