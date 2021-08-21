package com.mulcam.project.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import com.mulcam.project.common.XmlParserUtil;
import com.mulcam.project.service.HealthyDietServiceImpl;
import com.mulcam.project.vo.HealthyDietVO;
import com.mulcam.project.vo.OpenApiRecomendDietDtlVO;
import com.mulcam.project.vo.OpenApiRecomendDietVO;
import com.mulcam.project.vo.OpenApiReqParamVO;

@Controller
public class HealthyDietControllerImpl implements HealthyDietController {

  @Autowired
  HealthyDietServiceImpl service;

  // 건강정보 목록
  @GetMapping("/HealthyDiet")
  public ModelAndView healthydiet() throws Exception {

    ModelAndView modelAndView = new ModelAndView("healthydiet");
    ArrayList<HealthyDietVO> hdList = service.searchAllHealthyDiet();
    modelAndView.addObject("hdList", hdList);
    return modelAndView;
  }

  // 스크롤 다운시 추가 게시글 로딩
  @Override
  @RequestMapping(value = "/dietScrollDown", method = RequestMethod.POST)
  public @ResponseBody List<HealthyDietVO> dietScrollDownPOST(@RequestBody HealthyDietVO vo) {
    System.out.println("==================   dietScrollDownPOST is called   ===================");

    int numToStart = vo.getNum() + 1;

    return service.dietScrollDown(numToStart);
  } // infiniteScrollDownPOST()


  // 건강정보 상세
  // 속도가 너무 더뎌_recomendDietList API 정보는 JTB_HEALTHYDIET_MAIN 테이블에 저장했다.
  // JTB_HEALTHYDIET_detail 테이블 정보는 _recomendDietDtl API로 대체(식단 상세 - 요리별 정보)
  @GetMapping("/healthyDietDetail")
  public ModelAndView healthydietdetail(@RequestParam("idx") String idx) throws Exception {
    ModelAndView modelAndView = new ModelAndView("healthydietdetail");

    System.out.println("HealthyDietDetail start" + idx);

    try {
      // 게시글 기본 정보 가져오기
      HealthyDietVO hd = service.searchHealthyDietById(idx);

      // 식단을 구성하는 요리들의 상세정보 가져오기
      // - 요리는 식단의 하위 카테고리로 1:N의 관계를 갖는다.
      // - 식단이 가지고 있는 요리의 cntntsNo 만큼 for 문을 돌며 정보를 가져와야 한다.
      ArrayList<OpenApiRecomendDietDtlVO> foodVOList =
          healthyDietRecomendDietDtl(hd.getContentno());

      modelAndView.addObject("hd", hd);
      modelAndView.addObject("foodVOList", foodVOList);

    } catch (Exception e) {
      e.printStackTrace();

      modelAndView.addObject("err", "오류 발생");

      modelAndView.setViewName("error");

    }

    return modelAndView;

  }



  // 농사로 건강식단 API 호출_recomendDietList(식단 목록)
  @GetMapping("/healthyDietRecomendDietList")
  @ResponseBody

  public ArrayList<OpenApiRecomendDietVO> healthyDietRecomendDietList(
      @RequestParam("dietSeCode") String dietSeCode) throws Exception {
    ArrayList<OpenApiRecomendDietVO> apiDietVOList = null;
    try {
      // XML 문서 파싱
      OpenApiReqParamVO paramVO = new OpenApiReqParamVO();
      paramVO.setServiceName("recomendDiet");
      paramVO.setServiceAction("recomendDietList");
      paramVO.setDietSeCode(dietSeCode); // 254001~254005
      paramVO.setNumOfRows("999999999");

      Document doc = XmlParserUtil.XmlToNodeList(paramVO);

      // NodeList items = doc.getElementsByTagName("item");
      int size = doc.getElementsByTagName("item").getLength();
      NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
      NodeList dietNms = doc.getElementsByTagName("dietNm");
      NodeList fdNms = doc.getElementsByTagName("fdNm");
      NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
      NodeList cntntsChargerEsntlNms = doc.getElementsByTagName("cntntsChargerEsntlNm");
      NodeList registDts = doc.getElementsByTagName("registDt");
      NodeList cntntsRdcnts = doc.getElementsByTagName("cntntsRdcnt");
      NodeList rtnFileSeCodes = doc.getElementsByTagName("rtnFileSeCode");
      NodeList rtnFileSns = doc.getElementsByTagName("rtnFileSn");
      NodeList rtnOrginlFileNms = doc.getElementsByTagName("rtnOrginlFileNm");
      NodeList rtnStreFileNms = doc.getElementsByTagName("rtnStreFileNm");
      NodeList rtnImageDcs = doc.getElementsByTagName("rtnImageDc");
      NodeList rtnThumbFileNms = doc.getElementsByTagName("rtnThumbFileNm");
      NodeList rtnImgSeCodes = doc.getElementsByTagName("rtnImgSeCode");


      // OpenApiRecomendDietVO 객체에 담기

      apiDietVOList = new ArrayList<OpenApiRecomendDietVO>();

      if (size == 0) {

        System.out.println("조회한 정보가 없습니다.");
      } else {

        for (int i = 0; i < size; i++) {
          OpenApiRecomendDietVO apiDietVO = new OpenApiRecomendDietVO();

          String cntntsNo = cntntsNos.item(i).getFirstChild() == null ? ""
              : cntntsNos.item(i).getFirstChild().getNodeValue();
          String dietNm = dietNms.item(i).getFirstChild() == null ? ""
              : dietNms.item(i).getFirstChild().getNodeValue();
          String fdNm = fdNms.item(i).getFirstChild() == null ? ""
              : fdNms.item(i).getFirstChild().getNodeValue();
          String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? ""
              : cntntsSjs.item(i).getFirstChild().getNodeValue();
          String cntntsChargerEsntlNm = cntntsChargerEsntlNms.item(i).getFirstChild() == null ? ""
              : cntntsChargerEsntlNms.item(i).getFirstChild().getNodeValue();
          String registDt = registDts.item(i).getFirstChild() == null ? ""
              : registDts.item(i).getFirstChild().getNodeValue();
          String cntntsRdcnt = cntntsRdcnts.item(i).getFirstChild() == null ? ""
              : cntntsRdcnts.item(i).getFirstChild().getNodeValue();
          String rtnFileSeCode = rtnFileSeCodes.item(i).getFirstChild() == null ? ""
              : rtnFileSeCodes.item(i).getFirstChild().getNodeValue();
          String rtnFileSn = rtnFileSns.item(i).getFirstChild() == null ? ""
              : rtnFileSns.item(i).getFirstChild().getNodeValue();
          String rtnOrginlFileNm = rtnOrginlFileNms.item(i).getFirstChild() == null ? ""
              : rtnOrginlFileNms.item(i).getFirstChild().getNodeValue();
          String rtnStreFileNm = rtnStreFileNms.item(i).getFirstChild() == null ? ""
              : rtnStreFileNms.item(i).getFirstChild().getNodeValue();
          String rtnImageDc = rtnImageDcs.item(i).getFirstChild() == null ? ""
              : rtnImageDcs.item(i).getFirstChild().getNodeValue();
          String rtnThumbFileNm = rtnThumbFileNms.item(i).getFirstChild() == null ? ""
              : rtnThumbFileNms.item(i).getFirstChild().getNodeValue();
          String rtnImgSeCode = rtnImgSeCodes.item(i).getFirstChild() == null ? ""
              : rtnImgSeCodes.item(i).getFirstChild().getNodeValue();

          apiDietVO.setCntntsNo(cntntsNo);
          apiDietVO.setDietNm(dietNm);
          apiDietVO.setFdNm(fdNm);
          apiDietVO.setCntntsSj(cntntsSj);
          apiDietVO.setCntntsChargerEsntlNm(cntntsChargerEsntlNm);
          apiDietVO.setRegistDt(registDt);
          apiDietVO.setCntntsRdcnt(cntntsRdcnt);
          apiDietVO.setRtnFileSeCode(rtnFileSeCode);
          apiDietVO.setRtnFileSn(rtnFileSn);
          apiDietVO.setRtnOrginlFileNm(rtnOrginlFileNm);
          apiDietVO.setRtnStreFileNm(rtnStreFileNm);
          apiDietVO.setRtnImageDc(rtnImageDc);
          apiDietVO.setRtnThumbFileNm(rtnThumbFileNm);
          apiDietVO.setRtnImgSeCode(rtnImgSeCode);

          apiDietVOList.add(apiDietVO);
        }

      }

      System.out.println(apiDietVOList.size());


      // modelAndView.addObject(apiDietVOList);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return apiDietVOList;
  }

  // 농사로 건강식단 API 호출_recomendDietDtl(식단 상세 - 요리별 정보)
  @GetMapping("/healthyDietRecomendDietDtl")
  @ResponseBody
  public ArrayList<OpenApiRecomendDietDtlVO> healthyDietRecomendDietDtl(
      @RequestParam("cntntsNo") int cntntsNo) throws Exception {
    // ModelAndView modelAndView = new ModelAndView("");
    ArrayList<OpenApiRecomendDietDtlVO> apiDietDtlVOList = null;
    System.out.println("");
    System.out.println("healthyDietRecomendDietDtl cntntsNo : " + cntntsNo);
    System.out.println("");
    try {
      // XML 문서 파싱
      OpenApiReqParamVO paramVO = new OpenApiReqParamVO();
      paramVO.setServiceName("recomendDiet");
      paramVO.setServiceAction("recomendDietDtl");

      paramVO.setCntntsNo(cntntsNo); // 185002

      Document doc = XmlParserUtil.XmlToNodeList(paramVO);

      // NodeList items = doc.getElementsByTagName("item");
      int size = doc.getElementsByTagName("item").getLength();
      NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
      NodeList dietDtlNms = doc.getElementsByTagName("dietDtlNm");
      NodeList dietNms = doc.getElementsByTagName("dietNm");
      NodeList fdInfoFirsts = doc.getElementsByTagName("fdInfoFirst");
      NodeList fdInfos = doc.getElementsByTagName("fdInfo");
      NodeList dietNtrsmallInfos = doc.getElementsByTagName("dietNtrsmallInfo");
      NodeList dietCns = doc.getElementsByTagName("dietCn");
      NodeList fdCntntsNos = doc.getElementsByTagName("fdCntntsNo");
      NodeList fdNms = doc.getElementsByTagName("fdNm");
      NodeList matrlInfos = doc.getElementsByTagName("matrlInfo");
      NodeList ckngMthInfos = doc.getElementsByTagName("ckngMthInfo");
      NodeList ntkQyInfos = doc.getElementsByTagName("ntkQyInfo");
      NodeList crbhInfos = doc.getElementsByTagName("crbhInfo");
      NodeList clriInfos = doc.getElementsByTagName("clriInfo");
      NodeList protInfos = doc.getElementsByTagName("protInfo");
      NodeList ntrfsInfos = doc.getElementsByTagName("ntrfsInfo");
      NodeList chlsInfos = doc.getElementsByTagName("chlsInfo");
      NodeList crfbInfos = doc.getElementsByTagName("crfbInfo");
      NodeList clciInfos = doc.getElementsByTagName("clciInfo");
      NodeList ircnInfos = doc.getElementsByTagName("ircnInfo");
      NodeList naInfos = doc.getElementsByTagName("naInfo");
      NodeList frmlasaltEqvlntqyInfos = doc.getElementsByTagName("frmlasaltEqvlntqyInfo");
      NodeList vtmaInfos = doc.getElementsByTagName("vtmaInfo");
      NodeList vtmbInfos = doc.getElementsByTagName("vtmbInfo");
      NodeList vtmcInfos = doc.getElementsByTagName("vtmcInfo");
      NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
      NodeList cntntsChargerEsntlNms = doc.getElementsByTagName("cntntsChargerEsntlNm");
      NodeList registDts = doc.getElementsByTagName("registDt");
      NodeList cntntsRdcnts = doc.getElementsByTagName("cntntsRdcnt");
      NodeList rtnFileSeCodes = doc.getElementsByTagName("rtnFileSeCode");
      NodeList rtnFileSns = doc.getElementsByTagName("rtnFileSn");
      NodeList rtnOrginlFileNms = doc.getElementsByTagName("rtnOrginlFileNm");
      NodeList rtnStreFileNms = doc.getElementsByTagName("rtnStreFileNm");
      NodeList rtnFileCourss = doc.getElementsByTagName("rtnFileCours");
      NodeList rtnImageDcs = doc.getElementsByTagName("rtnImageDc");
      NodeList rtnThumbFileNms = doc.getElementsByTagName("rtnThumbFileNm");
      NodeList rtnImgSeCodes = doc.getElementsByTagName("rtnImgSeCode");



      // OpenApiRecomendDietDtlVO 객체에 담기

      apiDietDtlVOList = new ArrayList<OpenApiRecomendDietDtlVO>();

      if (size == 0) {

        System.out.println("조회한 정보가 없습니다.");
      } else {

        for (int i = 0; i < size; i++) {
          OpenApiRecomendDietDtlVO apiDietDtlVO = new OpenApiRecomendDietDtlVO();

          String cntntsNum = cntntsNos.item(i).getFirstChild() == null ? ""
              : cntntsNos.item(i).getFirstChild().getNodeValue();
          String dietDtlNm = dietDtlNms.item(i).getFirstChild() == null ? ""
              : dietDtlNms.item(i).getFirstChild().getNodeValue();
          String dietNm = dietNms.item(i).getFirstChild() == null ? ""
              : dietNms.item(i).getFirstChild().getNodeValue();
          String fdInfoFirst = fdInfoFirsts.item(i).getFirstChild() == null ? ""
              : fdInfoFirsts.item(i).getFirstChild().getNodeValue();
          String fdInfo = fdInfos.item(i).getFirstChild() == null ? ""
              : fdInfos.item(i).getFirstChild().getNodeValue();
          String dietNtrsmallInfo = dietNtrsmallInfos.item(i).getFirstChild() == null ? ""
              : dietNtrsmallInfos.item(i).getFirstChild().getNodeValue();
          String dietCn = dietCns.item(i).getFirstChild() == null ? ""
              : dietCns.item(i).getFirstChild().getNodeValue();
          String fdCntntsNo = fdCntntsNos.item(i).getFirstChild() == null ? ""
              : fdCntntsNos.item(i).getFirstChild().getNodeValue();
          String fdNm = fdNms.item(i).getFirstChild() == null ? ""
              : fdNms.item(i).getFirstChild().getNodeValue();
          String matrlInfo = matrlInfos.item(i).getFirstChild() == null ? ""
              : matrlInfos.item(i).getFirstChild().getNodeValue();
          String ckngMthInfo = ckngMthInfos.item(i).getFirstChild() == null ? ""
              : ckngMthInfos.item(i).getFirstChild().getNodeValue();
          String ntkQyInfo = ntkQyInfos.item(i).getFirstChild() == null ? ""
              : ntkQyInfos.item(i).getFirstChild().getNodeValue();
          String crbhInfo = crbhInfos.item(i).getFirstChild() == null ? ""
              : crbhInfos.item(i).getFirstChild().getNodeValue();
          String clriInfo = clriInfos.item(i).getFirstChild() == null ? ""
              : clriInfos.item(i).getFirstChild().getNodeValue();
          String protInfo = protInfos.item(i).getFirstChild() == null ? ""
              : protInfos.item(i).getFirstChild().getNodeValue();
          String ntrfsInfo = ntrfsInfos.item(i).getFirstChild() == null ? ""
              : ntrfsInfos.item(i).getFirstChild().getNodeValue();
          String chlsInfo = chlsInfos.item(i).getFirstChild() == null ? ""
              : chlsInfos.item(i).getFirstChild().getNodeValue();
          String crfbInfo = crfbInfos.item(i).getFirstChild() == null ? ""
              : crfbInfos.item(i).getFirstChild().getNodeValue();
          String clciInfo = clciInfos.item(i).getFirstChild() == null ? ""
              : clciInfos.item(i).getFirstChild().getNodeValue();
          String ircnInfo = ircnInfos.item(i).getFirstChild() == null ? ""
              : ircnInfos.item(i).getFirstChild().getNodeValue();
          String naInfo = naInfos.item(i).getFirstChild() == null ? ""
              : naInfos.item(i).getFirstChild().getNodeValue();
          String frmlasaltEqvlntqyInfo = frmlasaltEqvlntqyInfos.item(i).getFirstChild() == null ? ""
              : frmlasaltEqvlntqyInfos.item(i).getFirstChild().getNodeValue();
          String vtmaInfo = vtmaInfos.item(i).getFirstChild() == null ? ""
              : vtmaInfos.item(i).getFirstChild().getNodeValue();
          String vtmbInfo = vtmbInfos.item(i).getFirstChild() == null ? ""
              : vtmbInfos.item(i).getFirstChild().getNodeValue();
          String vtmcInfo = vtmcInfos.item(i).getFirstChild() == null ? ""
              : vtmcInfos.item(i).getFirstChild().getNodeValue();
          String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? ""
              : cntntsSjs.item(i).getFirstChild().getNodeValue();
          String cntntsChargerEsntlNm = cntntsChargerEsntlNms.item(i).getFirstChild() == null ? ""
              : cntntsChargerEsntlNms.item(i).getFirstChild().getNodeValue();
          String registDt = registDts.item(i).getFirstChild() == null ? ""
              : registDts.item(i).getFirstChild().getNodeValue();
          String cntntsRdcnt = cntntsRdcnts.item(i).getFirstChild() == null ? ""
              : cntntsRdcnts.item(i).getFirstChild().getNodeValue();
          String rtnFileSeCode = rtnFileSeCodes.item(i).getFirstChild() == null ? ""
              : rtnFileSeCodes.item(i).getFirstChild().getNodeValue();
          String rtnFileSn = rtnFileSns.item(i).getFirstChild() == null ? ""
              : rtnFileSns.item(i).getFirstChild().getNodeValue();
          String rtnOrginlFileNm = rtnOrginlFileNms.item(i).getFirstChild() == null ? ""
              : rtnOrginlFileNms.item(i).getFirstChild().getNodeValue();
          String rtnStreFileNm = rtnStreFileNms.item(i).getFirstChild() == null ? ""
              : rtnStreFileNms.item(i).getFirstChild().getNodeValue();
          String rtnFileCours = rtnFileCourss.item(i).getFirstChild() == null ? ""
              : rtnFileCourss.item(i).getFirstChild().getNodeValue();
          String rtnImageDc = rtnImageDcs.item(i).getFirstChild() == null ? ""
              : rtnImageDcs.item(i).getFirstChild().getNodeValue();
          String rtnThumbFileNm = rtnThumbFileNms.item(i).getFirstChild() == null ? ""
              : rtnThumbFileNms.item(i).getFirstChild().getNodeValue();
          String rtnImgSeCode = rtnImgSeCodes.item(i).getFirstChild() == null ? ""
              : rtnImgSeCodes.item(i).getFirstChild().getNodeValue();

          System.out.println("컨텐츠 번호 : " + cntntsNum);
          System.out.println("식단 상세명  : " + dietDtlNm);
          System.out.println("식단 명  : " + dietNm);
          System.out.println("음식 순서  : " + fdInfoFirst);
          System.out.println("음식 정보  : " + fdInfo);
          System.out.println("식단 영양소 정보  : " + dietNtrsmallInfo);
          System.out.println("식단 내용  : " + dietCn);
          System.out.println("음식 컨텐츠 번호  : " + fdCntntsNo);
          System.out.println("음식 명  : " + fdNm);
          System.out.println("재료 정보  : " + matrlInfo);
          System.out.println("조리 방법 정보  : " + ckngMthInfo);


          apiDietDtlVO.setCntntsNo(cntntsNum);
          apiDietDtlVO.setDietDtlNm(dietDtlNm);
          apiDietDtlVO.setDietNm(dietNm);
          apiDietDtlVO.setFdInfoFirst(fdInfoFirst);
          apiDietDtlVO.setFdInfo(fdInfo);
          apiDietDtlVO.setDietNtrsmallInfo(dietNtrsmallInfo);
          apiDietDtlVO.setDietCn(dietCn);
          apiDietDtlVO.setFdCntntsNo(fdCntntsNo);
          apiDietDtlVO.setFdNm(fdNm);
          apiDietDtlVO.setMatrlInfo(matrlInfo);
          apiDietDtlVO.setCkngMthInfo(ckngMthInfo);
          apiDietDtlVO.setNtkQyInfo(ntkQyInfo);
          apiDietDtlVO.setCrbhInfo(crbhInfo);
          apiDietDtlVO.setClriInfo(clriInfo);
          apiDietDtlVO.setProtInfo(protInfo);
          apiDietDtlVO.setNtrfsInfo(ntrfsInfo);
          apiDietDtlVO.setChlsInfo(chlsInfo);
          apiDietDtlVO.setCrfbInfo(crfbInfo);
          apiDietDtlVO.setClciInfo(clciInfo);
          apiDietDtlVO.setIrcnInfo(ircnInfo);
          apiDietDtlVO.setNaInfo(naInfo);

          apiDietDtlVO.setFrmlasaltEqvlntqyInfo(frmlasaltEqvlntqyInfo);
          apiDietDtlVO.setVtmaInfo(vtmaInfo);
          apiDietDtlVO.setVtmbInfo(vtmbInfo);
          apiDietDtlVO.setVtmcInfo(vtmcInfo);
          apiDietDtlVO.setCntntsSj(cntntsSj);
          apiDietDtlVO.setCntntsChargerEsntlNm(cntntsChargerEsntlNm);
          apiDietDtlVO.setRegistDt(registDt);
          apiDietDtlVO.setCntntsRdcnt(cntntsRdcnt);

          apiDietDtlVO.setRtnFileSeCode(rtnFileSeCode);
          apiDietDtlVO.setRtnFileSn(rtnFileSn);
          apiDietDtlVO.setRtnOrginlFileNm(rtnOrginlFileNm);
          apiDietDtlVO.setRtnStreFileNm(rtnStreFileNm);
          apiDietDtlVO.setRtnFileCours(rtnFileCours);
          apiDietDtlVO.setRtnImageDc(rtnImageDc);
          apiDietDtlVO.setRtnThumbFileNm(rtnThumbFileNm);
          apiDietDtlVO.setRtnImgSeCode(rtnImgSeCode);

          apiDietDtlVOList.add(apiDietDtlVO);
        }

      }

      System.out.println(apiDietDtlVOList.size());


      // modelAndView.addObject(apiDietDtlVOList);

    } catch (Exception e) {
      e.printStackTrace();
    }
    // return modelAndView;
    return apiDietDtlVOList;
  }

}
