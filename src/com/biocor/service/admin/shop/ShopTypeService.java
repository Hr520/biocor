package com.biocor.service.admin.shop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("shopTypeService")
public class ShopTypeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//店铺类型列表
	public List<PageData> findShopTypelistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("shopTypeMapper.findShopTypelistPage", page);
	}
	//添加店铺类型
	public void addShopType(PageData pd) throws Exception{
		dao.save("shopTypeMapper.addShopType", pd);
	}
	//删除店铺类型
	public void delShopType(PageData pd) throws Exception{
		dao.delete("shopTypeMapper.delShopType", pd);
	}
}
