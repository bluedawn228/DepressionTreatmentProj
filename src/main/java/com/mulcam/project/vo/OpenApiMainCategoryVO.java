package com.mulcam.project.vo;

public class OpenApiMainCategoryVO {
	private String dietSeCode;					//식단 구분코드
	private String dietSeName;					//식단 구분명
	

	public OpenApiMainCategoryVO() {};
	
	public OpenApiMainCategoryVO(String dietSeCode, String dietSeName) {
		super();
		this.dietSeCode = dietSeCode;
		this.dietSeName = dietSeName;
	}

	public String getDietSeCode() {
		return dietSeCode;
	}

	public void setDietSeCode(String dietSeCode) {
		this.dietSeCode = dietSeCode;
	}

	public String getDietSeName() {
		return dietSeName;
	}

	public void setDietSeName(String dietSeName) {
		this.dietSeName = dietSeName;
	}

	
	
	
}
