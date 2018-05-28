package com.biocor.service.interfaces.login;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("loginService")
@Transactional
public class LoginService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//判断是否有给用户发送验证码
	@Transactional(rollbackFor=Exception.class)
	public int hasUser(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.hasUser", pd);
	}

	//更新用户验证码
	@Transactional(rollbackFor=Exception.class)
	public void updateVerifyCode(PageData pd) throws Exception {
		dao.update("loginMapper.updateVerifyCode", pd);
	}

	//添加用户
	@Transactional(rollbackFor=Exception.class)
	public void addUser(PageData pd) throws Exception {
		dao.save("loginMapper.addUser", pd);
	}

	//根据用户名得到用户id
	@Transactional(rollbackFor=Exception.class)
	public int getUserIdByUserCode(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.getUserIdByUserCode", pd);
	}
	
//	判定用户是否注册根据用户名得到用户id
	@Transactional(rollbackFor=Exception.class)
	public int getUserRegCode(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.getUserRegCode", pd);
	}

	//更新用户二维码
	@Transactional(rollbackFor=Exception.class)
	public void updateUserQcode(PageData pd) throws Exception {
		dao.update("loginMapper.updateUserQcode", pd);
	}

	//判断邀请码是否存在
	@Transactional(rollbackFor=Exception.class)
	public int hasInviteCode(String user_invite_code) throws Exception {
		return (int) dao.findForObject("loginMapper.hasInviteCode", user_invite_code);
	}

	//获取用户验证码
	@Transactional(rollbackFor=Exception.class)
	public String getVerifyCode(PageData pd) throws Exception {
		return (String) dao.findForObject("loginMapper.getVerifyCode", pd);
	}

	//修改用户密码
	@Transactional(rollbackFor=Exception.class)
	public void updateUser(PageData pd) throws Exception {
		dao.update("loginMapper.updateUser", pd);
	}

	//用户登录
	@Transactional(rollbackFor=Exception.class)
	public PageData userLogin(PageData pd) throws Exception {
		return (PageData) dao.findForObject("loginMapper.userLogin", pd);
	}

	//更新登录时间
	@Transactional(rollbackFor=Exception.class)
	public void updateLoginTime(PageData pd) throws Exception {
		dao.update("loginMapper.updateLoginTime", pd);
	}

	//查询用户有没有用qq登陆过
	@Transactional(rollbackFor=Exception.class)
	public int hasQqLogin(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.hasQqLogin", pd);
	}

	//添加qq登录用户
	@Transactional(rollbackFor=Exception.class)
	public void addUserByQq(PageData pd) throws Exception {
		dao.save("loginMapper.addUserByQq", pd);
	}

	//根据qq号查询用户信息
	@Transactional(rollbackFor=Exception.class)
	public Map<String, Object> getUserInfoByQq(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("loginMapper.getUserInfoByQq", pd);
	}
	
	//查询有没有该微信登录过
	@Transactional(rollbackFor=Exception.class)
	public int hasWxLogin(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.hasWxLogin", pd);
	}

	//添加微信登录用户
	@Transactional(rollbackFor=Exception.class)
	public void addUserByWx(PageData pd) throws Exception {
		dao.save("loginMapper.addUserByWx", pd);
	}

	//根据微信查询用户信息
	@Transactional(rollbackFor=Exception.class)
	public Map<String, Object> getUserInfoByWx(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("loginMapper.getUserInfoByWx", pd);
	}
	
	//查询有没有该微博登录过
	@Transactional(rollbackFor=Exception.class)
	public int hasWbLogin(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.hasWbLogin", pd);
	}

	//添加微博登录用户
	@Transactional(rollbackFor=Exception.class)
	public void addUserByWb(PageData pd) throws Exception {
		dao.save("loginMapper.addUserByWb", pd);
	}

	//根据微博查询用户信息
	@Transactional(rollbackFor=Exception.class)
	public Map<String, Object> getUserInfoByWb(PageData pd) throws Exception {
		return (Map<String, Object>) dao.findForObject("loginMapper.getUserInfoByWb", pd);
	}

	//绑定用户手机号
	@Transactional(rollbackFor=Exception.class)
	public void updateUserCode(PageData pd) throws Exception {
		dao.update("loginMapper.updateUserCode", pd);
	}

	//根据userid修改用户验证码
	@Transactional(rollbackFor=Exception.class)
	public void updateVerifyCodeById(PageData pd) throws Exception {
		dao.update("loginMapper.updateVerifyCodeById", pd);
	}

	//根据userid获取用户验证码
	@Transactional(rollbackFor=Exception.class)
	public String getVerifyCodeByUserid(PageData pd) throws Exception {
		return (String) dao.findForObject("loginMapper.getVerifyCodeByUserid", pd);
	}

	//加入新的第三方登录方式
	public void updateUserThirdParty(PageData pd) throws Exception {
		dao.update("loginMapper.updateUserThirdParty", pd);
	}

	//删除无效的第三方登录方式
	public void deleteThirdPartyAccount(PageData pd) throws Exception {
		dao.delete("loginMapper.deleteThirdPartyAccount", pd);
	}

	//通过手机号（登录名）查询用户详情
	public PageData getUserInfoByUserCode(PageData pd) throws Exception {
		return (PageData) dao.findForObject("loginMapper.getUserInfoByUserCode", pd);
	}

	//修改用户密码
	public void updateUserPwd(PageData pd) throws Exception {
		dao.update("loginMapper.updateUserPwd", pd);
	}

	//修改用户支付密码
	public void updatePayPwd(PageData pd) throws Exception {
		dao.update("loginMapper.updatePayPwd", pd);
	}

	//得到用户密码
	public String getUserPwd(PageData pd) throws Exception {
		return (String) dao.findForObject("loginMapper.getUserPwd", pd);
	}

	//根据类型获取欢迎页
	public List<PageData> getWelCommonImgs(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("loginMapper.getWelCommonImgs", pd);
	}
	// 新用户注册成功给5%加速卡
	public String getspeedCarId() throws Exception {
		return (String)dao.findForObject("loginMapper.getspeedCarId",new PageData());
	}
//给新用户发送一张加速卡
	public void sendNewUserspeedcar(PageData pd) throws Exception {
		dao.save("loginMapper.sendNewUserspeedcar",pd);
	}

	//根据等级去查询等级名称
	public String getGradeName(PageData pd) throws Exception {
		return (String) dao.findForObject("loginMapper.getGradeName", pd);
	}
//判定用户是否已经注册
	public int getCodeUSersuccess(PageData pd) throws Exception {
		return (int) dao.findForObject("loginMapper.getCodeUSersuccess", pd);
	}
//	判定用户手机号码是否存在平台中
	public int getUserphoneBycode(PageData pd) throws Exception {
		return (int)dao.findForObject("loginMapper.getUserphoneBycode", pd);
	}

}
