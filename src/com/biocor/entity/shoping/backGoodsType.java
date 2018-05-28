package com.biocor.entity.shoping;

import java.util.List;

public class backGoodsType {
	private int ftid;
	private String ft_foodtype_name;

	private List<backGoods> goods;

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

	public List<backGoods> getGoods() {
		return goods;
	}

	public void setGoods(List<backGoods> goods) {
		this.goods = goods;
	}

	
}
