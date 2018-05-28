package com.biocor.service.interfaces.notice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service
public class NoticeService {

	@Resource
	private DaoSupport daoSupport;

	// 查询用户的消息列表接口
	public List<PageData> getUserMsglist(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("MessageMapper.getUserMsglist", pd);
	}

	// 商铺加盟
	public void shopAdd(PageData pd) throws Exception {
		daoSupport.save("MessageMapper.shopAdd", pd);
	}
//	判断用户是否已经提交过
	public int getShopIsapply(PageData pd) throws Exception {
		return (int)daoSupport.findForObject("MessageMapper.getShopIsapply",pd);
	}

	// 店铺加盟列表
	public List<PageData> getsharelistPage(Page page) throws Exception {
		return (List<PageData>)daoSupport.findForList("MessageMapper.getsharelistPage",page);
	}

}
