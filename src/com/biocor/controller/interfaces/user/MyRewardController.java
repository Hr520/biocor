package com.biocor.controller.interfaces.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.service.interfaces.user.MyRewardService;
import com.biocor.service.interfaces.user.MyWalletService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

@Controller
@RequestMapping(value="interface/myReward")
public class MyRewardController {
	@Resource(name="myRewardService")
	private MyRewardService myRewardService;
	@Resource(name="myWalletService")
	private MyWalletService myWalletService;
	
	
	Logger logger = Logger.getLogger(MyRewardController.class);
	
	//我的奖励列表
	@RequestMapping(value="myRewardList")
	@ResponseBody
	public ResponseEntity<?> myRewardList(HttpServletRequest request){
		List<PageData> list = new ArrayList<>();
		PageData pd = new PageData();
		try {
			String userid = request.getParameter("userid");
			String curpage = request.getParameter("curpage");
			pd.put("userid", userid);
			pd.put("num", ( Integer.parseInt(curpage)-1 )*General.EVERYPAGE);
            pd.put("everypage", General.EVERYPAGE);
			list = myRewardService.myRewardList(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//去领奖
	@RequestMapping(value="receiveReward")
	@ResponseBody
	public ResponseEntity<?> receiveReward(HttpServletRequest request){
		PageData pd = new PageData();
		try {
			String ur_orderNo = request.getParameter("ur_orderNo");//订单id
			pd.put("ur_orderNo", ur_orderNo);
			//根据订单号查询增长率和奖励金额和用户id
			pd = myRewardService.getRateAndMoney(pd);
			String user_code = pd.getString("user_code");//用户手机号
			String us_state = pd.getString("us_state");
			float rate = (float) pd.get("us_rate");//进度
			float reward_money = (float) pd.get("ur_reward_money");//奖励金额
			int userid = (int) pd.get("ur_userId");//用户id
			pd.put("userid", userid);
			if (us_state.equals("2")) {
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("该奖励已经领取过了");
			}
			if (rate >= 1) {
				//查询奖金池中的总金额，最少金额，可分配金额，已分配金额，最小支配金额
				PageData pool = new PageData();
				pool = myRewardService.getPoolInfo();
				int bpid = (int) pool.get("bpid");
				float bp_money = (float) pool.get("bp_money");//总金额
				float bp_min_money = (float) pool.get("bp_min_money");//最少金额
				float bp_distributable = (float) pool.get("bp_distributable");//可分配金额
				float bp_allocated = (float) pool.get("bp_allocated");//已分配金额
				float bp_distributable_min = (float) pool.get("bp_distributable_min");//最小支配金额
				if ((bp_min_money+reward_money)<=bp_money) {
					bp_money = bp_money - reward_money;
					bp_allocated = bp_allocated + reward_money;
					if (bp_money<bp_distributable_min) {
						bp_distributable = bp_money - bp_min_money;
					}else{
						bp_distributable = bp_money - bp_distributable_min;
					}
					pd.put("bpid", bpid);
					pd.put("bp_money", bp_money);
					pd.put("bp_allocated", bp_allocated);
					pd.put("bp_distributable", bp_distributable);
					//修改奖金池中的数据
					int ucount = myRewardService.updatePoolInfo(pd);
					if(ucount>0){
						//查询用户余额
						Float user_money = myWalletService.getUserMoney(pd);//得到用户余额
						pd.put("user_money", reward_money + user_money);
						//去给用户余额中加入奖励的钱
						myRewardService.addRewardMoney(pd);
						//修改奖励表中的状态和兑换时间（zs_bk_user_rate表）
						pd.put("us_state", "2");
						myRewardService.updateExchangeState(pd);
						//在钱包记录表中加入一条数据
						pd.put("uw_money", reward_money);
						pd.put("uw_type", 5);
						myWalletService.withdrawApply(pd);
						String path = request.getContextPath();
						String basePath = request.getScheme() + "://"+ request.getServerName() + 
								":" + request.getServerPort()+ path + "/";
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						user_code = user_code.substring(0, 3)+"****"+user_code.substring(user_code.length()-4);
						String rurl = basePath+"upload/html/qlj-fx.html?ur_orderNo="+
								ur_orderNo+"&reward_money="+reward_money+"&createtime="+df.format(new Date())+"&user_code="+user_code+"&userid="+userid;
						pd.put("rurl", rurl);
						return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd).setMsg("领取成功");
					}else{
						return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("领取失败");
					}
				}else{
					return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("由于领取的人数过多，现在暂无法领取，请耐心等候");
				}
			}else{
				return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("进度未到达100%不能领奖");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<PageData>().setState(Constants.ERROR).setData(pd).setMsg(e.getMessage());
		}
	}
	//去加速
	@RequestMapping(value="goAccelerate")
	@ResponseBody
	public ResponseEntity<?> goAccelerate(HttpServletRequest request){
		PageData pd = new PageData();
		double us_rate = 0;
		try {
			String ur_orderNo = request.getParameter("ur_orderNo");//订单id
			
			String data = request.getParameter("data");
			logger.info("interface---goAccelerate--请求参数:ur_orderNo="+ur_orderNo+",data="+data);
			
			data = data.substring(0, data.length()-1);
			String[] str = data.split(",");
			int len = str.length;
			
			if( len > 2 ){
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("一个奖励最多使用2张加速卡");
			}
			
			//查询该奖励使用了几张加速卡
			pd = new PageData();
			pd.put("ur_orderNo", ur_orderNo);
			int user_count = myRewardService.getUserCount(pd);
			if ( (user_count + len )>2) {
				pd.put("user_count", user_count);
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("一个奖励最多使用2张加速卡，您已经使用了"+user_count+"张");
			}else{
				
				int a[] = new int[2];
				for (int i = 0; i < len; i++) {
					//加速卡ID
					String scid = str[i];
					//根据uscid查询加速卡的使用状态和率
					pd = myRewardService.getSpeedCardUseState(scid);
					if(pd != null){
						a[i] = Integer.parseInt(pd.get("sc_speedc_rate").toString());
					}
				}
				//排序 先使用的大加速卡
				if( len == 2){
					if( a[0] < a[1]){
						int temp = a[1];
						a[1] = a[0];
						a[0] = temp;
						
						String tem = str[1];
						str[1] = str[0];
						str[0] = tem;
					}
				}
				
				for( int i=0;i<len;i++){
					
					//加速卡ID
					String scid = str[i];
					double sidrate = (double)a[i]/100;
					
					//根据订单号查询增长率和奖励金额
					pd = new PageData();
					pd.put("ur_orderNo", ur_orderNo);
					pd = myRewardService.getRateAndMoney(pd);
					double rate = Double.parseDouble( pd.get("us_rate").toString() );
					if (rate >= 1) {
						return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("进度已达到100%，无需再使用加速卡");
					}else{
						us_rate = (rate + sidrate)>1?1:(rate + sidrate);
						//修改用户奖励进度
						pd = new PageData();
						pd.put("us_rate", us_rate);
						pd.put("ur_orderNo", ur_orderNo);
						if(us_rate>=1){
							pd.put("us_state", "1");
						}else{
							pd.put("us_state", "0");
						}
						myRewardService.updateRewardRate(pd);
						
						//修改加速卡使用状态
						pd = new PageData(); 
						pd.put("uscid", scid);
						pd.put("ur_orderNo", ur_orderNo);
						myRewardService.updateSpeedCardState(pd);
					}
				}
				
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("加速成功");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}
	}
	

}
