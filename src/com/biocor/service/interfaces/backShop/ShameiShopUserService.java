package com.biocor.service.interfaces.backShop;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biocor.dao.DaoSupport;
import com.biocor.entity.shoping.Goods;
import com.biocor.entity.shoping.GoodsType;
import com.biocor.entity.shoping.backGoods;
import com.biocor.entity.shoping.backGoodsType;
import com.biocor.util.PageData;

@Service
public class ShameiShopUserService {
	// 商户端service层
	@Resource
	private DaoSupport dao;

	// 写入用户登录信息
	public void ShopUSerlogin(PageData pd2) throws Exception {
		dao.save("backShopMapper.ShopUSerlogin", pd2);
	}

	// 查询用户相关信息用户登录返回相应的数据信息
	public PageData getUserPwd(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getUserPwd", pd);
	}

	// 根据店铺id查询到店铺相关的订单交易数据
	public PageData getSHOpperINfo(PageData pd3) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getSHOpperINfo", pd3);
	}

	// 查询菜品 列表上架下架
	public List<backGoodsType> getGOOdlistByshop(PageData pd) throws Exception {
		// 查询菜品类型
		List<backGoodsType> listtype = (List<backGoodsType>) dao.findForList("backShopMapper.findgoodsTypeList", pd);
		for (backGoodsType goodsType : listtype) {
			pd.put("ftid", goodsType.getFtid());
			List<backGoods> listGoods = (List<backGoods>) dao.findForList("backShopMapper.findShopGoodsList", pd);
			goodsType.setGoods(listGoods);
		}
		return listtype;
	}

	// 查询店铺下所有的菜品类型
	public List<PageData> getShopbygoodslist(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getShopbygoodslist", pd);
	}

	// 新增菜品
	public void AddGoods(PageData pd) throws Exception {
		dao.save("backShopMapper.AddGoods", pd);
	}

	// 判定是否为积分菜
	public PageData getgoodSType(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getgoodSType", pd);
	}

	// 商品之前上架过，无需审核直接上架菜品上架下架 售罄
	public void updateGOODsshelves(PageData pd) throws Exception {
		dao.update("backShopMapper.updateGOODsshelves", pd);
	}

	// 修改菜品价格
	public void updaGoodsByMoneyintegral(PageData pd) throws Exception {
		dao.update("backShopMapper.updaGoodsByMoneyintegral", pd);
	}

	// 查询当前的菜品已经销售的份数
	public int getGoodsTotal(PageData pd2) throws Exception {
		return (int) dao.findForObject("backShopMapper.getGoodsTotal", pd2);
	}

	// 菜品搜索当前店结果集
	public List<PageData> getsreachGoodslist(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getsreachGoodslist", pd);
	}

	// 写入菜品修改价格历史
	public void insertGoodsMoneyUPdateinfo(PageData pd) throws Exception {
		dao.save("backShopMapper.insertGoodsMoneyUPdateinfo", pd);
	}

	// 修改菜品修改菜品为申请上架中状态
	public void GoodsUPdate(PageData pd) throws Exception {
		dao.update("backShopMapper.GoodsUPdate", pd);
	}

	// 用户退出
	public void UserexitLogin(PageData pd) throws Exception {
		dao.update("backShopMapper.UserexitLogin", pd);
	}

	/*******************************
	 * 华丽分割线另外的大类
	 * 
	 * @throws Exception
	 *************************************************/
	// 设置店铺
	public void updateShop(PageData pd) throws Exception {
		dao.update("backShopMapper.updateShop", pd);
	}

	// 修改店铺信息
	public void updatSHopALL(PageData pd) throws Exception {
		dao.update("backShopMapper.updatSHopALL", pd);
	}

	// 查询订单列表(按类型查询)
	public List<PageData> getOrderBytypelistpage(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getOrderBytypelistpage", pd);
	}

	// 查询今日订单总数
	public List<PageData> getShopOrderCount(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getShopOrderCount", pd);
	}

	// 判断用户是不是店主
	public int getShopUserisnoleder(PageData pd) throws Exception {
		return (int) dao.findForObject("backShopMapper.getShopUserisnoleder", pd);
	}

	// 根据店铺id查询到店铺图片
	public String getShopImgs(PageData pd) throws Exception {
		return (String) dao.findForObject("backShopMapper.getShopImgs", pd);
	}

	// 修改店铺图片操作
	public void updateShopimg(PageData pd) throws Exception {
		dao.update("backShopMapper.updateShopimg", pd);
	}

	// 查询当前店铺下查询评价列表
	public List<PageData> getShopevaluationList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getShopevaluationList", pd);
	}

	// 查询店铺星级和好评率
	public PageData getShopevaluationInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getShopevaluationInfo", pd);
	}

	// 查询地订单菜品
	public List<PageData> getOrderGoodlist(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getOrderGoodlist", pd);
	}

	// 查询订单总计
	public Integer orderMoneyTotal(PageData pd) throws Exception {
		return (Integer) dao.findForObject("backShopMapper.orderMoneyTotal", pd);
	}

	// 查询订单其他相关信息
	public PageData getorderInfo(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getorderInfo", pd);
	}

	// 确认订单
	public void confirmOrder(PageData pd) throws Exception {
		dao.update("backShopMapper.confirmOrder", pd);
	}

	// 接收银行卡相关信息
	public void addBankCar(PageData pd) throws Exception {
		dao.save("backShopMapper.addBankCar", pd);
	}

	// 根据店铺id和用户id查询到店铺绑定的手机号码
	public String getShopPhone(PageData pd) throws Exception {
		return (String) dao.findForObject("backShopMapper.getShopPhone", pd);
	}

	// 将手机号码更新到店主的账号中
	public void updateshopUsertel(PageData pd) throws Exception {
		dao.update("backShopMapper.updateshopUsertel", pd);
	}

	// 发送成功将数据写入到数据库中
	public void updatesendCode(PageData pd) throws Exception {
		dao.update("backShopMapper.updatesendCode", pd);
	}

	// 查询到用户的验证码和验证码发送时间
	public PageData getUSerTxcode(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getUSerTxcode", pd);
	}

	// 执行添加提现操作
	public void shopUserTx(PageData pd) throws Exception {
		dao.save("backShopMapper.shopUserTx", pd);
	}

	// 根据店主id查询到银行卡列表
	public List<PageData> getShopBankList(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getShopBankList", pd);
	}

	// 更新店铺余额
	public void updateShopMoney(PageData pd) throws Exception {
		dao.update("backShopMapper.updateShopMoney", pd);
	}

	// 根据订单的id查询到店铺主的tag和店铺员工的tag值值执行推送
	public PageData getShoptag(PageData pd2) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getShoptag", pd2);
	}

	// 查询店主tag
	public String getShoppertag(PageData pd2) throws Exception {
		return (String) dao.findForObject("backShopMapper.getShoppertag", pd2);
	}

	// 查询店员tag
	public List<PageData> getUsertag(PageData pd2) throws Exception {
		return (List<PageData>) dao.findForList("backShopMapper.getUsertag", pd2);
	}

	// 根据订单拿到需要的推送数据
	public String getJPushneedInfo(PageData pd3) throws Exception {
		return (String) dao.findForObject("backShopMapper.getJPushneedInfo", pd3);
	}

	// 推送数据写入数据库中
	public void sendJpush(PageData pd3) throws Exception {
		dao.save("backShopMapper.sendJpush", pd3);
	}

	// 查询店铺下面那些权限是开启的
	public String getShoppush(PageData pd) throws Exception {
		return (String) dao.findForObject("backShopMapper.getShoppush", pd);
	}

	// 查询到店铺的tag值
	public PageData getTXBYidgetshop_id(PageData pd) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getTXBYidgetshop_id", pd);
	}

	// 查询提现相关信息
	public PageData getShopTXmoney(PageData pd4) throws Exception {
		return (PageData) dao.findForObject("backShopMapper.getShopTXmoney", pd4);
	}

	// 执行数据库操作
	public void refundShop(PageData pd4) throws Exception {
		dao.update("backShopMapper.refundShop", pd4);
	}
	// 判断扫描用户的权限(确认订单)
	public String getUserCanconfirmder(PageData pd) throws Exception {
		return (String)dao.findForObject("backShopMapper.getUserCanconfirmder",pd);
	}
	// 查询未完成订单按照预约时间由小到大排序
	public List<PageData> getOrderaboutorderList(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("backShopMapper.getOrderaboutorderList",pd);
	}
	//今日订单今日预约订单+到店订单（全部除去失效订单，按支付完成日期统计）
	public int getOrdertotalBytoday(PageData pd) throws Exception {
		return (int)dao.findForObject("backShopMapper.getOrdertotalBytoday",pd);
	}
//查询今日预约订单
	public int getOrdertotalByaboutday(PageData pd) throws Exception {
		return (int)dao.findForObject("backShopMapper.getOrdertotalByaboutday",pd);
	}
	//明日预约
	public int getOrdertotalBytomoney(PageData pd) throws Exception {
		return (int)dao.findForObject("backShopMapper.getOrdertotalBytomoney",pd);
	}
	//消费了今日预约订单总数
	public int getordertotalByYuetomory(PageData pd) throws Exception {
		return (int)dao.findForObject("backShopMapper.getordertotalByYuetomory",pd);
	}
	// 通过用户id查询到当前登录用户的rid
	public String getUseregID(PageData pd) throws Exception {
		return (String)dao.findForObject("backShopMapper.getUseregID",pd);
	}
	//查询 今日进店还未消费的订单总数
	public int getHordertotal(PageData pd) throws Exception {
		return (int)dao.findForObject("backShopMapper.getHordertotal",pd);
	}
//查询店铺的消息设置
	public String getShopMessagePage(PageData pd) throws Exception {
		return (String)dao.findForObject("backShopMapper.getShopMessagePage",pd);
	}
}
