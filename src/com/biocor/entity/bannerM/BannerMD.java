package com.biocor.entity.bannerM;

import java.util.List;

public class BannerMD {
	
	
	/***
	 * 商铺信息
	 */
	private Integer sid;				//商铺ID
	private String shop_name;			//商铺名称
	private String shop_adders;		//商铺地址
	private String shop_street;		//商铺商圈
	private String shop_grade;	    //商铺等级
	private String st_name;			//商铺类型	
	private String shop_consume;	//商铺人均消费
	private String shop_introduce;	//商铺介绍
	private String shop_images;	//商铺介绍
	
	private String goods_images;
	private String goods_name;
	private String goods_dis_money;
	private String goods_moeny;
	private String gid;
	
	
	
	 
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGoods_images() {
		return goods_images;
	}
	public void setGoods_images(String goods_images) {
		this.goods_images = goods_images;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_dis_money() {
		return goods_dis_money;
	}
	public void setGoods_dis_money(String goods_dis_money) {
		this.goods_dis_money = goods_dis_money;
	}
	public String getGoods_moeny() {
		return goods_moeny;
	}
	public void setGoods_moeny(String goods_moeny) {
		this.goods_moeny = goods_moeny;
	}
	private List<BannerMDG> listmdg;
	
	 
	public List<BannerMDG> getListmdg() {
		return listmdg;
	}
	public void setListmdg(List<BannerMDG> listmdg) {
		this.listmdg = listmdg;
	}
	public String getShop_images() {
		return shop_images;
	}
	public void setShop_images(String shop_images) {
		this.shop_images = shop_images;
	}
	public String getShop_introduce() {
		return shop_introduce;
	}
	public void setShop_introduce(String shop_introduce) {
		this.shop_introduce = shop_introduce;
	}
 

	
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_adders() {
		return shop_adders;
	}
	public void setShop_adders(String shop_adders) {
		this.shop_adders = shop_adders;
	}
	public String getShop_street() {
		return shop_street;
	}
	public void setShop_street(String shop_street) {
		this.shop_street = shop_street;
	}
	public String getShop_grade() {
		return shop_grade;
	}
	public void setShop_grade(String shop_grade) {
		this.shop_grade = shop_grade;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getShop_consume() {
		return shop_consume;
	}
	public void setShop_consume(String shop_consume) {
		this.shop_consume = shop_consume;
	}
	
}
