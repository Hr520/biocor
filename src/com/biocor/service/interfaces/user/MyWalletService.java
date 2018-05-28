package com.biocor.service.interfaces.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.util.PageData;

@Service("myWalletService")
public class MyWalletService {
	@Resource(name="daoSupport")
	private DaoSupport dao;

	//我的钱包
	public PageData myWalletInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("myWalletMapper.myWalletInfo", pd);
	}

	//根据userid查询用户余额
	public Float getUserMoney(PageData pd) throws Exception {
		return (Float) dao.findForObject("myWalletMapper.getUserMoney", pd);
	}

	//根据userid查询用户支付密码
	public String getUserPayPwd(PageData pd) throws Exception {
		return (String) dao.findForObject("myWalletMapper.getUserPayPwd", pd);
	}

	//添加用户提现申请
	public void withdrawApply(PageData pd) throws Exception {
		dao.save("myWalletMapper.withdrawApply", pd);
	}

	//查询提现验证码
	public String getTxverifycode(PageData pd) throws Exception {
		return (String) dao.findForObject("myWalletMapper.getTxverifycode", pd);
	}

	//修改用户可用余额
	public void updateUserMoney(PageData pd) throws Exception {
		dao.update("myWalletMapper.updateUserMoney", pd);
	}

	//查询用户余额明细列表
	public List<PageData> getmyWalletDetails(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("myWalletMapper.getmyWalletDetails", pd);
	}

	//点击提现按钮查询余额和支付宝账号
	public PageData getBalanceAndAlipay(PageData pd) throws Exception {
		return (PageData) dao.findForObject("myWalletMapper.getBalanceAndAlipay", pd);
	}

	//新增支付宝账号
	public void addAlipay(PageData pd) throws Exception {
		dao.save("myWalletMapper.addAlipay", pd);
	}

	//查询用户有没有支付宝账号
	public int hasAlipay(PageData pd) throws Exception {
		return (int) dao.findForObject("myWalletMapper.hasAlipay", pd);
	}

}
