package com.biocor.service.admin.apply;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("applyService")
public class ApplyService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//查询餐厅推荐列表
	public List<PageData> findApplylistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("applyMapper.findApplylistPage", page);
	}
	
	//更新状态
	public void updateApplyState(PageData pd) throws Exception {
		dao.findForList("applyMapper.updateApplyState", pd);
	}
}
