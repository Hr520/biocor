package com.biocor.service.admin.good;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;


@Service("goodTypeService")
public class GoodTypeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//店铺类型列表
	public List<PageData> findGoodTypelistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("goodTypeMapper.findGoodTypelistPage", page);
	}
	//添加店铺类型
	public void addGoodType(PageData pd) throws Exception{
		dao.save("goodTypeMapper.addGoodType", pd);
	}
	//删除店铺类型
	public void delGoodType(PageData pd) throws Exception{
		dao.delete("goodTypeMapper.delGoodType", pd);
	}
}
