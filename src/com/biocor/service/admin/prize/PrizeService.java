package com.biocor.service.admin.prize;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("prizeService")
public class PrizeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//查询奖励列表列表
	public List<PageData> findPrizelistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("prizeMapper.findPrizelistPage",page);
	}
	//新增奖品
	public void addPrize(PageData pd) throws Exception {
		dao.save("prizeMapper.addPrize",pd);
	}
	//更新奖品
	public void updatePrize(PageData pd) throws Exception {
		dao.update("prizeMapper.updatePrize",pd);
	}
	//根据ID查询奖励详情
	public PageData findPrizeByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("prizeMapper.findPrizeByID",pd);
	}
	
	/*********************************奖金池**************************************/
	
	//查询奖金池列表列表
	public List<PageData> findPrizePoollistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("prizeMapper.findPrizePoollistPage",page);
	}
	//新增奖金池
	public void addPrizePool(PageData pd) throws Exception {
		dao.save("prizeMapper.addPrizePool",pd);
	}
	//更新奖金池
	public void updatePrizePool(PageData pd) throws Exception {
		dao.update("prizeMapper.updatePrizePool",pd);
	}
	//根据ID查询奖金池详情
	public PageData findPrizePoolByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("prizeMapper.findPrizePoolByID",pd);
	}
	
	
	
}
