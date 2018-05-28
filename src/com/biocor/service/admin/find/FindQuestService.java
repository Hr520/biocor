package com.biocor.service.admin.find;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("findQuestService")
public class FindQuestService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//获取题目列表
	public List<PageData> getQuestlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("findQuestMapper.getQuestlistPage", page);
	}
	//添加问题
	public void addQuest(PageData pd) throws Exception {
		dao.save("findQuestMapper.addQuest", pd);
	}
	//删除问题
	public void deleteQuest(PageData pd) throws Exception {
		dao.delete("findQuestMapper.deleteQuest", pd);
	}
	
	//获取问题答案列表
	public List<PageData> getQuestAnswerlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("findQuestMapper.getQuestAnswerlistPage", page);
	}	
	//添加问题答案
	public void addQuestAnswer(PageData pd) throws Exception {
		dao.save("findQuestMapper.addQuestAnswer", pd);
	}
	//删除问题答案
	public void deleteQuestAnswer(PageData pd) throws Exception {
		dao.delete("findQuestMapper.deleteQuestAnswer", pd);
	}
	//删除问题的所有答案
	public void deleteQuestAllAnswer(PageData pd) throws Exception {
		dao.delete("findQuestMapper.deleteQuestAllAnswer", pd);
	}
}
