package com.biocor.thread;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.biocor.service.interfaces.pay.Biocorservice;
import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.util.PageData;
import com.biocor.util.alipay.util.UtilDate;
import com.biocor.util.push.JPush;



public class BespeakThread  implements Runnable{

	Logger logger = Logger.getLogger(BespeakThread.class);
	
	@Override
	public void run() {
			
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:spring/ApplicationContext.xml");
		OrderPrizeService orderPrizeService = (OrderPrizeService) ac.getBean("orderPrizeService");
		Biocorservice biocorservice = (Biocorservice) ac.getBean("biocorservice");     
		
		while (true) {
			try {
				List<PageData> list = orderPrizeService.getBespeakOrder(new PageData());

				logger.info("interface-----BespeakThread----预约提醒---size="+ list.size());

				for (int i = 0; i < list.size(); i++) {
					PageData p = list.get(i);
					String order_no = p.get("ub_order_no").toString();
					String userid = p.get("ub_userId").toString();
					String ubid = p.get("ubid").toString();

					// 给用户推送订单付款消息
					String content = "您的预约订单" + order_no + "预约的就餐时间快到了，请合理安排时间。";
					// 执行单推并插入数据库
					JPush.sendByAlias(content, userid);
					// 推送内容写入数据库中
					PageData pd = new PageData();
					pd.put("um_userId", userid);
					pd.put("um_msg_type", 3);
					pd.put("um_orderId", "");
					pd.put("um_orderNO", order_no);
					pd.put("um_msgcontent", content);
					pd.put("u_tuistate", 0);
					pd.put("um_msgtitle", "预约提醒");
					biocorservice.saveMessageByorder(pd);

					// 更改预约提醒状态
					pd = new PageData();
					pd.put("ubid", ubid);
					orderPrizeService.updateBespeakOrder(pd);
				}

				// 睡眠20分钟
				Thread.sleep(20 * 60 * 1000L);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
}
