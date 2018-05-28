package com.biocor.service.interfaces.backShop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

/**
 * 
 * @author Administrator 查询用户相关数据主要是财务统计
 */
@Service
public class ShopUserservice {
	@Resource
	private DaoSupport dao;

	/* 查询店主提现记录 */
	public List<PageData> getsaleList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopUserMapper.getsaleList", pd);
	}

	// 商品销量排行情况
	public List<PageData> goodsSaleslist(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopUserMapper.goodsSaleslist", pd);
	}

	// 查询收入明细
	public List<PageData> getShopMOneyInfoList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopUserMapper.getShopMOneyInfoList", pd);
	}

	// 查询我的收入
	public PageData getShopMOneyInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopUserMapper.getShopMOneyInfo", pd);
	}

	// 查询 店铺我的报表
	public PageData getShopThereport(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopUserMapper.getShopThereport", pd);
	}

	// 预约订单总人数
	public int getpeopletotal(PageData pd2) throws Exception {
		return (int) dao.findForObject("backShopUserMapper.getpeopletotal", pd2);
	}

	// 查询餐位费类型的人数总数
	public int getshopusertoatl(PageData pd2) throws Exception {
		return (int) dao.findForObject("backShopUserMapper.getshopusertoatl", pd2);
	}

	// 查询店铺浏览次数
	public String geShopbrowseTotal(PageData pd2) throws Exception {
		return (String) dao.findForObject("backShopUserMapper.geShopbrowseTotal", pd2);
	}

	// 先判断用户是否是店主
	public int getISNOshopper(PageData pd) throws Exception {
		return (int) dao.findForObject("backShopUserMapper.getISNOshopper", pd);
	}

	// 查询店铺余额
	public double getShopCanwithdrawalMOney(PageData pd) throws Exception {
		return (double) dao.findForObject("backShopUserMapper.getShopCanwithdrawalMOney", pd);
	}

	// 设置用户的tag值注店主和电源的tag值不同 ，店员tag值一样
	public void SetTagvalueShopandUser(PageData pd) throws Exception {
		dao.update("backShopUserMapper.SetTagvalueShopandUser", pd);
	}

	// 店主设置系统通知
	public void setJPush(PageData pd) throws Exception {
		dao.update("backShopUserMapper.setJPush", pd);
	}

	// 查询该用户今日是否提交过
	public int getFeedback(PageData pd) throws Exception {
		return (int) dao.findForObject("backShopUserMapper.getFeedback", pd);
	}

	// 商户意见反馈
	public void addfeedback(PageData pd) throws Exception {
		dao.save("backShopUserMapper.addfeedback", pd);
	}

	// 查询我的消息列表
	public List<PageData> getshopMessagelistpage(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopUserMapper.getshopMessagelistpage", pd);
	}
	// 根据订单查询提现详情
	public PageData getwithdrawalInfo(PageData pd) throws Exception {
		return (PageData)dao.findForObject("backShopUserMapper.getwithdrawalInfo",pd);
	}

}
