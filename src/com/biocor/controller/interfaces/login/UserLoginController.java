package com.biocor.controller.interfaces.login;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicToolBarUI.DockingListener;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.login.LoginService;
import com.biocor.util.Constants;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.SDKUtils;
import com.biocor.util.SecurityUtil;
import com.biocor.util.SmsUtil;

@Controller
@RequestMapping(value = "interface/login")
public class UserLoginController extends BaseController {
	@Resource(name = "loginService")
	private LoginService loginService;

	// 用户注册发送验证码
	@RequestMapping(value = "sendSms")
	@ResponseBody
	public ResponseEntity<?> sendSms(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		// pd = this.getPageData();
		// String userid = pd.get("userid").toString();
		try {
			String user_code = request.getParameter("user_code");
			String verifycode = SDKUtils.getVerificationCode();
			String user_invite_code = "";
			pd.put("user_code", user_code);
			// 接收用户传递的参数类型type用来区分用户的操作 防止用户 重复注册
			String type = request.getParameter("type");
			if (type != null && !type.equals("type")) {
				// 先判断用户是否已经注册
				int total = loginService.getCodeUSersuccess(pd);
				// int userid = loginService.getUserRegCode(pd);
				if (total > 0) {
					// 用户已经注册成功的
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("您已经注册过了");
				} else {
					if (user_code != null && !"".equals(user_code)) {
						int count = loginService.hasUser(pd);
						if (count > 0) {
							pd.put("verifycode", verifycode);
							HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);
							if (result.get("statusCode").equals("000000")) {
								loginService.updateVerifyCode(pd);
							} else {
								return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
										.setMsg("验证码发送失败，请输入正确的手机号码");
							}
						} else {
							// 生成邀请码
							do {
								String a = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
								for (int i = 0; i < 6; i++) {
									int rand = (int) (Math.random() * a.length());
									char str = a.charAt(rand);
									user_invite_code += str;
								}
							} while (loginService.hasInviteCode(user_invite_code) > 0);// 判断邀请码是否存在
							pd.put("verifycode", verifycode);
							pd.put("user_name", user_code);
							pd.put("user_invite_code", user_invite_code);
							HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);// 发送验证码
							if (result.get("statusCode").equals("000000")) {
								loginService.addUser(pd);
							} else {
								return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
										.setMsg("验证码发送失败，请输入正确的手机号码");
							}
						}
					} else {
						return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
								.setMsg("手机号码不能为空");
					}
					return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
							.setMsg("验证码发送成功");

				}

			} else {
				if (user_code != null && !"".equals(user_code)) {
					int count = loginService.hasUser(pd);
					if (count > 0) {
						pd.put("verifycode", verifycode);
						HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);
						if (result.get("statusCode").equals("000000")) {
							loginService.updateVerifyCode(pd);
						} else {
							return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
									.setMsg("验证码发送失败，请输入正确的手机号码");
						}

					} else {
						// 生成邀请码
						do {
							String a = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
							for (int i = 0; i < 6; i++) {
								int rand = (int) (Math.random() * a.length());
								char str = a.charAt(rand);
								user_invite_code += str;
							}
						} while (loginService.hasInviteCode(user_invite_code) > 0);// 判断邀请码是否存在
						pd.put("verifycode", verifycode);
						pd.put("user_name", user_code);
						pd.put("user_invite_code", user_invite_code);
						HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);// 发送验证码
						if (result.get("statusCode").equals("000000")) {
							loginService.addUser(pd);
						} else {
							return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
									.setMsg("验证码发送失败，请输入正确的手机号码");
						}

					}
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("手机号码不能为空");
				}
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("验证码发送成功");

			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}

	}

	// 新用户注册
	@RequestMapping(value = "registerUser")
	@ResponseBody
	public ResponseEntity<?> registerUser(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verify_code");
			String user_pwd = request.getParameter("user_pwd");
			String referee_phone = request.getParameter("referee_phone");
			if (user_pwd != null && !"".equals(user_pwd)) {
				// user_pwd = MD5.md5(user_pwd);
				user_pwd = SecurityUtil.Base64Encode(user_pwd);
			}
			pd.put("user_code", user_code);
			pd.put("verifyCode", verify_code);
			pd.put("user_pwd", user_pwd);
			pd.put("referee_phone", referee_phone);
			// 判断用户是否有注册
			int userid1 = loginService.getUserRegCode(pd);

			// int userid = loginService.getUserIdByUserCode(pd);
			if (userid1 == 0) {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("用户已注册");
			} else {
				// 得到用户验证码
				String verifyCode = loginService.getVerifyCode(pd);
				if ((verifyCode).equals(pd.getString("verifyCode"))) {
					loginService.updateUser(pd);
					// 新用户注册成功给5%加速卡
					String car_id = loginService.getspeedCarId();
					pd = new PageData();
					pd.put("car_id", car_id);
					pd.put("userid", userid1);
					pd.put("usc_state", 0);
					loginService.sendNewUserspeedcar(pd);
					return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
							.setMsg("注册成功");
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

	// 用户获取动态密码
	@RequestMapping(value = "getDynamicPassword")
	@ResponseBody
	public ResponseEntity<?> getDynamicPassword(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		String verifycode = SDKUtils.getVerificationCode();
		try {
			String user_code = request.getParameter("user_code");
			pd.put("user_code", user_code);
			pd.put("verifycode", verifycode);
			HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);
			if (result.get("statusCode").equals("000000")) {
				loginService.updateVerifyCode(pd);
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("验证码发送失败，请输入正确的手机号码");
			}
			return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map).setMsg("验证码发送成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	public static void main(String[] args) {

	}

	public class tred extends Thread {
		public void run() {
			while (true) {
				try {
					Thread.sleep(1000);
					int sum = 0;
					sum = sum + 1;
					System.out.println(sum);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}

	}

	// 用户获取验证码
	// 用户登录
	@RequestMapping(value = "userLogin")
	@ResponseBody
	public ResponseEntity<?> userLogin(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			// 根据用户的手机号码判定用户是否存在
			pd.put("user_code", user_code);
			Integer count = loginService.getUserphoneBycode(pd);
			if (count > 0) {
				String user_pwd = request.getParameter("user_pwd");
				String verifycode = request.getParameter("verifycode");
				// String logintype = request.getParameter("logintype")+"";
				if (user_pwd != null && !"".equals(user_pwd)) {
					// if(!logintype.equals("0")){
					// user_pwd = MD5.md5(user_pwd);
					// }
					user_pwd = SecurityUtil.Base64Encode(user_pwd);
				}
				pd.put("user_code", user_code);
				pd.put("user_pwd", user_pwd);
				pd.put("verifycode", verifycode);
				pd = loginService.userLogin(pd);
				if (pd == null || pd.size() == 0) {
					return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("用户名或密码错误");
				} else {
					// 更新登录时间
					loginService.updateLoginTime(pd);
					String guser_pwd = pd.get("user_pwd") + "";
					if (guser_pwd == null || guser_pwd.equals("") || guser_pwd.equals("null")) {
						pd.put("user_pwd", "0");
					} else {
						pd.put("user_pwd", SecurityUtil.Base64Decode(guser_pwd));
					}
					String guser_pay_pwd = pd.get("user_pay_pwd") + "";
					if (guser_pay_pwd == null || guser_pay_pwd.equals("") || guser_pay_pwd.equals("null")) {
						pd.put("user_pay_pwd", "0");
					} else {
						pd.put("user_pay_pwd", "1");
					}
					// int uig_grade_No =
					// getMonthNum(pd.getString("user_createdate"), (int)
					// pd.get("uig_grade_No"));
					// pd.put("uig_grade_No", uig_grade_No);
					// 根据等级去查询等级名称
					String uig_grade_name = loginService.getGradeName(pd);
					pd.put("uig_grade_name", uig_grade_name);
					return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("登录成功");
				}
			} else {
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("该用户不存在");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 第三方登录（1:QQ;2:微信;3:微博）
	@RequestMapping(value = "thirdPartyLogin")
	@ResponseBody
	public ResponseEntity<?> thirdPartyLogin(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		String user_invite_code = "";
		try {
			String type = request.getParameter("type");
			String user_name = request.getParameter("user_name");
			String user_img = request.getParameter("user_img");
			pd.put("user_name", user_name);
			pd.put("user_img", user_img);
			// 生成邀请码
			do {
				String a = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
				for (int i = 0; i < 6; i++) {
					int rand = (int) (Math.random() * a.length());
					char str = a.charAt(rand);
					user_invite_code += str;
				}
			} while (loginService.hasInviteCode(user_invite_code) > 0);// 判断邀请码是否存在
			pd.put("user_invite_code", user_invite_code);
			// qq登录
			if ("1".equals(type)) {
				String user_qq = request.getParameter("user_qq");
				pd.put("user_qq", user_qq);
				if (user_qq != null && !"".equals(user_qq)) {
					// 查询用户是否有用该qq登录过
					int count = loginService.hasQqLogin(pd);
					if (count == 0) {
						loginService.addUserByQq(pd);
					}
					map = loginService.getUserInfoByQq(pd);
					String user_code = map.get("user_code") + "";
					if (user_code == null || user_code.equals("") || user_code.equals("null")) {
						map.put("user_code", "");
					}
					String guser_pwd = map.get("user_pwd") + "";
					if (guser_pwd == null || guser_pwd.equals("") || guser_pwd.equals("null")) {
						map.put("user_pwd", "0");
					} else {
						map.put("user_pwd", SecurityUtil.Base64Decode(guser_pwd));
					}
					String guser_pay_pwd = map.get("user_pay_pwd") + "";
					if (guser_pay_pwd == null || guser_pay_pwd.equals("") || guser_pay_pwd.equals("null")) {
						map.put("user_pay_pwd", "0");
					} else {
						map.put("user_pay_pwd", "1");
					}
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("QQ账号为空");
				}
			} else if ("2".equals(type)) {// 微信登录
				String user_wx = request.getParameter("user_wx");
				pd.put("user_wx", user_wx);
				if (user_wx != null && !"".equals(user_wx)) {
					// 查询用户是否有用该qq登录过
					int count = loginService.hasWxLogin(pd);
					if (count == 0) {
						loginService.addUserByWx(pd);
					}
					map = loginService.getUserInfoByWx(pd);
					String user_code = map.get("user_code") + "";
					if (user_code == null || user_code.equals("") || user_code.equals("null")) {
						map.put("user_code", "");
					}
					String guser_pwd = map.get("user_pwd") + "";
					if (guser_pwd == null || guser_pwd.equals("") || guser_pwd.equals("null")) {
						map.put("user_pwd", "0");
					} else {
						map.put("user_pwd", SecurityUtil.Base64Decode(guser_pwd));
					}
					String guser_pay_pwd = map.get("user_pay_pwd") + "";
					if (guser_pay_pwd == null || guser_pay_pwd.equals("") || guser_pay_pwd.equals("null")) {
						map.put("user_pay_pwd", "0");
					} else {
						map.put("user_pay_pwd", "1");
					}
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("微信账号为空");
				}
			} else if ("3".equals(type)) {// 微博登录
				String user_wb = request.getParameter("user_wb");
				pd.put("user_wb", user_wb);
				if (user_wb != null && !"".equals(user_wb)) {
					// 查询用户是否有用该qq登录过
					int count = loginService.hasWbLogin(pd);
					if (count == 0) {
						loginService.addUserByWb(pd);
					}
					map = loginService.getUserInfoByWb(pd);
					String user_code = map.get("user_code") + "";
					if (user_code == null || user_code.equals("") || user_code.equals("null")) {
						map.put("user_code", "");
					}
					String guser_pwd = map.get("user_pwd") + "";
					if (guser_pwd == null || guser_pwd.equals("") || guser_pwd.equals("null")) {
						map.put("user_pwd", "0");
					} else {
						map.put("user_pwd", SecurityUtil.Base64Decode(guser_pwd));
					}
					String guser_pay_pwd = map.get("user_pay_pwd") + "";
					if (guser_pay_pwd == null || guser_pay_pwd.equals("") || guser_pay_pwd.equals("null")) {
						map.put("user_pay_pwd", "0");
					} else {
						map.put("user_pay_pwd", "1");
					}
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("微博账号为空");
				}
			}
			// int uig_grade_No =
			// getMonthNum(map.get("user_createdate").toString(), (int)
			// map.get("uig_grade_No"));
			// map.put("uig_grade_No", m);
			// 根据等级去查询等级名称
			pd.put("uig_grade_No", map.get("uig_grade_No"));
			String uig_grade_name = loginService.getGradeName(pd);
			map.put("uig_grade_name", uig_grade_name);
			return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map).setMsg("登录成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 找回密码获取验证码
	@RequestMapping(value = "sendFindPaswSms")
	@ResponseBody
	public ResponseEntity<?> sendFindPaswSms(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		String verifycode = SDKUtils.getVerificationCode();
		try {
			String user_code = request.getParameter("user_code");
			pd.put("user_code", user_code);
			pd.put("verifycode", verifycode);
			// 判定用户手机号码是否存在平台中
			int count = loginService.getUserphoneBycode(pd);
			if (count > 0) {
				HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);
				if (result.get("statusCode").equals("000000")) {
					loginService.updateVerifyCode(pd);
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("验证码发送失败，请输入正确的手机号码");
				}
				return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
						.setMsg("验证码发送成功");
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("该手机号码不存在");

			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 找回密码
	@RequestMapping(value = "findPassword")
	@ResponseBody
	public ResponseEntity<?> findPassword(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verify_code");
			String user_pwd = request.getParameter("user_pwd");
			String reuser_pwd = request.getParameter("reuser_pwd");
			if (!user_pwd.equals(reuser_pwd)) {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("密码与确认密码不一致");
			} else {
				if (user_pwd != null && !"".equals(user_pwd)) {
					// user_pwd = MD5.md5(user_pwd);
					user_pwd = SecurityUtil.Base64Encode(user_pwd);
				}
				pd.put("user_code", user_code);
				pd.put("user_pwd", user_pwd);
				String verifyCode = loginService.getVerifyCode(pd);
				if (verify_code.equals(verifyCode)) {
					loginService.updateUserPwd(pd);
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

	// 绑定手机号发送验证码
	@RequestMapping(value = "sendbindingPhoneSms")
	@ResponseBody
	public ResponseEntity<?> sendbindingPhoneSms(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		String verifycode = SDKUtils.getVerificationCode();
		try {
			String userid = request.getParameter("userid");
			String user_code = request.getParameter("user_code");
			pd.put("userid", userid);
			pd.put("user_code", user_code);
			pd.put("verifycode", verifycode);
			HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);
			if (result.get("statusCode").equals("000000")) {
				loginService.updateVerifyCodeById(pd);
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("验证码发送失败，请输入正确的手机号码");
			}
			return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map).setMsg("验证码发送成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 绑定手机号
	@RequestMapping(value = "bindingPhone")
	@ResponseBody
	public ResponseEntity<?> bindingPhone(HttpServletRequest request) {
		// Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verify_code");
			String user_qq = request.getParameter("user_qq");
			String user_wx = request.getParameter("user_wx");
			String user_wb = request.getParameter("user_wb");
			pd.put("userid", userid);
			String verifyCode = loginService.getVerifyCodeByUserid(pd);
			pd.put("user_code", user_code);
			pd.put("user_qq", user_qq);
			pd.put("user_wx", user_wx);
			pd.put("user_wb", user_wb);
			int count = loginService.hasUser(pd);
			// 判断验证码是否正确
			if (verify_code.equals(verifyCode)) {
				// 判断手机号是否被绑定
				if (count > 0) {
					// 加入新的第三方登录方式
					loginService.updateUserThirdParty(pd);
					// 删除多余的第三方登录方式
					loginService.deleteThirdPartyAccount(pd);
				} else {
					Random random = new Random();
					int x = random.nextInt(899999);
					x = x + 100000;
					String pwd = x + "";
					// String user_pwd =
					// user_code.substring(user_code.length()-6);
					String user_pwd = SecurityUtil.Base64Encode(pwd);
					pd.put("user_pwd", user_pwd);
					loginService.updateUserCode(pd);
					// 发送默认密码给用户
					Map<String, Object> result = new HashMap<String, Object>();
					result.put("phones", user_code);
					result.put("modelId", "122264");
					String[] modelparam = { pwd };
					SmsUtil.sendTemplateSMS(result, modelparam);
					// SDKUtils.sendmessger(user_code, pwd);
				}
				// 更新登录时间
				loginService.updateLoginTime(pd);
				pd = loginService.getUserInfoByUserCode(pd);
				String guser_pwd = pd.get("user_pwd") + "";
				if (guser_pwd == null || guser_pwd.equals("") || guser_pwd.equals("null")) {
					pd.put("user_pwd", "0");
				} else {
					pd.put("user_pwd", SecurityUtil.Base64Decode(guser_pwd));
				}
				String guser_pay_pwd = pd.get("user_pay_pwd") + "";
				if (guser_pay_pwd == null || guser_pay_pwd.equals("") || guser_pay_pwd.equals("null")) {
					pd.put("user_pay_pwd", "0");
				} else {
					pd.put("user_pay_pwd", "1");
				}
				return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("绑定成功");
			} else {
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("验证码错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}

	// 邀请好友用户注册发送验证码
	@RequestMapping(value = "sendSmsInviteH5")
	@ResponseBody
	public ResponseEntity<?> sendSmsInviteH5(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verifycode = SDKUtils.getVerificationCode();
			String user_invite_code = "";
			pd.put("user_code", user_code);
			if (user_code != null && !"".equals(user_code)) {
				// 判断用户存在
				int count = loginService.hasUser(pd);
				if (count > 0) {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("您已是老用户");
				} else {
					// 生成邀请码
					do {
						String a = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
						for (int i = 0; i < 6; i++) {
							int rand = (int) (Math.random() * a.length());
							char str = a.charAt(rand);
							user_invite_code += str;
						}
					} while (loginService.hasInviteCode(user_invite_code) > 0);// 判断邀请码是否存在
					pd.put("verifycode", verifycode);
					pd.put("user_name", user_code);
					pd.put("user_invite_code", user_invite_code);
					HashMap<String, Object> result = SDKUtils.sendmessger(user_code, verifycode);// 发送验证码
					if (result.get("statusCode").equals("000000")) {
						loginService.addUser(pd);
					} else {
						return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
								.setMsg("验证码发送失败，请输入正确的手机号码");
					}

				}
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("手机号码不能为空");
			}
			return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map).setMsg("验证码发送成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	// 邀请好友页面用户注册
	@RequestMapping(value = "registerUserInviteH5")
	@ResponseBody
	public ResponseEntity<?> registerUserInviteH5(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		PageData pd = new PageData();
		try {
			String user_code = request.getParameter("user_code");
			String verify_code = request.getParameter("verify_code");
			String referee_phone = request.getParameter("referee_phone");
			pd.put("user_code", user_code);
			pd.put("verifyCode", verify_code);
			pd.put("referee_phone", referee_phone);
			String verifyCode = loginService.getVerifyCode(pd);
			String user_password = loginService.getUserPwd(pd);
			if (user_password == null || user_password.equals("") || user_password.equals("null")) {
				if ((verifyCode).equals(pd.getString("verifyCode"))) {
					Random random = new Random();
					int x = random.nextInt(899999);
					x = x + 100000;
					String pwd = x + "";
					String user_pwd = SecurityUtil.Base64Encode(pwd);
					pd.put("user_pwd", user_pwd);
					loginService.updateUser(pd);
					// 发送默认密码给用户
					Map<String, Object> result = new HashMap<String, Object>();
					result.put("phones", user_code);
					result.put("modelId", "122264");
					String[] modelparam = { pwd };
					SmsUtil.sendTemplateSMS(result, modelparam);
					return new ResponseEntity<Map<String, Object>>().setState(Constants.SUCCESS).setData(map)
							.setMsg("注册成功");
				} else {
					return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
							.setMsg("验证码错误");
				}
			} else {
				return new ResponseEntity<Map<String, Object>>().setState(Constants.FAILED).setData(map)
						.setMsg("用户已注册过，无需从新注册");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	@RequestMapping(value = "welCommon")
	@ResponseBody
	public ResponseEntity<?> welCommon(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		try {
			String type = request.getParameter("type");// 2欢迎页，3引导页
			PageData pd = new PageData();
			pd.put("type", type);
			List<PageData> list = loginService.getWelCommonImgs(pd);
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("请求成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("没有此类型图片");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>().setState(Constants.ERROR).setData(map)
					.setMsg(e.getMessage());
		}
	}

	/**
	 * 查询用户等级
	 * 
	 * @param date1
	 *            用户注册时间
	 * @param grade
	 *            用户等级
	 * @return grade_No 用户等级
	 * @throws ParseException
	 */
	public static int getMonthNum(String date1, int grade) throws ParseException {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = format.format(date);
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(format.parse(date1));
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(format.parse(nowdate));
		int month_count = (cal2.get(1) - cal1.get(1)) * 12 + (cal2.get(2) - cal1.get(2));
		int grade_No = grade;
		if (grade == 6) {
			if (month_count >= 24) {
				grade_No = 6;
			} else if (month_count >= 12) {
				grade_No = 5;
			} else if (month_count >= 6) {
				grade_No = 4;
			} else {
				grade_No = 3;
			}
		} else if (grade == 5) {
			if (month_count >= 12) {
				grade_No = 5;
			} else if (month_count >= 6) {
				grade_No = 4;
			} else {
				grade_No = 3;
			}
		} else if (grade == 4) {
			if (month_count >= 6) {
				grade_No = 4;
			} else {
				grade_No = 3;
			}
		}
		return grade_No;
	}

}
