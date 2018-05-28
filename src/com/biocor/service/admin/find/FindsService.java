package com.biocor.service.admin.find;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("findsService")
public class FindsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	//查询美食资讯列表
	public List<PageData> getFoodInformationlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("findsMapper.getFoodInformationlistPage", page);
	}

	//根据id查询美食资讯详情
	public PageData getInformationById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("findsMapper.getInformationById", pd);
	}

	//新增美食资讯
	public void addFoodInformation(PageData pd) throws Exception {
		dao.save("findsMapper.addFoodInformation", pd);
	}

	//修改美食资讯
	public void editFoodInformation(PageData pd) throws Exception {
		dao.update("findsMapper.editFoodInformation", pd);
	}

	//删除美食资讯
	public void delFoodInformation(PageData pd) throws Exception {
		dao.delete("findsMapper.delFoodInformation", pd);
	}
	
}
