package com.biocor.service.admin.print;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("printService")
public class PrintService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public PageData findPintInfo(String orderNo) throws Exception {
		return (PageData) dao.findForObject("printMapper.findPintInfo", orderNo);
	}

}
