package com.biocor.controller.interfaces.message;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.notice.NoticeService;
import com.biocor.util.Constants;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

@Controller
@RequestMapping(value = "interface/notice")
public class MessageController extends BaseController {

	@Resource
	private NoticeService noticeService;

	// 查询用户的消息列表接口
	@RequestMapping(value = "getUserMsglist")
	@ResponseBody
	public ResponseEntity<?> getUserMsglist(HttpServletRequest request) {
		try {
			List<PageData> list = new ArrayList<>();
			String um_userId = request.getParameter("userid");
			Integer page = Integer.parseInt(request.getParameter("index"));
			Integer rows = 10;
			PageData pd = new PageData();
			pd.put("um_userId", um_userId);
			pd.put("stratrows", (page - 1) * rows);
			pd.put("rows", rows);
			list = noticeService.getUserMsglist(pd);
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list)
						.setMsg("消息列表获取成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 商家加盟
	@RequestMapping(value = "shopAdd")
	@ResponseBody
	public ResponseEntity<?> shopAdd(HttpServletRequest request) {
		try {
			String name = request.getParameter("shop_name");
			String shop_name = new String(name.getBytes("iso-8859-1"), "UTF-8");
			String type = request.getParameter("shop_type");
			String shop_type = new String(type.getBytes("iso-8859-1"), "UTF-8");
			String adress = request.getParameter("shop_adress");
			String shop_adress = new String(adress.getBytes("iso-8859-1"), "UTF-8");
			String phone = request.getParameter("shop_phone");
			String shop_phone = new String(phone.getBytes("iso-8859-1"), "UTF-8");
			PageData pd = new PageData();
			pd.put("shop_name", shop_name);
			pd.put("shop_type", shop_type);
			pd.put("shop_adress", shop_adress);
			pd.put("shop_phone", shop_phone);
			// 判断用户是否已经提交过
			int count = noticeService.getShopIsapply(pd);
			if (count > 0) {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("请勿重复提交");
			}
			noticeService.shopAdd(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}
	
	
}
