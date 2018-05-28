package com.biocor.service.admin.financial;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service
public class FinancialService {
	/**
	 * 财务管理类
	 */
	@Resource
	private DaoSupport dao;

	// 根据用户的id查询店铺id
	public String getshopid(PageData pd) throws Exception {
		return (String) dao.findForObject("financialMapper.getshopid", pd);
	}

	// 查询当前店铺下的统计数据
	public List<PageData> getShopallMOneyfinancialInfo(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("financialMapper.getshopallMoney", pd);
	}

	// 查询商户提现列表
	public List<PageData> getShopapplymoneylistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("financialMapper.getShopapplymoneylistPage", page);
	}

	// 根据店铺id查询到店铺的可以提现的总金额
	public PageData getShopCanmoneyapply(PageData pd) throws Exception {
		return (PageData) dao.findForObject("financialMapper.getShopCanmoneyapply", pd);
	}

	// 新增提现申请
	public void addapplyMoney(PageData pd) throws Exception {
		dao.save("financialMapper.addapplyMoney", pd);
	}

	// 先查询当前店铺下面的所有菜品
	public List<PageData> getShopByallGoodslistPage(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("financialMapper.getShopByallGoods", pd);
	}

	// 查询所有已经完成订单的菜品销量情况按时间查询
	public List<PageData> getOrderByshopallgoodBywithTime(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("financialMapper.getOrderByshopallgoodBywithTime", pd);
	}

	// 扣除用户的提现的金额
	public void updateSHopUserMOney(PageData pd) throws Exception {
		dao.update("financialMapper.updateSHopUserMOney", pd);
	}

	// 查询店铺下面的餐位费
	public PageData getShopBYcanfei(PageData pd) throws Exception {
		return (PageData) dao.findForObject("financialMapper.getShopBYcanfei", pd);
	}

}
