package com.biocor.service.interfaces.index;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("indexService")
public class IndexService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/***
	 * 根据当前坐标获取附近20家店铺
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findShopInfoList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList(
				"indexMapper.getLngAndLatNUMShopInfo", pd);
	}

	/***
	 * 中间广告信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public PageData findBannerC() throws Exception {
		return (PageData) dao.findForObject("indexMapper.findBannerC", null);

	}

	/***
	 * 查询商铺类型
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findShoptypeList() throws Exception {
		return (List<PageData>) dao.findForList("indexMapper.findShoptypeList",
				null);
	}

	/***
	 * 首页轮播图
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findBannerList() throws Exception {
		return (List<PageData>) dao.findForList("indexMapper.findBannerList",
				null);
	}

	/***
	 * 好吃，好玩列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findindexYummyAndAmusinglistPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList(
				"indexMapper.findindexYummyAndAmusinglistPage", page);
	}

	public List<PageData> findlistshoptype() throws Exception {
		return (List<PageData>) dao.findForList(
				"indexMapper.findlistshoptype", null);
	}

	public List<PageData> findCity_Allarea(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList(
				"indexMapper.findCity_Allarea", pd);
	}

	public List<PageData> findArea_Allstreet(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList(
				"indexMapper.findArea_Allstreet", pd);
	}

	public List<PageData> findListssearch(PageData pd) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<PageData> findnewShopInfoList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("indexMapper.findnewShopInfoList",
				pd);
	}

 

}
