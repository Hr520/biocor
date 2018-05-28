package com.biocor.service.admin.recommend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("recommendService")
public class RecommendService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	//查询推荐列表
	public List<PageData> findRecommendlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("recommendMapper.findRecommendlistPage",page);
	}

	//查询推荐总数
	public PageData findRecommendCount(PageData pd) throws Exception {
		return (PageData) dao.findForObject("recommendMapper.findRecommendCount",pd);
	}
	
	
	//修改商品
	public void updateRecommend(PageData pd) throws Exception {
		dao.update("recommendMapper.updateRecommend", pd);
	}


}
