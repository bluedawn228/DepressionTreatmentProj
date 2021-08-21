
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		var form=document.getElementById("signup_form");
		form.address.value = roadFullAddr;
		//jusoForm.roadAddrPart1.value = roadAddrPart1;
		//jusoForm.roadAddrPart2.value = roadAddrPart2;
		//jusoForm.addrDetail.value = addrDetail;
	//	jusoForm.engAddr.value = engAddr;
	//	jusoForm.jibunAddr.value = jibunAddr;
///		jusoForm.zipNo.value = zipNo;
//		jusoForm.admCd.value = admCd;
//		jusoForm.rnMgtSn.value = rnMgtSn;
//		jusoForm.bdMgtSn.value = bdMgtSn;
//		jusoForm.detBdNmList.value = detBdNmList;
		/** 2017년 2월 추가제공 **/
	//	jusoForm.bdNm.value = bdNm;
	//	jusoForm.bdKdcd.value = bdKdcd;
//		jusoForm.siNm.value = siNm;
//		jusoForm.sggNm.value = sggNm;
	//	jusoForm.emdNm.value = emdNm;
//	jusoForm.liNm.value = liNm;
//		jusoForm.rn.value = rn;
//		jusoForm.udrtYn.value = udrtYn;
//	jusoForm.buldMnnm.value = buldMnnm;
//		jusoForm.buldSlno.value = buldSlno;
//		jusoForm.mtYn.value = mtYn;
//		jusoForm.lnbrMnnm.value = lnbrMnnm;
//		jusoFormlnbrSlno.value = lnbrSlno;
		/** 2017년 3월 추가제공 **/
//		jusoForm.emdNo.value = emdNo;
		
}
