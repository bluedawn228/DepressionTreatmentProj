package com.mulcam.project.service;

import java.util.ArrayList;

import com.mulcam.project.vo.POIBoardVO;
import com.mulcam.project.vo.POIFileVO;
import com.mulcam.project.vo.PageInfo;

public interface POIBoardService {
	
	public int boardCount() throws Exception;
	
	//게시글 상세
	public POIBoardVO boardDetail(int bno) throws Exception;
	
	//게시글 작성
	public int boardInsert(POIBoardVO vo) throws Exception;
	
	//게시글 수정
	public int boardUpdate(POIBoardVO vo)	 throws Exception;
	
	//게시글 삭제
	public void boardDelete(int bno) throws Exception;
	
	//게시글 파일 첨부
	public int fileUpload(POIFileVO vo) throws Exception;
	
	//게시글 최종 BNO
	public int currentBno() throws Exception;

	//게시글 파일 목록
	public POIFileVO fileDetail(int bno) throws Exception;

	//게시글 검색
	public ArrayList<POIBoardVO> searchPOIBoard(String searchText, int page, PageInfo pageInfo) throws Exception;
	
	//게시글 정렬
	public ArrayList<POIBoardVO> sortPOIBoard(String sortId, String sortOrder, int page, PageInfo pageInfo) throws Exception;
	
	//게시글 컬럼기준 정렬
	public ArrayList<POIBoardVO> columnSortPOIBoard(String colSortId, String colSortOrder, int page, PageInfo pageInfo) throws Exception;
	
	//게시글 필터링
	public ArrayList<POIBoardVO> filterPOIBoard(String sortId, String sortOrder, String filterDivision, String filterProvince, String filterRate, int page, PageInfo pageInfo) throws Exception;

	//페이징 계산
	public int calcStartrow(int page, PageInfo pageInfo) throws Exception;
	
	// 시도 목록
	public ArrayList<String> provinceList() throws Exception;
	
	// 등급 목록
	public ArrayList<String> rateList() throws Exception;
}
