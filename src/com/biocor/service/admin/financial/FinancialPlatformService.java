package com.biocor.service.admin.financial;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("platformService")
public class FinancialPlatformService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//调用存储过程
	public PageData findPlatformFinancial(PageData pd) throws Exception {
		return (PageData)dao.findForObject("platformMapper.findPlatformFinancial", pd);
	}
	
	//查询所有的店铺
	public List<PageData> findAllShopList(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("platformMapper.findAllShopList", pd);
	}
	
	//统计平台(店铺)订单详情
	public PageData findPlatformOrderInfo(PageData pd) throws Exception {
		return (PageData)dao.findForObject("platformMapper.findPlatformOrderInfo", pd);
	}
	//统计平台(店铺)商品详情
	public List<PageData> findAllGoodlistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("platformMapper.findAllGoodlistPage", page);
	}
	
	//统计平台奖励发放
	public List<PageData> findPlatformPrizelistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("platformMapper.findPlatformPrizelistPage", page);
	}

}
