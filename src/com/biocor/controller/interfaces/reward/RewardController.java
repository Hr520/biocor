package com.biocor.controller.interfaces.reward;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.ls.LSInput;

import com.biocor.service.interfaces.reward.RewardService;
import com.biocor.service.interfaces.user.MyRewardService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;

@Controller
@RequestMapping(value="interface/reward")
public class RewardController {
	@Resource(name="rewardService")
	private RewardService rewardService;
	@Resource(name="myRewardService")
	private MyRewardService myRewardService;
	
	//查询排队发放的奖励列表
	@RequestMapping(value="getUnissuedList")
	@ResponseBody
	public ResponseEntity<?> getUnissuedList(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String curpage = request.getParameter("curpage");
			pd.put("num", (Integer.parseInt(curpage)-1)*General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			list = rewardService.getUnissuedList(pd);
			if(!list.isEmpty()&&list.size()>0){
				for (int i = 0; i < list.size(); i++) {
					String ur_shop_images = list.get(i).getString("ur_shop_images");
					if(ur_shop_images!=null && !ur_shop_images.equals("")){
						ur_shop_images = ur_shop_images.split(",")[0];
					}
					list.get(i).put("ur_shop_images", ur_shop_images);

					//查询该奖励使用了几张加速卡
					pd = new PageData();
					pd.put("ur_orderNo", list.get(i).get("ur_orderNo"));
					int user_count = myRewardService.getUserCount(pd);
					if( user_count >0 ){
						list.get(i).put("num", user_count);
					}else{
						list.get(i).put("num", 0);
					}
				}
			}
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//查询已经发放的奖励列表
	@RequestMapping(value="getGrantList")
	@ResponseBody
	public ResponseEntity<?> getGrantList(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String curpage = request.getParameter("curpage");
			pd.put("num", (Integer.parseInt(curpage)-1)*General.EVERYPAGE);
			pd.put("everypage", General.EVERYPAGE);
			list = rewardService.getGrantList(pd);
			if (!list.isEmpty() && list.size()>0) {
				for (int i = 0; i < list.size(); i++) {
					String ur_shop_images = list.get(i).getString("ur_shop_images");
					if (ur_shop_images!=null && !ur_shop_images.equals("")) {
						ur_shop_images = ur_shop_images.split(",")[0];
					}
					list.get(i).put("ur_shop_images", ur_shop_images);
					
					//查询该奖励使用了几张加速卡
					pd = new PageData();
					pd.put("ur_orderNo", list.get(i).get("ur_orderNo"));
					int user_count = myRewardService.getUserCount(pd);
					if( user_count >0 ){
						list.get(i).put("num", user_count);
					}else{
						list.get(i).put("num", 0);
					}
				}
			}
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}
	//查询该奖励使用的加速卡
	@RequestMapping(value="getUsedSpeedCard")
	@ResponseBody
	public ResponseEntity<?> getUsedSpeedCard(HttpServletRequest request){
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			String ur_orderNo = request.getParameter("ur_orderNo");
			pd.put("ur_orderNo", ur_orderNo);
			//根据订单号查询用户对该奖励使用的加速卡
			list = rewardService.getUsedSpeedCard(pd);
			return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("获取数据成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<PageData>>().setState(Constants.ERROR).setData(list).setMsg(e.getMessage());
		}
	}

}
