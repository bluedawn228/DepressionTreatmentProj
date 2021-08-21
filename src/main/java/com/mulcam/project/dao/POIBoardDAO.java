package com.mulcam.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.POIBoardVO;
import com.mulcam.project.vo.POIFileVO;

@Mapper
@Repository
public interface POIBoardDAO {
	
	//게시글 개수
	public int boardCount()  throws Exception;
	
	//게시글 목차
	public ArrayList<POIBoardVO> boardList(int startrow) throws Exception;
	
	//게시글 상세
	public POIBoardVO boardDetail(int bno) throws Exception;
	
	//게시글 작성
	public void boardInsert(POIBoardVO vo) throws Exception;
	
	//게시글 수정
	public void boardUpdate(POIBoardVO vo)	 throws Exception;
	
	//게시글 삭제
	public void boardDelete(int bno) throws Exception;
	
	//게시글 최종 번호 조회
	public int selectMaxBno() throws Exception;
	
	//게시글 파일 최종 번호 조회
	public int selectMaxFno() throws Exception;
	
	//게시글 파일 입력
	public int fileInsert(POIFileVO vo) throws Exception;
	
	//게시글 파일 목록
	public POIFileVO fileDetail(int bno) throws Exception;
	
	//게시글 검색 @Param("a") A a, @Param("b") B b)
	public ArrayList<POIBoardVO> selectByText(@Param("searchText") String searchText, @Param("startrow") int startrow) throws Exception;

	//게시글 정렬 @Param("a") A a, @Param("b") B b)
	public ArrayList<POIBoardVO> boardListSort(@Param("sortId") String sortId, @Param("sortOrder") String sortOrder, @Param("startrow") int startrow) throws Exception;
	
	//게시글 컬럼기준 정렬 @Param("a") A a, @Param("b") B b)
	public ArrayList<POIBoardVO> boardListColumnSort(@Param("colSortId") String colSortId, @Param("colSortOrder") String colSortOrder, @Param("startrow") int startrow) throws Exception;

	// 시도 목록
	public ArrayList<String> selectProvinceList() throws Exception;
	
	// 등 목록
	public ArrayList<String> selectRateList() throws Exception;

	// 게시글 필터링
	public ArrayList<POIBoardVO> boardListFilter(@Param("sortId") String sortId, @Param("sortOrder") String sortOrder, @Param("filterDivision") String filterDivision, @Param("filterProvince") String filterProvince, @Param("filterRate") String filterRate, @Param("startrow") int startrow) throws Exception;

	public int boardCountFilter(@Param("filterDivision") String filterDivision, @Param("filterProvince") String filterProvince, @Param("filterRate") String filterRate);
	

}
