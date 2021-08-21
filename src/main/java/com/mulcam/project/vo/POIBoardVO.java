package com.mulcam.project.vo;

import java.util.Date;

public class POIBoardVO {
	
	private int bno;
	private String subject;
	private String content;
	private String address;
	private double posx;
	private double posy;

	private String url;
	private int division;
	private int recommend;
	private String rate;
	private String writer;
	private Date regDate;
	private int cno;
	private String province;
	
	private String sortId;
	private String sortOrder;
	
	private String colSortId;
	private String colSortOrder;
	
	private String filterDivision;
	private String filterProvince;
	private String filterRate;
	
	private int page;

	
	public POIBoardVO() {}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getPosx() {
		return posx;
	}

	public void setPosx(double posx) {
		this.posx = posx;
	}

	public double getPosy() {
		return posy;
	}

	public void setPosy(double posy) {

		this.posy = posy;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getSortId() {
		return sortId;
	}

	public void setSortId(String sortId) {
		this.sortId = sortId;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getColSortId() {
		return colSortId;
	}

	public void setColSortId(String colSortId) {
		this.colSortId = colSortId;
	}

	public String getColSortOrder() {
		return colSortOrder;
	}

	public void setColSortOrder(String colSortOrder) {
		this.colSortOrder = colSortOrder;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getFilterDivision() {
		return filterDivision;
	}

	public void setFilterDivision(String filterDivision) {
		this.filterDivision = filterDivision;
	}

	public String getFilterProvince() {
		return filterProvince;
	}

	public void setFilterProvince(String filterProvince) {
		this.filterProvince = filterProvince;
	}

	public String getFilterRate() {
		return filterRate;
	}

	public void setFilterRate(String filterRate) {
		this.filterRate = filterRate;
	}

	

}
