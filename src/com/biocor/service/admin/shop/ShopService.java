package com.biocor.service.admin.shop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("shopService")
public class ShopService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询店铺列表列表
	public List<PageData> findShoplistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("shopMapper.findShoplistPage", page);
	}

	// 新增店铺
	public void addShop(PageData pd) throws Exception {
		dao.save("shopMapper.addShop", pd);
	}

	// 根据ID查询店铺信息
	public PageData findShopBySid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("shopMapper.findShopBySid", pd);
	}

	// 修改店铺
	public void updateShop(PageData pd) throws Exception {
		dao.update("shopMapper.updateShop", pd);
	}

	// 删除注销店铺
	public void deleteShop(PageData pd) throws Exception {
		dao.update("shopMapper.deleteShop", pd);
	}

	// 推荐店铺
	public void commendShop(PageData pd) throws Exception {
		dao.update("shopMapper.commendShop", pd);
	}

	// 查询所有店铺类型
	public List<PageData> findAllShopType(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("shopMapper.findAllShopType", pd);
	}

	public List<PageData> findGoodslistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("shopMapper.findGoodslistPage", page);
	}

	// 通过系统用户ID查询店铺ID
	public PageData findShopByUserid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("shopMapper.findShopByUserid", pd);
	}

	// 更新店铺二维码
	public void updateShopCode(PageData pd) throws Exception {
		dao.update("shopMapper.updateShopCode", pd);
	}

	// 绑定到商户用户表中
	public void addShopAndUser(PageData pd) throws Exception {
		dao.save("shopMapper.addShopAndUser", pd);
	}

	// 查询店铺意见反馈
	public List<PageData> getShopUseropinionlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("shopMapper.getShopUseropinionlistPage", page);
	}
	// 删除店铺意见反馈
	public void delShopoption(PageData pd) throws Exception {
		dao.delete("shopMapper.delShopoption",pd);
	}

}
