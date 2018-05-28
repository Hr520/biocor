package com.biocor.service.admin.appuser;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("appuserService")
public class AppUserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询app用户列表
	public List<PageData> findAppUserlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("appuserMapper.findAppUserlistPage", page);
	}

	// 根据用户id查询到店铺id
	public String getSHop_id(PageData pd) throws Exception {
		return (String) dao.findForObject("appuserMapper.getSHop_id", pd);
	}

	// 店铺id查询到店员列表
	public List<PageData> getShoAllUser(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("appuserMapper.getShoAllUser", pd);
	}
	//新增店员
	public void addShopUser(PageData pd) throws Exception {
		dao.save("appuserMapper.addShopUser",pd);
	}
	// 执行删除店员操作假删除
	public void deleteUser(PageData pd) throws Exception {
		dao.update("appuserMapper.deleteUser", pd);
	}

	//
}
