package com.mulcam.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.POIBoardVO;

public interface POIBoardController {
	
	//소개 페이지
	public String recmIntroduce();
	
	// 게시판 조회
	public ModelAndView poiBoardSort( String type, String sortId, String sortOrder, int page,
																String colSortID, String colSortOrder,
																String filterDivision, String filterProvince, String filterRate) throws Exception;
		

	public ModelAndView poiBoardColumnSort(String sortId, String sortOrder,String colSortID, String colSortOrder, int page) throws Exception;
	
	public ModelAndView poiBoardFilter(String sortId, String sortOrder, String filterDivision, String filterProvince,String filterRate, int page) throws Exception;
	
	public ModelAndView poiBoardDetail(int bno, int page) throws Exception;
	
	public String poiBoardInsertForm();
	
	public ModelAndView poiBoardInsert(POIBoardVO board, AbstractMultipartHttpServletRequest multi) throws Exception;
	
	public String poiBoardUpdateForm(int bno, Model model) throws Exception;
	
	public String poiBoardUpdate(HttpServletRequest request) throws Exception ;
	
	public ModelAndView poiBoardDelete(int bno, int page) throws Exception;
	
	public void fileDown(int bno, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView boardSearch(String searchText, int page) throws Exception;
	
	public String juso(HttpServletRequest request, Model model) throws Exception;
	
	

}
