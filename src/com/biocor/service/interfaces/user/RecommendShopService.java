package com.biocor.service.interfaces.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("recommendShopService")
@Transactional
public class RecommendShopService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//新增推荐餐厅
	public void addRecommendShop(PageData pd) throws Exception {
		dao.save("recommendShopMapper.addRecommendShop", pd);
	}

	//查询商店类型
	public List<PageData> getShopType() throws Exception {
		return (List<PageData>) dao.findForList("recommendShopMapper.getShopType", null);
	}

	//查询所有省
	public List<PageData> getProvince() throws Exception {
		return (List<PageData>) dao.findForList("recommendShopMapper.getProvince", null);
	}

	//查询所有市
	public List<PageData> getCity() throws Exception {
		return (List<PageData>) dao.findForList("recommendShopMapper.getCity", null);
	}

	//查询所有区
	public List<PageData> getArea() throws Exception {
		return (List<PageData>) dao.findForList("recommendShopMapper.getArea", null);
	}

}
