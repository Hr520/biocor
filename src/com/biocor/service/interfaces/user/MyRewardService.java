package com.biocor.service.interfaces.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("myRewardService")
@Transactional
public class MyRewardService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//查询我的奖励列表
	public List<PageData> myRewardList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("myRewardMapper.myRewardList", pd);
	}

	//根据订单号查询增长率和奖励金额和用户id
	public PageData getRateAndMoney(PageData pd) throws Exception {
		return (PageData) dao.findForObject("myRewardMapper.getRateAndMoney", pd);
	}

	//去给用户余额中加入奖励的钱
	public void addRewardMoney(PageData pd) throws Exception {
		dao.update("myRewardMapper.addRewardMoney", pd);
	}

	//修改奖励表中的状态
	public void updateExchangeState(PageData pd) throws Exception {
		dao.update("myRewardMapper.updateExchangeState", pd);
	}

	//修改用户奖励进度
	public void updateRewardRate(PageData pd) throws Exception {
		dao.update("myRewardMapper.updateRewardRate", pd);
	}

	//修改加速卡使用状态
	public void updateSpeedCardState(PageData pd) throws Exception {
		dao.update("myRewardMapper.updateSpeedCardState", pd);
	}

	//查询奖金池中的总金额，最少金额，可分配金额，已分配金额，最小支配金额
	public PageData getPoolInfo() throws Exception {
		return (PageData) dao.findForObject("myRewardMapper.getPoolInfo", null);
	}

	//修改奖金池中的数据
	public int updatePoolInfo(PageData pd) throws Exception {
		return (int) dao.update("myRewardMapper.updatePoolInfo", pd);
	}

	//查询该奖励使用加速卡的数量
	public int getUserCount(PageData pd) throws Exception {
		return (int) dao.findForObject("myRewardMapper.getUserCount", pd);
	}

	//查询加速卡的使用状态
	public PageData getSpeedCardUseState(String uscid) throws Exception {
		return (PageData) dao.findForObject("myRewardMapper.getSpeedCardUseState", uscid);
	}

}
