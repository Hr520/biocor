package com.biocor.service.admin.good;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("goodService")
public class GoodService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询商品列表列表
	public List<PageData> findGoodlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("goodMapper.findGoodlistPage", page);
	}

	// 新增商品
	public void addGood(PageData pd) throws Exception {
		dao.save("goodMapper.addGood", pd);
	}

	// 根据ID查询商品详情
	public PageData findGoodBySid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("goodMapper.findGoodBySid", pd);
	}

	// 修改商品
	public void updateGood(PageData pd) throws Exception {
		dao.update("goodMapper.updateGood", pd);
	}

	// 删除注销商品
	public void deleteGood(PageData pd) throws Exception {
		dao.update("goodMapper.deleteGood", pd);
	}

	// 查询所有商品类型
	public List<PageData> findAllGoodType(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("goodMapper.findAllGoodType", pd);
	}

	// 通过用户ID查询店铺
	public PageData findShopByUserid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("goodMapper.findShopByUserid", pd);
	}

	// 查询新菜品列表审核
	public List<PageData> getallShopNewgoodslistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("goodMapper.getallShopNewgoodslistPage", page);
	}
}
