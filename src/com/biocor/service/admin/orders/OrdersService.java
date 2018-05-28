package com.biocor.service.admin.orders;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("ordersService")
public class OrdersService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询订单列表列表
	public List<PageData> findOrderslistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ordersMapper.findOrderslistPage", page);
	}

	// 更改订单状态
	public void updateOrdersState(PageData pd) throws Exception {
		dao.update("ordersMapper.updateOrdersState", pd);
	}

	// 通过订单ID查询订单详情
	public PageData findOrdersInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ordersMapper.findOrdersInfo", pd);
	}

	// 查询订单所有商品
	public List<PageData> findOrdersGoods(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("ordersMapper.findOrdersGoods", pd);
	}

	/******************************************* 订单回退 ****************************************/

	// 查询订单回退列表列表
	public List<PageData> findOrderBacklistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ordersMapper.findOrderBacklistPage", page);
	}

	// 根据退订ID查询退订订单详情
	public PageData findOrdersReturnInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ordersMapper.findOrdersReturnInfo", pd);
	}

	// 更新订单状态
	public void updateOrderState(PageData pd) throws Exception {
		dao.update("ordersMapper.updateOrderState", pd);
	}

	// 更新用户余额
	public void updateUserMoney(PageData pd) throws Exception {
		dao.update("ordersMapper.updateUserMoney", pd);
	}

	// 退款申请专题修改
	public void updateReturnState(PageData pd) throws Exception {
		dao.update("ordersMapper.updateReturnState", pd);
	}

	// 奖金池金额减少
	public void updatePrizePool(PageData pd) throws Exception {
		dao.update("ordersMapper.updatePrizePool", pd);
	}

	// 根据订单id查询订单金额
	public PageData getOrder_money(PageData pd) throws Exception {
		return (PageData) dao.findForObject("ordersMapper.getOrder_money", pd);
	}
	// 取消订单成功后写入用户金额明细记录表
	public void insertuserwithdraw_info(PageData pd) throws Exception {
		dao.save("ordersMapper.insertuserwithdraw_info",pd);
	}
	// 根据的id查询出订单相关的数据
	public PageData getOrderMoneyAndscoreInfo(PageData pd) throws Exception {
		return (PageData)dao.findForObject("ordersMapper.getOrderMoneyAndscoreInfo",pd);
	}

}
