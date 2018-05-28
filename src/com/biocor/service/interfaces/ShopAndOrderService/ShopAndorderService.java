package com.biocor.service.interfaces.ShopAndOrderService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.shoping.Goods;
import com.biocor.entity.shoping.GoodsType;
import com.biocor.util.PageData;

@Service
public class ShopAndorderService {
	@Resource
	private DaoSupport daoSupport;

	// 判断用户是否收藏了该店铺
	public Integer getFocusIsOrno(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getFocusIsOrno", pd);
	}

	// 取消收藏
	public void CancelFocus(PageData pd) throws Exception {
		daoSupport.delete("ShopAndOrderMapper.CancelFocus", pd);
	}

	// 用户执行收藏
	public void FoucsYes(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.FoucsYes", pd);
	}

	// 查询店铺详情H5
	public PageData getshopInfoH5(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getshopInfoH5", pd);
	}

	// 用户预约就餐
	public void Bookingmeal(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.Bookingmeal", pd);
	}

	// 查询全部菜品
	public List<PageData> getShopAllgoods(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getShopAllgoods", pd);
	}

	// 查询当前店内的所有菜品类型
	public List<PageData> getGoodtype(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getGoodtype", pd);
	}

	// 查询当前店铺下得到所有特色菜
	public List<PageData> getShopStleygoods(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getShopStleygoods", pd);
	}

	// 按类型查询菜品
	public List<PageData> getStylegoodtype(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getStylegoodtype", pd);
	}

	// 创建小订单
	public void addorderMill(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.addorderMill", pd);
	}

	// 创建大订单主表
	public void createBigOrder(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.createBigOrder", pd);
	}

	// 按类型查询订单列表
	public List<PageData> orderList(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.orderList", pd);
	}

	// 查询该订单的状态
	public Integer getOrderState(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getOrderState", pd);
	}

	// 执行修改订单状态为删除状态
	public void updateOrderdelete(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updateOrderdelete", pd);
	}

	// 查询订单详情h5
	public PageData getOrderInfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getOrderInfo", pd);
	}

	// 查看订单点菜详情
	public List<PageData> getOrderGoods(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getOrderGoods", pd);
	}

	// 根据订单id判断是否为预约类型
	public Integer getOrderIsbasepeak(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getOrderIsbasepeak", pd);
	}

	// 查询预约类型的订单详情
	public PageData getbasespeakInfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getbasespeakInfo", pd);
	}

	// 进店点菜的订单查询详情
	public PageData getOrderGOType(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getOrderGOType", pd);
	}

	public List<GoodsType> findgoodsTypeList(String sid) throws Exception {
		PageData pd = new PageData();
		pd.put("sid", sid);
		List<GoodsType> listtype = (List<GoodsType>) daoSupport.findForList("ShopAndOrderMapper.findgoodsTypeList", pd);
		for (GoodsType goodsType : listtype) {
			pd.put("ftid", goodsType.getFtid());
			List<Goods> listGoods = (List<Goods>) daoSupport.findForList("ShopAndOrderMapper.findShopGoodsList", pd);
			goodsType.setGoods(listGoods);
		}
		return listtype;
	}

	// 用户评价店铺
	public void userEvaluation(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.userEvaluation", pd);
	}

	// 用户取消订单
	public void cancelOrder(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.cancelOrder", pd);
	}

	// 查询订单的预约时间
	public Long getorderConventionTime(PageData pd) throws Exception {
		return (Long) daoSupport.findForObject("ShopAndOrderMapper.getorderConventionTime", pd);
	}

	// 修改订单状态
	public void updateOrderstate(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updateOrderstate", pd);
	}

	// 查询用户的积分余额
	public Integer getUserintegral(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getUserintegral", pd);
	}

	// 查询店铺的评价累计得分
	public float getshopSumAndranoud(PageData pd) throws Exception {
		return (float) daoSupport.findForObject("ShopAndOrderMapper.getshopSumAndranoud", pd);
	}

	// 查询评论数量
	public float getshopcount(PageData pd) throws Exception {
		return (float) daoSupport.findForObject("ShopAndOrderMapper.getshopcount", pd);
	}

	// 更新店铺星级
	public void updateShopstar(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updateShopstar", pd);
	}

	// 根据用户id查询用户的相关信息预约时使用
	public PageData getUsertelAndinfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getUsertelAndinfo", pd);
	}

	// 创建预约信息
	public void createAppointment(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.createAppointment", pd);
	}

	// 根据用户id查询最新一条的预约信息
	public String getUserYuyid(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("ShopAndOrderMapper.getUserYuyid", pd);
	}

	// 查询店铺的餐位费
	public PageData getShopInfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getShopInfo", pd);
	}

	// 查询预约时间
	public String getYuetime(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("ShopAndOrderMapper.getYuetime", pd);
	}

	// 将生成的订单号更新到预约信息中
	public void updateYueInfo(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updateYueInfo", pd);
	}

	// 查询预约信息
	public PageData getUserYueinfo(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.getUserYueinfo", pd);
	}

	// 进行积分增改
	public void updatejifen(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updatejifen", pd);
	}

	// 插入积分消费记录
	public void insertJifeninfo(PageData pd) throws Exception {
		daoSupport.save("ShopAndOrderMapper.insertJifeninfo", pd);
	}

	// 查询用户是否已经关注该家店铺
	public Integer getUserIsnoAttention(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getUserIsnoAttention", pd);
	}

	// 查询到用户 的积分累计用来计算用户的等级
	public Integer getUserVipinfo(PageData pd) throws Exception {
		return (Integer) daoSupport.findForObject("ShopAndOrderMapper.getUserVipinfo", pd);
	}

	// 查询积分等级列表
	public List<PageData> getViolevel() throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getViolevel", new PageData());
	}

	// 对用户积分进行增加
	public void adduserscore(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.adduserscore", pd);
	}

	// 好玩的店铺详情H5
	public List<PageData> getshopGoodslist(PageData pd) throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getshopGoodslist", pd);
	}

	// 查看奖励发放
	public List<PageData> getRewardInfoH5() throws Exception {
		return (List<PageData>) daoSupport.findForList("ShopAndOrderMapper.getRewardInfoH5", new PageData());
	}

	// 查询店铺名称
	public String getshopName(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("ShopAndOrderMapper.getshopName", pd);
	}

	/**********************************************************/
	// 是否是预约订单
	public PageData isOrderBespeak(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.isOrderBespeak", pd);
	}

	// 订单是否领过奖
	public PageData isOrderPrize(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.isOrderPrize", pd);
	}

	// 判断订单评价次数
	public PageData orderEvalCount(PageData pd) throws Exception {
		return (PageData) daoSupport.findForObject("ShopAndOrderMapper.orderEvalCount", pd);
	}

	// 根据订单号查询用户的积分可用余额
	public int getUserJifenCount(PageData pd) throws Exception {
		return (int) daoSupport.findForObject("ShopAndOrderMapper.getUserJifenCount", pd);
	}

	// 查询用户的注册时间
	public String getUserRegTime(PageData pd) throws Exception {
		return (String) daoSupport.findForObject("ShopAndOrderMapper.getUserRegTime", pd);
	}

	// 将该订单获的积分和成长值插入到订单表中
	public void sendOrderSore(PageData pd) throws Exception {
		daoSupport.update("ShopAndOrderMapper.sendOrderSore", pd);
	}

	// 先判断数据是否存在
	public int getShopbrowse(PageData pd2) throws Exception {
		return (int) daoSupport.findForObject("ShopAndOrderMapper.getShopbrowse", pd2);
	}

	// 浏览数据存在 数据加1
	public void updateShopbrowsecount(PageData pd2) throws Exception {
		daoSupport.update("ShopAndOrderMapper.updateShopbrowsecount", pd2);
	}

	// 今日不存在浏览数据的时候加一条店铺浏览记录
	public void insertShopbrowseinfo(PageData pd2) throws Exception {
		daoSupport.save("ShopAndOrderMapper.insertShopbrowseinfo",pd2);
	}
	

}
