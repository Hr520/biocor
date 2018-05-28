package com.biocor.service.interfaces.pay;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service
public class Biocorservice {
	@Resource
	private DaoSupport daoSupport;

	// 判断该订单是否已经支付
	public Integer getorderpayIsOrNo(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("BiocorpayMapper.getorderpayIsOrNo", pd);
	}

	// 订单支付方式选择
	public void updatePaytype(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updatePaytype", pd);
	}

	// 查询该订单是否存在
	public Integer findOrderByorderAndUser(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("BiocorpayMapper.findOrderByorderAndUser", pd);
	}

	// 查询用户的余额
	public double getUsermoney(PageData pd) throws Exception {
		return (double) daoSupport.findForObject("BiocorpayMapper.getUsermoney", pd);
	}

	// 更新用户余额
	public void updateUserYumoney(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updateUserYumoney", pd);
	}

	// 修改订单状态
	public void updateOrderpayState(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updateOrderpayState", pd);
	}

	// 添加余额消费记录
	public void insertwithdraw(PageData pd) throws Exception {
		daoSupport.save("BiocorpayMapper.insertwithdraw", pd);
	}

	// 支付成功修改订单状态
	public void payUpdateOrderState(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.payUpdateOrderState", pd);
	}

	// 根据订单号码查询用户的id
	public String getuseridbyOrderNO(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("BiocorpayMapper.getuseridbyOrderNO", pd);
	}

	// 阿里支付成功向用户推送一条消息
	public void saveMessageByorder(PageData pd) throws Exception {
		daoSupport.save("BiocorpayMapper.saveMessageByorder", pd);
	}

	// 查询订单主键
	public PageData getorderId(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("BiocorpayMapper.getorderId", pd);
	}

	// 查询用户信息
	public String getUserInfo(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("BiocorpayMapper.getUserInfo", pd);
	}

	// 余额支付成功向奖励表预添加奖励进度25%
	public void insertuserRate(PageData pd) throws Exception {
		daoSupport.save("BiocorpayMapper.insertuserRate", pd);
	}

	// 查询用户的id和用户手机号码
	public PageData getUserIDandmoble(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("BiocorpayMapper.getUserIDandmoble", pd);
	}

	// 查询奖金池各个金额
	public PageData getprizepoolinfo() throws Exception {
		return (PageData) daoSupport.findForObject("BiocorpayMapper.getprizepoolinfo", new PageData());
	}

	// 更新奖金池金额
	public void updateprizepool(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updateprizepool", pd);
	}

	// 奖金池金额更新
	public void updateBonuspools(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updateBonuspools", pd);
	}

	// 查询用户的支付密码
	public String getUserpaypwd(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("BiocorpayMapper.getUserpaypwd", pd);
	}

	
	/*****************************************************************/
	//根据ID查询订单信息
	public PageData getOrderInfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("BiocorpayMapper.getOrderInfo", pd);
	}
	
	
	
	/***************************************************************/
	//商户账单计算
	public void updateShopMoney(PageData pd) throws Exception {
		daoSupport.update("BiocorpayMapper.updateShopMoney", pd);
	}
	
	//插入发放记录
	public void addPrizeLog(PageData pd) throws Exception {
		daoSupport.save("BiocorpayMapper.addPrizeLog", pd);
	}
	//根据订单查询tag值
	public String getShoptag_name(PageData pdr) throws Exception {
		return (String)daoSupport.findForObject("BiocorpayMapper.getShoptag_name",pdr);
	}
}
