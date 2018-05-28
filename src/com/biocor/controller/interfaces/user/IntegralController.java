package com.biocor.controller.interfaces.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.interfaces.login.UserLoginController;
import com.biocor.service.interfaces.user.IntegralService;
import com.biocor.service.interfaces.user.UserInfoService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
@Controller
@RequestMapping(value="interface/integral")
public class IntegralController {
	@Resource(name="integralService")
	private IntegralService integralService;
	@Resource
	private UserInfoService  userInfoService;
	
	//我的积分
	@RequestMapping(value="myIntegralInfo")
	@ResponseBody
	public ResponseEntity<?> myIntegralInfo(HttpServletRequest request){
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
			pd.put("userid", userid);
			int user_integral = integralService.myIntegral(pd);
			list = integralService.getIntegralRecord(pd);
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getString("ui_integral_type").equals("0")){
					list.get(i).put("ui_integral_title", list.get(i).getString("shop_name"));
					list.get(i).put("ui_integral_type", "消费送积分");
					list.get(i).put("ui_integral_score", "+"+list.get(i).get("ui_integral_score"));
					list.get(i).put("type", 0);
				}else if(list.get(i).getString("ui_integral_type").equals("1")){
					list.get(i).put("ui_integral_title", "兑换加速卡");
					list.get(i).put("ui_integral_type", "兑换加速卡");
					list.get(i).put("ui_integral_score", "-"+list.get(i).get("ui_integral_score"));
					list.get(i).put("type", 1);
				}else if(list.get(i).getString("ui_integral_type").equals("2")){
					list.get(i).put("ui_integral_title", "积分消费");
					list.get(i).put("ui_integral_type", "积分消费");
					list.get(i).put("ui_integral_score", "-"+list.get(i).get("ui_integral_score"));
					list.get(i).put("type", 2);
				}else if(list.get(i).getString("ui_integral_type").equals("3")){
					list.get(i).put("ui_integral_title", "增长积分");
					list.get(i).put("ui_integral_type", "增长积分");
					list.get(i).put("ui_integral_score", "+"+list.get(i).get("ui_integral_score"));
					list.get(i).put("type", 3);
				}else if(list.get(i).getString("ui_integral_type").equals("4")){
					list.get(i).put("ui_integral_title", list.get(i).getString("shop_name"));
					list.get(i).put("ui_integral_type", "取消订单减积分");
					list.get(i).put("ui_integral_score", list.get(i).get("ui_integral_score"));
					list.get(i).put("type", 4);
				}
				String ui_createdate = list.get(i).getString("ui_createdate");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				String timeStamp = String.valueOf(sdf.parse(ui_createdate).getTime()/1000);
				list.get(i).put("timeStamp", timeStamp);
				String shop_images = list.get(i).getString("shop_images");
				if(shop_images!=null && shop_images.length()>0){
					shop_images = shop_images.split(",")[0];
				}else{
					shop_images = "";
				}
				list.get(i).put("shop_images", shop_images);
			}
			pd.put("user_integral", user_integral);
			pd.put("integralRecord", list);
			return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//查询积分商城
	@RequestMapping(value="integralShop")
	@ResponseBody
	public ResponseEntity<?> integralShop(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
			list = integralService.integralShop(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//查询用户未使用加速卡
	@RequestMapping(value="myUnusedSpeedCard")
	@ResponseBody
	public ResponseEntity<?> myUnusedSpeedCard(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
			pd.put("userid", userid);
			list = integralService.myUnusedSpeedCard(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//查询用户已使用的加速卡
	@RequestMapping(value="myUsedSpeedCard")
	@ResponseBody
	public ResponseEntity<?> myUsedSpeedCard(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
			pd.put("userid", userid);
			list = integralService.myUsedSpeedCard(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//兑换积分卡
	@RequestMapping(value="exchangeSpeedCard")
	@ResponseBody
	public ResponseEntity<?> exchangeSpeedCard(HttpServletRequest request){
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<>();
		try {
			String userid = request.getParameter("userid");
			String scid = request.getParameter("scid");
			
			//根据用户ID查询用户积分
			pd = new PageData();
			pd.put("userid", userid);
//			查询出用户的成长值和积分
			int user_integral = integralService.myIntegral(pd);
			int user_grade_integral = integralService.getUsergrade_integral(pd);
			//查询用户等级积分和用户注册时间
			pd = new PageData();
			pd.put("userid", userid);
			pd.put("user_grade_integral", user_grade_integral);
			int uig_grade_No=0;
			//int uig_grade_No = integralService.myGradeIntegral(pd);
//			int uig_grade_No = (int)integralService.MyGradeAndRegisterTime(pd).get("uig_grade_No");
//			String user_createdate = integralService.MyGradeAndRegisterTime(pd).getString("user_createdate");
//			查询用户的等级
			 uig_grade_No=userInfoService.getUserLevel(pd);
			//根据积分卡id查询加速卡详情
			pd = new PageData(); 
			pd.put("scid", scid);
			PageData speedCardInfo = integralService.getSpeedCardInfo(pd);
			
			int sc_speedc_integral = (int) speedCardInfo.get("sc_speedc_integral");//积分卡积分
			int sc_beggrade = Integer.parseInt(speedCardInfo.getString("sc_beggrade"));//开始等级
			int sc_endgrade = Integer.parseInt(speedCardInfo.getString("sc_endgrade"));//结束等级
			if(user_integral<sc_speedc_integral){
				return new ResponseEntity<Map<String,Object>>().setState(Constants.FAILED).
						setData(map).setMsg("您的积分不够");
			}else{
				if(uig_grade_No>=sc_beggrade && uig_grade_No <= sc_endgrade){
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			        Calendar c = Calendar.getInstance();//获取当前日期
			        
			        //添加用户加速卡
			        pd= new PageData();
			        pd.put("userid", userid);
					pd.put("scid", scid);
			        pd.put("usc_createdate", sf.format(c.getTime()));
			        c.add(Calendar.DAY_OF_MONTH, 7);//在当前日期上加七天
			        pd.put("usc_enddate", sf.format(c.getTime()));
			        integralService.addUserSpeedCard(pd);
			        
			        //修改用户积分
			        pd = new PageData();
			        pd.put("userid", userid);
			        pd.put("user_integral", user_integral-sc_speedc_integral);
			        integralService.updateUserIntegral(pd);
			        
			        //在积分记录表中新增一条数据
			        pd = new PageData();
			        pd.put("userid", userid);
			        pd.put("ui_integral_type", 1);
			        pd.put("ui_integral_score", sc_speedc_integral);
			        integralService.addUserIntegralRecord(pd);
			        
					return new ResponseEntity<Map<String,Object>>().setState(Constants.SUCCESS).
							setData(map).setMsg("兑换成功");
				}else{
					return new ResponseEntity<Map<String,Object>>().setState(Constants.FAILED).
							setData(map).setMsg("您的等级不在兑换范围之内");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>().setState(Constants.ERROR).
					setData(map).setMsg("系统错误!");
		}
	}

}
