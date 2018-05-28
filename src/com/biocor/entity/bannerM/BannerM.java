package com.biocor.entity.bannerM;

import java.util.List;

public class BannerM {
	
	private Integer mid;
	private String m_topImg;
	private String m_bgImg;
	private String m_type;
	private String m_No;
	private String m_createDate;
	private String m_title;
	private String m_remark;
	
	private List<BannerMD> bmdList;
	private int m_order;
	
	
	
	public String getM_remark() {
		return m_remark;
	}
	public void setM_remark(String m_remark) {
		this.m_remark = m_remark;
	}
	public int getM_order() {
		return m_order;
	}
	public void setM_order(int m_order) {
		this.m_order = m_order;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getM_topImg() {
		return m_topImg;
	}
	public void setM_topImg(String m_topImg) {
		this.m_topImg = m_topImg;
	}
	public String getM_bgImg() {
		return m_bgImg;
	}
	public void setM_bgImg(String m_bgImg) {
		this.m_bgImg = m_bgImg;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public String getM_No() {
		return m_No;
	}
	public void setM_No(String m_No) {
		this.m_No = m_No;
	}
	public String getM_createDate() {
		return m_createDate;
	}
	public void setM_createDate(String m_createDate) {
		this.m_createDate = m_createDate;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public List<BannerMD> getBmdList() {
		return bmdList;
	}
	public void setBmdList(List<BannerMD> bmdList) {
		this.bmdList = bmdList;
	}
	
	

}
