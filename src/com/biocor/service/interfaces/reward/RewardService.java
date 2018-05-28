package com.biocor.service.interfaces.reward;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("rewardService")
@Transactional
public class RewardService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//查询排队发放的奖励列表
	public List<PageData> getUnissuedList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("rewardMapper.getUnissuedList", pd);
	}

	//查询已经发放的奖励列表
	public List<PageData> getGrantList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("rewardMapper.getGrantList", pd);
	}

	//根据订单号查询用户对该奖励使用的加速卡
	public List<PageData> getUsedSpeedCard(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("rewardMapper.getUsedSpeedCard", pd);
	}

}
