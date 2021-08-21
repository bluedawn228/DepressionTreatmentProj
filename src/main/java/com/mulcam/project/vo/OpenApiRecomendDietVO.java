package com.mulcam.project.vo;

public class OpenApiRecomendDietVO {
	
	//추가한 변수
	private int   	 idx   ;														// 게시글 번호
	private String   dietSeCode   ;											// 카테고리
	private String   cntntsNo   ;												// 컨텐츠 번호
	private String   imageurl   ;												// 이미지 주소
	//API	변수
	private String   dietNm   ;								 				//식단 명
	private String   fdNm   ;													// 음식 명
	private String   cntntsSj   ;								 				//컨텐츠 제목
	private String   cntntsChargerEsntlNm   ;						// 담당자 명
	private String   registDt   ;								 				//등록 일시
	private String   cntntsRdcnt   ;								 		//조회수
	private String   rtnFileSeCode   ;								 		//파일 구분 코드
	private String   rtnFileSn   ;								 				//파일 순번
	private String   rtnOrginlFileNm   ;								 	//원본 파일명
	private String   rtnStreFileNm   ;										// 저장 파일명
	private String   rtnImageDc   ;								 			//이미지 설명
	private String   rtnThumbFileNm   ;								//썸네일 파일명
	private String   rtnImgSeCode   ;								 	//이미지 구분 코드
	
	public OpenApiRecomendDietVO() {}

	public OpenApiRecomendDietVO(int idx, String dietSeCode, String cntntsNo, String imageurl, String dietNm,
			String fdNm, String cntntsSj, String cntntsChargerEsntlNm, String registDt, String cntntsRdcnt,
			String rtnFileSeCode, String rtnFileSn, String rtnOrginlFileNm, String rtnStreFileNm, String rtnImageDc,
			String rtnThumbFileNm, String rtnImgSeCode) {
		super();
		this.idx = idx;
		this.dietSeCode = dietSeCode;
		this.cntntsNo = cntntsNo;
		this.imageurl = imageurl;
		this.dietNm = dietNm;
		this.fdNm = fdNm;
		this.cntntsSj = cntntsSj;
		this.cntntsChargerEsntlNm = cntntsChargerEsntlNm;
		this.registDt = registDt;
		this.cntntsRdcnt = cntntsRdcnt;
		this.rtnFileSeCode = rtnFileSeCode;
		this.rtnFileSn = rtnFileSn;
		this.rtnOrginlFileNm = rtnOrginlFileNm;
		this.rtnStreFileNm = rtnStreFileNm;
		this.rtnImageDc = rtnImageDc;
		this.rtnThumbFileNm = rtnThumbFileNm;
		this.rtnImgSeCode = rtnImgSeCode;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getDietSeCode() {
		return dietSeCode;
	}

	public void setDietSeCode(String dietSeCode) {
		this.dietSeCode = dietSeCode;
	}

	public String getCntntsNo() {
		return cntntsNo;
	}

	public void setCntntsNo(String cntntsNo) {
		this.cntntsNo = cntntsNo;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public String getDietNm() {
		return dietNm;
	}

	public void setDietNm(String dietNm) {
		this.dietNm = dietNm;
	}

	public String getFdNm() {
		return fdNm;
	}

	public void setFdNm(String fdNm) {
		this.fdNm = fdNm;
	}

	public String getCntntsSj() {
		return cntntsSj;
	}

	public void setCntntsSj(String cntntsSj) {
		this.cntntsSj = cntntsSj;
	}

	public String getCntntsChargerEsntlNm() {
		return cntntsChargerEsntlNm;
	}

	public void setCntntsChargerEsntlNm(String cntntsChargerEsntlNm) {
		this.cntntsChargerEsntlNm = cntntsChargerEsntlNm;
	}

	public String getRegistDt() {
		return registDt;
	}

	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}

	public String getCntntsRdcnt() {
		return cntntsRdcnt;
	}

	public void setCntntsRdcnt(String cntntsRdcnt) {
		this.cntntsRdcnt = cntntsRdcnt;
	}

	public String getRtnFileSeCode() {
		return rtnFileSeCode;
	}

	public void setRtnFileSeCode(String rtnFileSeCode) {
		this.rtnFileSeCode = rtnFileSeCode;
	}

	public String getRtnFileSn() {
		return rtnFileSn;
	}

	public void setRtnFileSn(String rtnFileSn) {
		this.rtnFileSn = rtnFileSn;
	}

	public String getRtnOrginlFileNm() {
		return rtnOrginlFileNm;
	}

	public void setRtnOrginlFileNm(String rtnOrginlFileNm) {
		this.rtnOrginlFileNm = rtnOrginlFileNm;
	}

	public String getRtnStreFileNm() {
		return rtnStreFileNm;
	}

	public void setRtnStreFileNm(String rtnStreFileNm) {
		this.rtnStreFileNm = rtnStreFileNm;
	}

	public String getRtnImageDc() {
		return rtnImageDc;
	}

	public void setRtnImageDc(String rtnImageDc) {
		this.rtnImageDc = rtnImageDc;
	}

	public String getRtnThumbFileNm() {
		return rtnThumbFileNm;
	}

	public void setRtnThumbFileNm(String rtnThumbFileNm) {
		this.rtnThumbFileNm = rtnThumbFileNm;
	}

	public String getRtnImgSeCode() {
		return rtnImgSeCode;
	}

	public void setRtnImgSeCode(String rtnImgSeCode) {
		this.rtnImgSeCode = rtnImgSeCode;
	}

	
	

}
