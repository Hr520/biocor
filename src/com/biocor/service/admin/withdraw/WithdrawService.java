package com.biocor.service.admin.withdraw;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("withdrawService")
public class WithdrawService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//查询提现申请列表列表
	public List<PageData> findWithDrawlistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("withdrawMapper.findWithDrawlistPage", page);
	}
	
	//更改提现申请状态
	public void updateWithDraw(PageData pd) throws Exception{
		dao.update("withdrawMapper.updateWithDraw", pd);
	}
	
	/*************************************************************/

	//查询提现申请列表列表
	public List<PageData> findWithDrawShoplistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("withdrawMapper.findWithDrawShoplistPage", page);
	}
	
	//更改提现申请状态
	public void updateWithDrawShop(PageData pd) throws Exception{
		dao.update("withdrawMapper.updateWithDrawShop", pd);
	}
}
