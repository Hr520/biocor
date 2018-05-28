package com.biocor.service.interfaces.user;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("integralService")
@Transactional
public class IntegralService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询用户积分
	public int myIntegral(PageData pd) throws Exception {
		return (int) dao.findForObject("integralMapper.myIntegral", pd);
	}

	// 查询用户等级积分
	public int myGradeIntegral(PageData pd) throws Exception {
		return (int) dao.findForObject("integralMapper.myGradeIntegral", pd);
	}

	// 查询用户积分获得消费记录
	public List<PageData> getIntegralRecord(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("integralMapper.getIntegralRecord", pd);
	}

	// 查询积分商场加速卡列表
	public List<PageData> integralShop(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("integralMapper.integralShop", pd);
	}

	// 查询用户未使用的加速卡
	public List<PageData> myUnusedSpeedCard(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("integralMapper.myUnusedSpeedCard", pd);
	}

	// 查询用户已使用的加速卡
	public List<PageData> myUsedSpeedCard(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("integralMapper.myUsedSpeedCard", pd);
	}

	// 根据积分卡id查询加速卡详情
	public PageData getSpeedCardInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("integralMapper.getSpeedCardInfo", pd);
	}

	// 添加用户加速卡
	public void addUserSpeedCard(PageData pd) throws Exception {
		dao.save("integralMapper.addUserSpeedCard", pd);
	}

	// 修改用户积分
	public void updateUserIntegral(PageData pd) throws Exception {
		dao.update("integralMapper.updateUserIntegral", pd);
	}

	// 在积分记录表中新增一条数据
	public void addUserIntegralRecord(PageData pd) throws Exception {
		dao.save("integralMapper.addUserIntegralRecord", pd);
	}

	// 查询用户等级积分和用户注册时间
	public PageData MyGradeAndRegisterTime(PageData pd) throws Exception {
		return (PageData) dao.findForObject("integralMapper.MyGradeAndRegisterTime", pd);
	}

	// 查询用户的成长值
	public int getUsergrade_integral(PageData pd) throws Exception {
		return (int) dao.findForObject("integralMapper.getUsergrade_integral", pd);
	}

}
