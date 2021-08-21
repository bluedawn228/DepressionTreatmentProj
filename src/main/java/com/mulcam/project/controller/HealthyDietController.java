package com.mulcam.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.HealthyDietVO;
import com.mulcam.project.vo.OpenApiRecomendDietDtlVO;
import com.mulcam.project.vo.OpenApiRecomendDietVO;

public interface HealthyDietController {
	
	// 건강식단 초기 로딩 (12개)
	public ModelAndView healthydiet() throws Exception;
	
	// 건강식단 추가 로딩
	public List<HealthyDietVO> dietScrollDownPOST(HealthyDietVO vo);
	
	// 농사로 건강식단 API 호출_recomendDietList(식단 목록)
	public ArrayList<OpenApiRecomendDietVO> healthyDietRecomendDietList(String dietSeCode) throws Exception ;
	
	// 농사로 건강식단 API 호출_recomendDietDtl(식단 상세 - 요리별 정보)
	public ArrayList<OpenApiRecomendDietDtlVO> healthyDietRecomendDietDtl(int cntntsNo) throws Exception;
	
}
