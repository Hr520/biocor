package com.biocor.thread;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.biocor.service.interfaces.pay.Biocorservice;
import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.push.JPush;

public class TimerThread implements Runnable {

	Logger logger = Logger.getLogger(TimerThread.class);

	@Override
	public void run() {

		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/ApplicationContext.xml");
		final OrderPrizeService orderPrizeService = (OrderPrizeService) ac.getBean("orderPrizeService");
		final Biocorservice biocorservice = (Biocorservice) ac.getBean("biocorservice");  
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 23); // 控制时
		calendar.set(Calendar.MINUTE, 59); // 控制分
		calendar.set(Calendar.SECOND, 59); // 控制秒
		Date time = calendar.getTime(); // 得出执行任务的时间,此处为今天的23：59：59

		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				System.out.println("-------设定定时任务--------");
				try {
					// 获取奖金池中 每日发放订单率和增长率
					List<PageData> list = orderPrizeService.findPrizePool(new PageData());
					String grantRate = list.get(0).get("bp_distributable_men").toString();
					String rate = list.get(0).get("bp_increasing_rate").toString();

					logger.info("interface---TimerThread--定时任务---grantRate=" + grantRate + ",rate=" + rate);

					// 获取每日发放人数
					PageData pd = new PageData();
					pd = orderPrizeService.findDayGrantOrderInfoCount(pd);
					int total = Integer.parseInt(pd.get("num").toString());
					double allpeople = total * Double.parseDouble(grantRate);
					int num = 0;
					if( allpeople < 1 ){
						num =1;
					}else{
						String vt = new BigDecimal(allpeople).setScale(0, BigDecimal.ROUND_HALF_UP)+"";
						num = Integer.parseInt(vt);
					}
					
					pd = new PageData();
					pd.put("num", num);
					List<PageData> peoplelist = orderPrizeService.findDayGrantOrderInfo(pd);

					logger.info("interface---TimerThread--定时任务---num=" + num + ",size=" + peoplelist.size());

					double rt = Double.parseDouble(rate);
					for (PageData p : peoplelist) {
						String content = "";
						String order_no = p.get("us_oNO").toString();//订单ID
						String userid = p.get("us_userid").toString(); //用户ID
						
						double re = 0;
						double b = Double.parseDouble(p.get("us_rate").toString());
						if ( (b + rt) >= 1.00) {
							p.put("us_state", 1);
							p.put("rate", 1-b);
							re = 1-b;
							// 当进度为1的时候改状态为可领取
							orderPrizeService.updatepayratestate(p);
							content = "您的订单"+order_no+"的奖励进度由"+(b*100)+"%增长到100%,可以领取奖励了!";
						} else {
							p.put("rate", rt);// 每日增长率
							re = rt;
							content = "您的订单"+order_no+"的奖励进度由"+(b*100)+"%增长到"+((b + rt)*100)+"%!";
						}
						orderPrizeService.updateOrderRate(p);
						
						// 给用户推送订单付款消息  ,执行单推并插入数据库
						JPush.sendByAlias(content, userid);
						// 推送内容写入数据库中
						pd = new PageData();
						pd.put("um_userId", userid);
						pd.put("um_msg_type", 2);
						pd.put("um_orderId", "");
						pd.put("um_orderNO", order_no);
						pd.put("um_msgcontent", content);
						pd.put("u_tuistate", 0);
						pd.put("um_msgtitle", "订单通知");
						biocorservice.saveMessageByorder(pd);
						
						//新增奖励记录
						pd = new PageData();
						pd.put("user_id", userid);
						pd.put("order_no", order_no);
						pd.put("prize_lv", grantRate);
						pd.put("prize_jd", rt);
						pd.put("prize_add", re);
						pd.put("prize_allnum", total);
						pd.put("prize_num", num);
						pd.put("prize_time", DateUtil.getDay());
						pd.put("state", "1");
						pd.put("createtime", DateUtil.getTime());
						biocorservice.addPrizeLog(pd);
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}, time, 1000 * 60 * 60 * 24);// 这里设定将延时每天固定执行
	}

}
