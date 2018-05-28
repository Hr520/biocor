package com.biocor.service.interfaces.ShopAndOrderService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service
public class Createservice {
	@Resource
	private DaoSupport daoSupport;

	// 查询订单小票
	public List<PageData> getpaypdf(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("", pd);
	}

}
