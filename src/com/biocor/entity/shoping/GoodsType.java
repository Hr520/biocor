package com.biocor.entity.shoping;

import java.util.List;

public class GoodsType {
	private int ftid;
	private String ft_foodtype_name;
//	private String ft_foodtype_createdate;
//	private String ft_foodtype_remark;
	private List<Goods> goods;

	public int getFtid() {
		return ftid;
	}

	public void setFtid(int ftid) {
		this.ftid = ftid;
	}

	public String getFt_foodtype_name() {
		return ft_foodtype_name;
	}

	public void setFt_foodtype_name(String ft_foodtype_name) {
		this.ft_foodtype_name = ft_foodtype_name;
	}

//	public String getFt_foodtype_createdate() {
//		return ft_foodtype_createdate;
//	}
//
//	public void setFt_foodtype_createdate(String ft_foodtype_createdate) {
//		this.ft_foodtype_createdate = ft_foodtype_createdate;
//	}

	// public String getFt_foodtype_remark() {
	// return ft_foodtype_remark;
	// }
	//
	// public void setFt_foodtype_remark(String ft_foodtype_remark) {
	// this.ft_foodtype_remark = ft_foodtype_remark;
	// }

	public List<Goods> getGoods() {
		return goods;
	}

	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}

}
