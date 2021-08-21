package com.mulcam.project.vo;

public class OpenApiReqParamVO {
	
	String apiKey = "20210719TBFSAAZXI4EDPYKWVVNIG"; // apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
	
	String serviceName;				// 서비스명			
	String serviceAction;			// 오퍼레이션 명
	
	String dietSeCode;				// 식단 구분코드 ○
	String pageNo;						// 조회할 페이지 번호
	String numOfRows	=	"99999999";				// 한 페이지에 제공할 건수
	
	int cntntsNo=0;					// 컨텐츠 번호 ○
	
	public OpenApiReqParamVO() {};

	public OpenApiReqParamVO(String apiKey, String serviceName, String serviceAction, String dietSeCode, String pageNo,
			String numOfRows, int cntntsNo) {
		super();
		this.apiKey = apiKey;
		this.serviceName = serviceName;
		this.serviceAction = serviceAction;
		this.dietSeCode = dietSeCode;
		this.pageNo = pageNo;
		this.numOfRows = numOfRows;
		this.cntntsNo = cntntsNo;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceAction() {
		return serviceAction;
	}

	public void setServiceAction(String serviceAction) {
		this.serviceAction = serviceAction;
	}

	public String getDietSeCode() {
		return dietSeCode;
	}

	public void setDietSeCode(String dietSeCode) {
		this.dietSeCode = dietSeCode;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}

	public int getCntntsNo() {
		return cntntsNo;
	}

	public void setCntntsNo(int cntntsNo) {
		this.cntntsNo = cntntsNo;
	}
	
	
	
	

}
