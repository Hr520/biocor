package com.biocor.entity.shoping;

public class backGoods {

	private int gid;
	private String goods_name = "";
	private String goods_moeny = "";
	private String goods_dis_money = "";
	private String goods_images = "";
	private String goods_sid = "";
	private String goods_remark = "";
	private int salesCount=0;
	private int jifen = 0;
	private int goods_ISshelves;
	private int goods_taste=0;
	
	

	
	
	public int getGoods_taste() {
		return goods_taste;
	}

	public void setGoods_taste(int goods_taste) {
		this.goods_taste = goods_taste;
	}

	public int getSalesCount() {
		return salesCount;
	}

	public void setSalesCount(int salesCount) {
		this.salesCount = salesCount;
	}

	public int getGoods_ISshelves() {
		return goods_ISshelves;
	}

	public void setGoods_ISshelves(int goods_ISshelves) {
		this.goods_ISshelves = goods_ISshelves;
	}

	public int getJifen() {
		return jifen;
	}

	public void setJifen(int jifen) {
		this.jifen = jifen;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_moeny() {
		return goods_moeny;
	}

	public void setGoods_moeny(String goods_moeny) {
		this.goods_moeny = goods_moeny;
	}

	public String getGoods_dis_money() {
		return goods_dis_money;
	}

	public void setGoods_dis_money(String goods_dis_money) {
		this.goods_dis_money = goods_dis_money;
	}

	public String getGoods_images() {
		return goods_images;
	}

	public void setGoods_images(String goods_images) {
		this.goods_images = goods_images;
	}

	public String getGoods_sid() {
		return goods_sid;
	}

	public void setGoods_sid(String goods_sid) {
		this.goods_sid = goods_sid;
	}

	public String getGoods_remark() {
		return goods_remark;
	}

	public void setGoods_remark(String goods_remark) {
		this.goods_remark = goods_remark;
	}


}
