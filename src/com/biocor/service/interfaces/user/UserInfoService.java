package com.biocor.service.interfaces.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;
import com.fusioncharts.exporter.generators.PDFGenerator;

@Service("userInfoService")
@Transactional
public class UserInfoService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// 查询用户详情
	public PageData getUserInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("userInfoMapper.getUserInfo", pd);
	}

	// 修改用户头像
	public void updateUserHeadImage(PageData pd) throws Exception {
		dao.update("userInfoMapper.updateUserHeadImage", pd);
	}

	// 修改用户信息
	public void updateUserInfo(PageData pd) throws Exception {
		dao.update("userInfoMapper.updateUserInfo", pd);
	}

	// 更换手机号码
	public void replacePhone(PageData pd) throws Exception {
		dao.update("userInfoMapper.replacePhone", pd);
	}

	// 实名认证
	public void realNameAuthentication(PageData pd) throws Exception {
		dao.save("userInfoMapper.realNameAuthentication", pd);
	}

	// 查询推广记录
	public List<PageData> promotionRecord(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("userInfoMapper.promotionRecord", pd);
	}

	// 我的关注
	public List<PageData> myFollowList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("userInfoMapper.myFollowList", pd);
	}

	// 我的消息
	public List<PageData> myMessage(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("userInfoMapper.myMessage", pd);
	}

	// 根据用户id查询用户二维码
	public String getUserQrcode(PageData pd) throws Exception {
		return (String) dao.findForObject("userInfoMapper.getUserQrcode", pd);
	}

	// 会员等级详情
	public PageData getMemberGradeInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("userInfoMapper.getMemberGradeInfo", pd);
	}

	// 查找新版本
	public List<PageData> findVersion(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("userInfoMapper.findVersion", pd);
	}

	// 查询系统推送消息条数
	public Integer getmessagecountA() throws Exception {
		return (Integer) dao.findForObject("userInfoMapper.getmessagecountA", new PageData());
	}

	// 查询用户接收的推送消息
	public Integer getmessagecountB(PageData pd) throws Exception {
		return (Integer) dao.findForObject("userInfoMapper.getmessagecountB", pd);
	}

	// 根据等级查询等级结束的积分
	public int getGradeEndIntegral(PageData pd) throws Exception {
		return (int) dao.findForObject("userInfoMapper.getGradeEndIntegral", pd);
	}

	public String getUserPhone(PageData pd) throws Exception {
		return (String) dao.findForObject("userInfoMapper.getUserPhone", pd);
	}
//根据用户成长值查询用户等级
	public int getUserLevel(PageData pd) throws Exception {
		return (int)dao.findForObject("userInfoMapper.getUserLevel",pd);
	}

}
