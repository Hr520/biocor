package com.biocor.service.admin.banner;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.entity.bannerM.BannerM;
import com.biocor.entity.bannerM.BannerMD;
import com.biocor.entity.bannerM.BannerMDG;
import com.biocor.util.PageData;

@Service("bannerService")
public class BannerService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	//查询广告列表
	public List<PageData> findBannerlistPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("bannerMapper.findBannerlistPage", page);
	}
	
	//新增banner
	public void addBanner(PageData pd) throws Exception {
		dao.save("bannerMapper.addBanner", pd);
	}
    //删除广告
    public void delBanner(PageData pd) throws Exception {
		dao.delete("bannerMapper.delBanner", pd);
	}
 
    @Transactional(rollbackFor=Exception.class)
	public void savem(PageData pd) throws Exception {
		dao.save("bannerMapper.savem", pd);
		
	}
    @Transactional(rollbackFor=Exception.class)
	public void savemd(PageData pd)throws Exception {
		dao.save("bannerMapper.savemd", pd);
		
	}

 
	public List<BannerM> findBannerm(PageData pd) throws Exception {
		List<BannerM> bmlist= (List<BannerM>) dao.findForList("bannerMapper.findBannerm", pd);
		 for (BannerM bannerM : bmlist) {
			  String type=bannerM.getM_type();
			  Integer order=bannerM.getM_order();
			  List<BannerMD> bmdlist=null;
			  List<BannerMDG> bmdglist=null;
			  String  m_no=bannerM.getM_No();
			  switch (type) {
				case "1":
					//查询店铺
	                 
	                 if(order==1){
	                	 bmdlist=(List<BannerMD>) dao.findForList("bannerMapper.findBannermds", m_no);
		                 bannerM.setBmdList(bmdlist);
	                 }else{
	                	 bmdlist=(List<BannerMD>) dao.findForList("bannerMapper.findBannermdsOrder", m_no);
		                 bannerM.setBmdList(bmdlist);
		                 for (BannerMD bannerMD : bmdlist) {
		                	 int sid=bannerMD.getSid();
		                	 bmdglist=(List<BannerMDG>) dao.findForList("bannerMapper.findBannermdg",sid);
		                	 bannerMD.setListmdg(bmdglist);
						 }
	                 }
					break;
				case "0":
					//查询店铺
					bmdlist=(List<BannerMD>) dao.findForList("bannerMapper.findBannermdgS", m_no);
					bannerM.setBmdList(bmdlist);
					break;
				}
		}
		return bmlist;
	}

	@Transactional(rollbackFor=Exception.class)
	public void updatem(PageData pd) throws Exception {
		dao.update("bannerMapper.updatem", pd);
		
	}

	@Transactional(rollbackFor=Exception.class)
	public void delmd(PageData pd) throws Exception {
		dao.delete("bannerMapper.delmd", pd);
		
	}

	public PageData findGoodBygid(PageData pd) throws Exception {
	    return (PageData) dao.findForObject("bannerMapper.findGoodBygid", pd);
	}
 
    
    //获取模板列表
    public List<PageData> findAllModel(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("bannerMapper.findAllModel", pd);
	}
    
 
}
