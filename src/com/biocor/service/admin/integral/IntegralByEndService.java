package com.biocor.service.admin.integral;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.Page;
import com.biocor.util.PageData;

@Service("integralByEndService")
@Transactional
public class IntegralByEndService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//查询所有加速卡
	public List<PageData> getSpeedCardlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("integralByEndMapper.getSpeedCardlistPage", page);
	}

	//根据id查询加速卡信息
	public PageData getSpeedCardInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("integralByEndMapper.getSpeedCardInfo", pd);
	}

	//新增加速卡
	public void addSpeedCard(PageData pd) throws Exception {
		dao.save("integralByEndMapper.addSpeedCard", pd);
	}

	//修改加速卡
	public void editSpeedCard(PageData pd) throws Exception {
		dao.update("integralByEndMapper.editSpeedCard", pd);
	}

	//删除加速卡
	public void delSpeedCard(PageData pd) throws Exception {
		dao.update("integralByEndMapper.delSpeedCard", pd);
	}

}
