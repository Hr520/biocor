package com.biocor.service.admin.shop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("tradAreaService")
public class TradAreaService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//查询商圈列表
	public List<PageData> findTradArealistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("tradAreaMapper.findTradArealistPage", page);
	}
	
	//删除(注销)商圈
	public void delTradArea(PageData pd) throws Exception {
		dao.delete("tradAreaMapper.delTradArea", pd);
	}
	//添加商圈
	public void addTradArea(PageData pd) throws Exception {
		dao.save("tradAreaMapper.addTradArea", pd);
	}
	
	//查询所有省
	public List<PageData> findAllProvince(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("tradAreaMapper.findAllProvince", pd);
	}
	//通过省ID查询所有市
	public List<PageData> findAllCity(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("tradAreaMapper.findAllCity", pd);
	}
	//通过市ID查询所有区
	public List<PageData> findAllArea(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("tradAreaMapper.findAllArea", pd);
	}
	//通过区ID查询所有商业圈
	public List<PageData> findAllStreet(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("tradAreaMapper.findAllStreet", pd);
	}
	
}
