package com.mulcam.project.vo;

public class OpenApiRecomendDietDtlVO {
	
	private String cntntsNo ; 									// 컨텐츠 번호
	private String dietDtlNm ;  									// 식단 상세명
	private String dietNm ;  										// 식단 명
	private String fdInfoFirst ;  								// 음식 순서
	private String fdInfo ;  										// 음식 정보
	private String dietNtrsmallInfo ;  						// 식단 영양소 정보
	private String dietCn ;  										// 식단 내용
	private String fdCntntsNo ; 								 // 음식 컨텐츠 번호
	private String fdNm ;  										// 음식 명
	private String matrlInfo ;  									// 재료 정보
	private String ckngMthInfo ;  								// 조리 방법 정보
	private String ntkQyInfo ; 								 	// 섭취 량 정보
	private String crbhInfo ;  									// 당질 정보
	private String clriInfo ;  										// 칼로리 정보
	private String protInfo ;  									// 단백질 정보
	private String ntrfsInfo ;  									// 지질 정보
	private String chlsInfo ;  										// 콜레스테롤 정보
	private String crfbInfo ;  									// 조섬요 정보
	private String clciInfo ;  										// 칼슘 정보
	private String ircnInfo ;  										// 철분 정보
	private String naInfo ;  										// 나트륨 정보
	private String frmlasaltEqvlntqyInfo;  				// 식염 상당량 정보
	private String vtmaInfo ;  									// 비타민 정보 A
	private String vtmbInfo ;  									// 비타민 정보 B
	private String vtmcInfo ;  									// 비타민 정보 C
	private String cntntsSj ;  									// 컨텐츠 제목
	private String cntntsChargerEsntlNm; 				// 담당자 명
	private String registDt ;  									// 등록 일시
	private String cntntsRdcnt ;  								// 조회수
	private String rtnFileSeCode ;  							// 파일 구분 코드
	private String rtnFileSn ;  									// 파일 순번
	private String rtnOrginlFileNm ;  						// 원본 파일명
	private String rtnStreFileNm ;  							// 저장 파일명
	private String rtnFileCours ;  								// 파일 경로
	private String rtnImageDc ;  								// 이미지 설명
	private String rtnThumbFileNm ;  						// 썸네일 파일명
	private String rtnImgSeCode ;  							// 이미지 구분 코드
	
	public OpenApiRecomendDietDtlVO() {};
	
	public OpenApiRecomendDietDtlVO(String cntntsNo, String dietDtlNm, String dietNm, String fdInfoFirst, String fdInfo,
			String dietNtrsmallInfo, String dietCn, String fdCntntsNo, String fdNm, String matrlInfo,
			String ckngMthInfo, String ntkQyInfo, String crbhInfo, String clriInfo, String protInfo, String ntrfsInfo,
			String chlsInfo, String crfbInfo, String clciInfo, String ircnInfo, String naInfo,
			String frmlasaltEqvlntqyInfo, String vtmaInfo, String vtmbInfo, String vtmcInfo, String cntntsSj,
			String cntntsChargerEsntlNm, String registDt, String cntntsRdcnt, String rtnFileSeCode, String rtnFileSn,
			String rtnOrginlFileNm, String rtnStreFileNm, String rtnFileCours, String rtnImageDc, String rtnThumbFileNm,
			String rtnImgSeCode) {
		super();
		this.cntntsNo = cntntsNo;
		this.dietDtlNm = dietDtlNm;
		this.dietNm = dietNm;
		this.fdInfoFirst = fdInfoFirst;
		this.fdInfo = fdInfo;
		this.dietNtrsmallInfo = dietNtrsmallInfo;
		this.dietCn = dietCn;
		this.fdCntntsNo = fdCntntsNo;
		this.fdNm = fdNm;
		this.matrlInfo = matrlInfo;
		this.ckngMthInfo = ckngMthInfo;
		this.ntkQyInfo = ntkQyInfo;
		this.crbhInfo = crbhInfo;
		this.clriInfo = clriInfo;
		this.protInfo = protInfo;
		this.ntrfsInfo = ntrfsInfo;
		this.chlsInfo = chlsInfo;
		this.crfbInfo = crfbInfo;
		this.clciInfo = clciInfo;
		this.ircnInfo = ircnInfo;
		this.naInfo = naInfo;
		this.frmlasaltEqvlntqyInfo = frmlasaltEqvlntqyInfo;
		this.vtmaInfo = vtmaInfo;
		this.vtmbInfo = vtmbInfo;
		this.vtmcInfo = vtmcInfo;
		this.cntntsSj = cntntsSj;
		this.cntntsChargerEsntlNm = cntntsChargerEsntlNm;
		this.registDt = registDt;
		this.cntntsRdcnt = cntntsRdcnt;
		this.rtnFileSeCode = rtnFileSeCode;
		this.rtnFileSn = rtnFileSn;
		this.rtnOrginlFileNm = rtnOrginlFileNm;
		this.rtnStreFileNm = rtnStreFileNm;
		this.rtnFileCours = rtnFileCours;
		this.rtnImageDc = rtnImageDc;
		this.rtnThumbFileNm = rtnThumbFileNm;
		this.rtnImgSeCode = rtnImgSeCode;
	}

	public String getCntntsNo() {
		return cntntsNo;
	}

	public void setCntntsNo(String cntntsNo) {
		this.cntntsNo = cntntsNo;
	}

	public String getDietDtlNm() {
		return dietDtlNm;
	}

	public void setDietDtlNm(String dietDtlNm) {
		this.dietDtlNm = dietDtlNm;
	}

	public String getDietNm() {
		return dietNm;
	}

	public void setDietNm(String dietNm) {
		this.dietNm = dietNm;
	}

	public String getFdInfoFirst() {
		return fdInfoFirst;
	}

	public void setFdInfoFirst(String fdInfoFirst) {
		this.fdInfoFirst = fdInfoFirst;
	}

	public String getFdInfo() {
		return fdInfo;
	}

	public void setFdInfo(String fdInfo) {
		this.fdInfo = fdInfo;
	}

	public String getDietNtrsmallInfo() {
		return dietNtrsmallInfo;
	}

	public void setDietNtrsmallInfo(String dietNtrsmallInfo) {
		this.dietNtrsmallInfo = dietNtrsmallInfo;
	}

	public String getDietCn() {
		return dietCn;
	}

	public void setDietCn(String dietCn) {
		this.dietCn = dietCn;
	}

	public String getFdCntntsNo() {
		return fdCntntsNo;
	}

	public void setFdCntntsNo(String fdCntntsNo) {
		this.fdCntntsNo = fdCntntsNo;
	}

	public String getFdNm() {
		return fdNm;
	}

	public void setFdNm(String fdNm) {
		this.fdNm = fdNm;
	}

	public String getMatrlInfo() {
		return matrlInfo;
	}

	public void setMatrlInfo(String matrlInfo) {
		this.matrlInfo = matrlInfo;
	}

	public String getCkngMthInfo() {
		return ckngMthInfo;
	}

	public void setCkngMthInfo(String ckngMthInfo) {
		this.ckngMthInfo = ckngMthInfo;
	}

	public String getNtkQyInfo() {
		return ntkQyInfo;
	}

	public void setNtkQyInfo(String ntkQyInfo) {
		this.ntkQyInfo = ntkQyInfo;
	}

	public String getCrbhInfo() {
		return crbhInfo;
	}

	public void setCrbhInfo(String crbhInfo) {
		this.crbhInfo = crbhInfo;
	}

	public String getClriInfo() {
		return clriInfo;
	}

	public void setClriInfo(String clriInfo) {
		this.clriInfo = clriInfo;
	}

	public String getProtInfo() {
		return protInfo;
	}

	public void setProtInfo(String protInfo) {
		this.protInfo = protInfo;
	}

	public String getNtrfsInfo() {
		return ntrfsInfo;
	}

	public void setNtrfsInfo(String ntrfsInfo) {
		this.ntrfsInfo = ntrfsInfo;
	}

	public String getChlsInfo() {
		return chlsInfo;
	}

	public void setChlsInfo(String chlsInfo) {
		this.chlsInfo = chlsInfo;
	}

	public String getCrfbInfo() {
		return crfbInfo;
	}

	public void setCrfbInfo(String crfbInfo) {
		this.crfbInfo = crfbInfo;
	}

	public String getClciInfo() {
		return clciInfo;
	}

	public void setClciInfo(String clciInfo) {
		this.clciInfo = clciInfo;
	}

	public String getIrcnInfo() {
		return ircnInfo;
	}

	public void setIrcnInfo(String ircnInfo) {
		this.ircnInfo = ircnInfo;
	}

	public String getNaInfo() {
		return naInfo;
	}

	public void setNaInfo(String naInfo) {
		this.naInfo = naInfo;
	}

	public String getFrmlasaltEqvlntqyInfo() {
		return frmlasaltEqvlntqyInfo;
	}

	public void setFrmlasaltEqvlntqyInfo(String frmlasaltEqvlntqyInfo) {
		this.frmlasaltEqvlntqyInfo = frmlasaltEqvlntqyInfo;
	}

	public String getVtmaInfo() {
		return vtmaInfo;
	}

	public void setVtmaInfo(String vtmaInfo) {
		this.vtmaInfo = vtmaInfo;
	}

	public String getVtmbInfo() {
		return vtmbInfo;
	}

	public void setVtmbInfo(String vtmbInfo) {
		this.vtmbInfo = vtmbInfo;
	}

	public String getVtmcInfo() {
		return vtmcInfo;
	}

	public void setVtmcInfo(String vtmcInfo) {
		this.vtmcInfo = vtmcInfo;
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

	public String getRtnFileCours() {
		return rtnFileCours;
	}

	public void setRtnFileCours(String rtnFileCours) {
		this.rtnFileCours = rtnFileCours;
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
