package com.biocor.controller.interfaces.user;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.biocor.controller.base.BaseController;
import com.biocor.controller.interfaces.login.UserLoginController;
import com.biocor.service.interfaces.ShopAndOrderService.ShopAndorderService;
import com.biocor.service.interfaces.login.LoginService;
import com.biocor.service.interfaces.user.UserInfoService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.MD5;
import com.biocor.util.PageData;
import com.biocor.util.QRCode;
import com.biocor.util.ResponseEntity;
import com.biocor.util.UuidUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "interface/userInfo")
public class UserInfoController extends BaseController {
	@Resource(name = "userInfoService")
	private UserInfoService userInfoService;
	@Resource(name = "loginService")
	private LoginService loginService;
	@Resource
	private ShopAndorderService shopAndorderService;

	// 查询用户详情
	@RequestMapping(value = "getUserInfo")
	@ResponseBody
	public ResponseEntity<?> getUserInfo(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			Integer countsys = userInfoService.getmessagecountA();
			Integer totleA = countsys;
			Integer countUser = userInfoService.getmessagecountB(pd);
			Integer totleB = countUser;
			pd = userInfoService.getUserInfo(pd);
			if (pd != null) {
				pd.put("userid", userid);
				pd = userInfoService.getMemberGradeInfo(pd);
				// 查询用户的等级
				String user_grade_integral=pd.get("user_grade_integral").toString();
				pd.put("user_grade_integral", user_grade_integral);
				int uig_grade_No=userInfoService.getUserLevel(pd);
				pd.put("uig_grade_No", uig_grade_No);
				/*String createdate = pd.getString("user_createdate");
				int grade = (int) pd.get("uig_grade_No");
				int grade_No = UserLoginController.getMonthNum(createdate, grade);
				pd.put("uig_grade_No", grade_No);*/
			}
			pd.put("totole", totleA + totleB);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 修改用户头像
	@RequestMapping(value = "updateUserHeadImage")
	@ResponseBody
	public ResponseEntity<?> updateUserHeadImage(HttpServletRequest request,
			@RequestParam(value = "files", required = false) MultipartFile[] files) {
		PageData pd = new PageData();
		String imgurl = "";
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			int i = 0;
			for (MultipartFile f : files) {
				String fileName = f.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String fileEnd = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				fileName = uuid + "." + fileEnd;
				String str = request.getSession().getServletContext().getRealPath("/");
				// str = str.substring(0, str.length()-1);
				// str = str.substring(0, str.lastIndexOf("\\"));
				String url = str + "upload/img/headimage/";
				File targetFile = new File(url, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				f.transferTo(targetFile);
				if (i == 0) {
					imgurl = "upload/img/headimage/" + fileName;
				} else {
					imgurl = imgurl + "," + "upload/img/headimage/" + fileName;
				}
				i++;
			}
			pd.put("user_img", imgurl);
			userInfoService.updateUserHeadImage(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("头像修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("interface----upload:e=" + e);
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 修改用户信息
	@RequestMapping(value = "updateUserInfo")
	@ResponseBody
	public ResponseEntity<?> updateUserInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			// String user_code = request.getParameter("user_code");
			String user_name = request.getParameter("user_name");
			String user_sex = request.getParameter("user_sex");
			String user_birthday = request.getParameter("user_birthday");
			String user_addres = request.getParameter("user_addres");
			pd.put("userid", userid);
			// pd.put("user_code", user_code);
			pd.put("user_name", user_name);
			pd.put("user_sex", user_sex);
			pd.put("user_birthday", user_birthday);
			pd.put("user_addres", user_addres);
			userInfoService.updateUserInfo(pd);
			return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map).setMsg("修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 更换手机号时验证之前手机号
	@RequestMapping(value = "validatePhone")
	@ResponseBody
	public ResponseEntity<?> validatePhone(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verifycode");
			pd.put("user_code", user_code);
			String verifyCode = loginService.getVerifyCode(pd);
			if (verifyCode.equals(verify_code)) {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("短信验证成功");
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("验证码错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 更换手机号(使用绑定手机号时的发送验证码接口)
	@RequestMapping(value = "replacePhone")
	@ResponseBody
	public ResponseEntity<?> replacePhone(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			String user_code = request.getParameter("user_code");
			String verifycode = request.getParameter("verifycode");
			pd.put("userid", userid);
			pd.put("user_code", user_code);
			pd.put("verifycode", verifycode);
			int count = loginService.hasUser(pd);
			if (count > 0) {
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("该用户已存在");
			} else {
				String code = loginService.getVerifyCodeByUserid(pd);
				if (code.equals(verifycode)) {
					userInfoService.replacePhone(pd);
					return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("更换手机号成功");
				} else {
					return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("验证码错误");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 推荐好友（生成二维码）
	@RequestMapping(value = "recommendFriends")
	@ResponseBody
	public ResponseEntity<?> recommendFriends(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			String user_qrcode = userInfoService.getUserQrcode(pd);
			if (user_qrcode == null || user_qrcode.equals("") && user_qrcode.equals("null")) {
				// 生成用户二维码
				String str = request.getSession().getServletContext().getRealPath("/");
				String qrcode = "upload/code/user/user_" + UuidUtil.get32UUID() + ".png";
				String content = General.HOST_URL + "userInfo/getUserInfo?userid=" + userid;
				QRCode handler = new QRCode();
				handler.encoderQRCode(content, str + qrcode);
				pd.put("user_qcode", qrcode);
				loginService.updateUserQcode(pd);
			}
			pd = userInfoService.getUserInfo(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("生成二维码成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 实名认证
	@RequestMapping(value = "realNameAuthentication")
	@ResponseBody
	public ResponseEntity<?> realNameAuthentication(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			String ua_userName = request.getParameter("ua_userName");
			String ua_userIP = request.getParameter("ua_userIP");
			String ua_user_tel = request.getParameter("user_code");
			pd.put("ua_userId", userid);
			pd.put("ua_userName", ua_userName);
			pd.put("ua_userIP", ua_userIP);
			pd.put("ua_user_tel", ua_user_tel);
			userInfoService.realNameAuthentication(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("实名认证成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg(e.getMessage());
		}
	}

	// 推广记录
	@RequestMapping(value = "promotionRecord")
	@ResponseBody
	public ResponseEntity<?> promotionRecord(HttpServletRequest request) {
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		try {
			String curpage = request.getParameter("curpage");
			String user_code = request.getParameter("user_code");
			pd.put("user_code", user_code);
			logger.info("interface----promotionRecord:user_code=" + user_code + ",curpage=" + curpage);
			pd.put("num", (Integer.parseInt(curpage) - 1) * General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			list = userInfoService.promotionRecord(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}

	// 设置或修改支付密码
	@RequestMapping(value = "updatePayPwd")
	@ResponseBody
	public ResponseEntity<?> updatePayPwd(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verify_code");
			String user_pay_pwd = request.getParameter("user_pay_pwd");
			String reuser_pay_pwd = request.getParameter("reuser_pay_pwd");
			if (!user_pay_pwd.equals(reuser_pay_pwd)) {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("密码与确认密码不一致");
			} else {
				if (user_pay_pwd != null && !"".equals(user_pay_pwd)) {
					user_pay_pwd = MD5.md5(user_pay_pwd);
				}
				pd.put("user_code", user_code);
				pd.put("user_pay_pwd", user_pay_pwd);
				String verifyCode = loginService.getVerifyCode(pd);
				if (verify_code.equals(verifyCode)) {
					loginService.updatePayPwd(pd);
					return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
							.setMsg("修改成功");
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("验证码错误");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 我的关注
	@RequestMapping(value = "myFollowList")
	@ResponseBody
	public ResponseEntity<?> myFollowList(HttpServletRequest request) {
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String userid = request.getParameter("userid");
			String lat = request.getParameter("lat");// 纬度
			String lng = request.getParameter("lng");// 经度
			String curpage = request.getParameter("curpage");
			pd.put("num", (Integer.parseInt(curpage) - 1) * General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			pd.put("userid", userid);
			pd.put("lat", lat);
			pd.put("lng", lng);
			list = userInfoService.myFollowList(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}

	// 我的消息
	@RequestMapping(value = "myMessage")
	@ResponseBody
	public ResponseEntity<?> myMessage(HttpServletRequest request) {
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("num", (Integer.parseInt(curpage) - 1) * General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			pd.put("userid", userid);
			list = userInfoService.myMessage(pd);
			for (int i = 0; i < list.size(); i++) {
				String um_msgdate = list.get(i).getString("um_msgdate");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String timeStamp = String.valueOf(sdf.parse(um_msgdate).getTime() / 1000);
				list.get(i).put("timeStamp", timeStamp);
			}
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}

	// 推荐好友h5
	@RequestMapping(value = "recommendFriendsH5")
	@ResponseBody
	public Map<String, Object> recommendFriendsH5(HttpServletRequest request) {
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			String user_qrcode = userInfoService.getUserQrcode(pd);
			if (user_qrcode == null || user_qrcode.equals("") || user_qrcode.equals("null")) {
				// 生成用户二维码
				String str = request.getSession().getServletContext().getRealPath("/");
				user_qrcode = "upload/code/user/user_" + UuidUtil.get32UUID() + ".png";
				String content = General.HOST_URL + "userInfo/getUserInfo?userid=" + userid;
				QRCode handler = new QRCode();
				handler.encoderQRCode(content, str + user_qrcode);
				pd.put("user_qcode", user_qrcode);
				loginService.updateUserQcode(pd);
				pd = userInfoService.getUserInfo(pd);
			}
			String curpage = request.getParameter("curpage");
			String user_code = request.getParameter("user_code");
			pd.put("user_code", user_code);
			logger.info("interface----promotionRecord:user_code=" + user_code + ",curpage=" + curpage);
			pd.put("num", (Integer.parseInt(curpage) - 1) * General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			list = userInfoService.promotionRecord(pd);
			map.put("user_qcode", user_qrcode);
			map.put("list", list);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	// 会员等级
	@RequestMapping(value = "memberH5")
	@ResponseBody
	public PageData memberH5(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			pd = userInfoService.getMemberGradeInfo(pd);
			// 查询用户的等级
			String user_grade_integral=pd.get("user_grade_integral").toString();
			pd.put("user_grade_integral", user_grade_integral);
			int uig_grade_No=userInfoService.getUserLevel(pd);
			pd.put("uig_grade_No", uig_grade_No);
			// 根据等级查询等级结束的积分
			int uig_grade_end = userInfoService.getGradeEndIntegral(pd);
			pd.put("uig_grade_end", uig_grade_end);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}

	// 版本更新/安卓苹果/
	@RequestMapping(value = "versionUpload")
	@ResponseBody
	public void versionAndLead(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8"); // 目的是为了控制浏览器的行为，即控制浏览器用UTF-8进行解码；
		response.setCharacterEncoding("UTF-8"); // 的目的是用于response.getWriter()输出的字符流的乱码问题，如果是response.getOutputStream()是不
		JSONObject jsonObject = new JSONObject();
		PrintWriter out = null;
		String state = "";
		String msg = "";
		JSONObject data = new JSONObject();
		try {
			out = response.getWriter();
			String version = request.getParameter("version");// 1

			PageData pd = new PageData();
			pd.put("version", version);
			List<PageData> list = userInfoService.findVersion(pd);

			String isNew = "0";
			String content = "";
			if (list.size() > 0) {
				isNew = "1";
				data.put("version", list.get(0).get("version"));
				data.put("version_name", list.get(0).get("version_name"));

				data.put("version_url", list.get(0).get("version_url").toString());
				content = list.get(0).get("content").toString();

				// 获取文件大小
				String strs = request.getSession().getServletContext().getRealPath("/");
				String url = strs + list.get(0).get("version_url").toString();
				File f = new File(url);
				String size = "";
				if (f.exists() && f.isFile()) {
					size = f.length() + "";
				} else {
					size = "0";
				}
				data.put("size", size);

				// 时间戳
				data.put("time", dateToStamp(list.get(0).get("createtime").toString()));

			} else {
				content = "当前版本已是最新版本";
			}
			data.put("isNew", isNew);
			data.put("content", content);

			state = General.SUCCESS;
			msg = "请求成功";

		} catch (Exception e) {
			logger.info("interface----versionUpload:e=" + e);
			state = General.ERROR_2001;
			msg = "系统错误";
		} finally {
			jsonObject.put("state", state);
			jsonObject.put("msg", msg);
			jsonObject.put("data", data);
			out.print(jsonObject);
		}
	}

	/**
	 * 日期格式时间转换为时间戳格式
	 * 
	 * @param s
	 * @return
	 * @throws Exception
	 */
	public static String dateToStamp(String s) throws Exception {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = simpleDateFormat.parse(s);
		long ts = date.getTime();
		String res = String.valueOf(ts);
		return res;
	}

}
