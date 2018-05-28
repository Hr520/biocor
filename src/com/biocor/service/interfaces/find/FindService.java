package com.biocor.service.interfaces.find;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("findService")
@Transactional
public class FindService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//查询美食资讯列表
	public List<PageData> getFoodInfoList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("findMapper.getFoodInfoList", pd);
	}

	//查询咨询详情
	public PageData informationDetails(PageData pd) throws Exception {
		return (PageData) dao.findForObject("findMapper.informationDetails", pd);
	}

	//查询健康测试问题总条数
	public int getQuestionCount() throws Exception {
		return (int) dao.findForObject("findMapper.getQuestionCount", null);
	}

	//查询问题列表
	public List<PageData> getQuestionList() throws Exception {
		return (List<PageData>) dao.findForList("findMapper.getQuestionList", null);
	}

	//查询答案列表
	public List<PageData> getAnswerList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("findMapper.getAnswerList", pd);
	}

	//查询所有菜品
	public List<PageData> getAllFood() throws Exception {
		return (List<PageData>) dao.findForList("findMapper.getAllFood", null);
	}

	//新增用户测试结果
	public void addUserQuestionTest(PageData pd) throws Exception {
		dao.save("findMapper.addUserQuestionTest", pd);
	}

}
