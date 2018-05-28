package com.biocor.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.biocor.service.interfaces.prize.OrderPrizeService;
import com.biocor.thread.BespeakThread;
import com.biocor.thread.TimerThread;

public class MyListener implements ServletContextListener {

	Logger logger = Logger.getLogger(MyListener.class);

	@Autowired
	public static OrderPrizeService orderPrizeService;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {

		logger.info("-----定时任务:每日结算线程开始-----");
		new Thread(new TimerThread()).start();

		logger.info("-----预约提醒线程开始------");
		new Thread(new BespeakThread()).start();

	}

}
