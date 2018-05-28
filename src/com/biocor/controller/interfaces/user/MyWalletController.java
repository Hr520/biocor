package com.biocor.controller.interfaces.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.user.MyWalletService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.MD5;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.StringUtil;

@Controller
@RequestMapping(value="interface/myWallet")
public class MyWalletController extends BaseController{
	@Resource(name="myWalletService")
	private MyWalletService myWalletService;
	
	//我的钱包
	@RequestMapping(value="myWalletInfo")
	@ResponseBody
	public ResponseEntity<?> myWalletInfo(HttpServletRequest request){
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			pd = myWalletService.myWalletInfo(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//点击提现按钮查询余额和支付宝账号
	@RequestMapping(value="getBalanceAndAlipay")
	@ResponseBody
	public ResponseEntity<?> getBalanceAndAlipay(HttpServletRequest request){
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			pd.put("userid", userid);
			pd = myWalletService.getBalanceAndAlipay(pd);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//提现申请
	@RequestMapping(value="withdrawApply")
	@ResponseBody
	public ResponseEntity<?> withdrawApply(HttpServletRequest request){
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<>();
		try {
			String userid = request.getParameter("userid");
			float uw_money = Float.parseFloat(request.getParameter("uw_money"));
			String ua_user_account = request.getParameter("ua_user_account");
			//String ua_user_verifycode = request.getParameter("ua_user_verifycode");
			String user_pay_pwd = request.getParameter("user_pay_pwd");
			user_pay_pwd = MD5.md5(user_pay_pwd);
			String uw_orderNO = StringUtil.getOrderNo();
			pd.put("userid", userid);
			pd.put("uw_orderNO", uw_orderNO);
			pd.put("uw_state", 0);
			pd.put("uw_money", uw_money);
			pd.put("ua_user_account", ua_user_account);
			//pd.put("ua_user_verifycode", ua_user_verifycode);
			pd.put("uw_remark", "");
			Float user_money = myWalletService.getUserMoney(pd);//得到用户余额
			if(uw_money<100){
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("提现金额需大于100元才能提现");
			}else if(uw_money>user_money){
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("提现金额不能大于可用余额");
			}else{
				//String ua_verifycode = myWalletService.getTxverifycode(pd);//查询提现验证码
				//if(ua_verifycode.equals(ua_user_verifycode)){
					String paypwd = myWalletService.getUserPayPwd(pd);//查询用户支付密码
					if(paypwd.equals(user_pay_pwd)){
						//将支付宝账号存入
						int count = myWalletService.hasAlipay(pd);
						if(count==0){
							myWalletService.addAlipay(pd);
						}
						pd.put("user_money", user_money-uw_money);
						myWalletService.updateUserMoney(pd);//修改用户可用余额
						pd.put("uw_money", uw_money*0.92);//提现金额
						map.put("tx_money", uw_money*0.92);
						pd.put("uw_type", 1);
						myWalletService.withdrawApply(pd);//添加提现申请
						pd.put("uw_money", uw_money*0.08);//提现手续费
						map.put("sxf_money", uw_money*0.08);
						pd.put("uw_type", 0);
						myWalletService.withdrawApply(pd);//加入提现表
						map.put("uw_orderNO", uw_orderNO);
						map.put("ua_user_account", ua_user_account);
						return new ResponseEntity<Map<String,Object>>().setState(Constants.SUCCESS).setData(map).setMsg("提现申请成功");
					}else{
						pd = new PageData();
						return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("支付密码错误");
					}
				//}else{
					//return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("验证码错误");
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//查询余额明细
	@RequestMapping(value="getmyWalletDetails")
	@ResponseBody
	public ResponseEntity<?> getmyWalletDetails(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("userid", userid);
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
            list = myWalletService.getmyWalletDetails(pd);
            for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getString("uw_type").equals("0")){
					list.get(i).put("uw_type", "提现手续费");
					list.get(i).put("uw_money", "-"+list.get(i).get("uw_money"));
				}else if(list.get(i).getString("uw_type").equals("1")){
					list.get(i).put("uw_type", "提现");
					list.get(i).put("uw_money", "-"+list.get(i).get("uw_money"));
				}else if(list.get(i).getString("uw_type").equals("2")){
					list.get(i).put("uw_type", "消费奖励");
					list.get(i).put("uw_money", "+"+list.get(i).get("uw_money"));
				}else if(list.get(i).getString("uw_type").equals("3")){
					list.get(i).put("uw_type", "余额消费");
					list.get(i).put("uw_money", "-"+list.get(i).get("uw_money"));
				}else if (list.get(i).getString("uw_type").equals("4")) {
					list.get(i).put("uw_type", "支付宝消费");
					list.get(i).put("uw_money", "-"+list.get(i).get("uw_money"));
				}else if (list.get(i).getString("uw_type").equals("5")) {
					list.get(i).put("uw_type", "奖励");
					list.get(i).put("uw_money", "+"+list.get(i).get("uw_money"));
				}else if(list.get(i).getString("uw_type").equals("6")){
					list.get(i).put("uw_type", "取消订单退款");
					list.get(i).put("uw_money", "+"+list.get(i).get("uw_money"));
				}
			}
            return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}

}
