package com.biocor.service.admin.message;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service
public class Messageservice {
	@Resource
	private DaoSupport daoSupport;

	// 查询系统消息列表
	public List<PageData> geteMessageList(Page page) throws Exception {
		return (List<PageData>) daoSupport.findForList("MessageMapper.geteMessagelistPage", page);
	}

	// 删除推送消息
	public void deleteMessage(PageData pd) throws Exception {
		daoSupport.delete("MessageMapper.deleteMessage", pd);
	}

	// admin添加系统消息
	public void addMessage(PageData pd) throws Exception {
		daoSupport.save("MessageMapper.addMessage", pd);
	}

	// 修改推送消息状态
	public void updateMessagestate(PageData pd) throws Exception {
		daoSupport.update("MessageMapper.updateMessagestate", pd);
	}

	// 删除加盟商信息
	public void deleteshare(PageData pd) throws Exception {
		daoSupport.delete("MessageMapper.deleteshare", pd);
	}

	// 商户端系统消息查询列表
	public List<PageData> getshanmeibackMessageList(Page page) throws Exception {
		return (List<PageData>) daoSupport.findForList("MessageMapper.getshanmeibackMessagelistPage", page);
	}
	// 新增推送消息
	public void backaddMessage(PageData pd) throws Exception {
		daoSupport.save("MessageMapper.backaddMessage",pd);
	}
	// 删除推送消息
	public void shopdeleteMessage(PageData pd) throws Exception {
		daoSupport.delete("MessageMapper.shopdeleteMessage",pd);
	}
//商户端系统消息推送
	public void updatebackMessagestate(PageData pd) throws Exception {
		daoSupport.update("MessageMapper.updatebackMessagestate",pd);
	}

}
