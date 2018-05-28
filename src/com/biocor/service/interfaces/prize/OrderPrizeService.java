package com.biocor.service.interfaces.prize;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("orderPrizeService")
public class OrderPrizeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 通过订单ID查询订单详情
	public PageData getOrderInfoByNo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.getOrderInfoByNo", pd);
	}

	// 抽奖调用存储过程
	public PageData getPrizeInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.getPrizeInfo", pd);
	}

	//订单是否能抽奖
	public PageData isOrderCanPrize(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.isOrderCanPrize", pd);
	}
	
	// 订单是否抽过奖
	public PageData isOrderPrize(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.isOrderPrize", pd);
	}

	// 判断是否领取过奖励
	public PageData isOwnOrderPrize(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.isOwnOrderPrize", pd);
	}

	/****************************************************************/

	// 获取2小时候的预约订单列表
	public List<PageData> getBespeakOrder(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("orderPrizeMapper.getBespeakOrder", pd);
	}

	// 更改预约订单状态
	public void updateBespeakOrder(PageData pd) throws Exception {
		dao.update("orderPrizeMapper.updateBespeakOrder", pd);
	}

	// 查询奖金池
	public List<PageData> findPrizePool(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("orderPrizeMapper.findPrizePool", pd);
	}

	// 查询每日发放的订单信息
	public PageData findDayGrantOrderInfoCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.findDayGrantOrderInfoCount", pd);
	}

	// 查询每日发放的订单信息
	public List<PageData> findDayGrantOrderInfo(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("orderPrizeMapper.findDayGrantOrderInfo", pd);
	}

	// 加速率新增
	public void updateOrderRate(PageData pd) throws Exception {
		dao.update("orderPrizeMapper.updateOrderRate", pd);
	}

	// 订单退订状态
	public PageData getOrderReturnInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("orderPrizeMapper.getOrderReturnInfo", pd);
	}

	// 当进度为1的时候改状态为可领取
	public void updatepayratestate(PageData pd) throws Exception {
		dao.update("orderPrizeMapper.updatepayratestate", pd);
	}
}
