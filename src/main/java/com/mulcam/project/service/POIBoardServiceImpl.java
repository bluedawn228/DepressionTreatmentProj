package com.mulcam.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.POIBoardDAO;
import com.mulcam.project.vo.POIBoardVO;
import com.mulcam.project.vo.POIFileVO;
import com.mulcam.project.vo.PageInfo;

@Service
public class POIBoardServiceImpl implements POIBoardService{
	
	@Autowired
	POIBoardDAO dao;
	
	@Override
	public int boardCount() throws Exception {
		
		return dao.boardCount();
	}
	
	//게시글 상세
	@Override
	public POIBoardVO boardDetail(int bno) throws Exception {
		return dao.boardDetail(bno);
	}
	
	//게시글 작성
	@Override
	public int boardInsert(POIBoardVO vo) throws Exception{
		try {
			int maxBno = dao.selectMaxBno();
			vo.setBno(maxBno+1);
			dao.boardInsert(vo);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	};
	
	//게시글 수정
	@Override
	public int boardUpdate(POIBoardVO vo)	 throws Exception{
		try {
			dao.boardUpdate(vo);
			return 1;
		} catch(Exception e) {
			return 0;
		}
	};
	
	//게시글 삭제
	@Override
	public void boardDelete(int bno) throws Exception{
		dao.boardDelete(bno);
	};
	
	//게시글 파일 첨부
	@Override
	public int fileUpload(POIFileVO vo) throws Exception{
		
		try{
			int maxFno = dao.selectMaxFno();
			vo.setFno(maxFno+1);
			dao.fileInsert(vo);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//게시글 최종 BNO
	@Override
	public int currentBno() throws Exception {
		return dao.selectMaxBno();
	}
	
	//게시글 파일 목록
	@Override
	public POIFileVO fileDetail(int bno) throws Exception {
		return dao.fileDetail(bno);
	}

	//게시글 검색
	@Override
	public ArrayList<POIBoardVO> searchPOIBoard(String searchText, int page, PageInfo pageInfo) throws Exception{
		int startrow = calcStartrow(page, pageInfo);
		
		return dao.selectByText(searchText, startrow);
  }

	//게시글 정렬
	@Override
	public ArrayList<POIBoardVO> sortPOIBoard(String sortId, String sortOrder, int page, PageInfo pageInfo) throws Exception{
		int startrow = calcStartrow(page, pageInfo);
		
		return dao.boardListSort(sortId, sortOrder, startrow);
	}
	
	//게시글 컬럼기준 정렬
	@Override
	public ArrayList<POIBoardVO> columnSortPOIBoard(String colSortId, String colSortOrder, int page, PageInfo pageInfo) throws Exception{
		int startrow = calcStartrow(page, pageInfo);
		
		return dao.boardListColumnSort(colSortId, colSortOrder, startrow);
	}
	
	//게시글 필터링
	public ArrayList<POIBoardVO> filterPOIBoard(String sortId, String sortOrder, String filterDivision, String filterProvince, String filterRate, int page, PageInfo pageInfo) throws Exception{
		int startrow = calcStartrowFilter(filterDivision,filterProvince, filterRate, page, pageInfo);
		
		System.out.println("POIBoardServiceImpl filterDivision " + filterDivision);
		System.out.println("POIBoardServiceImpl filterProvince " + filterProvince);
		System.out.println("POIBoardServiceImpl filterRate " + filterRate);
		if ( filterDivision.equals("") ) filterDivision = null;
		if ( filterProvince.equals("") ) filterProvince = null;
		if ( filterRate.equals("") ) filterRate = null;
		return dao.boardListFilter(sortId, sortOrder, filterDivision, filterProvince, filterRate, startrow);
	}
	
	
	//페이징 처리
	public int calcStartrow(int page, PageInfo pageInfo) throws Exception {
		
		int listCount = dao.boardCount();
		//총 페이지 수(올림처리)
		int maxPage = (int)Math.ceil((double)listCount/10);
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21,31...)
		int startPage = (((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30...)
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		int startrow = (page-1)*10+1;
		
		return startrow;
		
	}
	
	//페이징 처리
		public int calcStartrowFilter(String filterDivision, String filterProvince, String filterRate, int page, PageInfo pageInfo) throws Exception {
			
			int listCount = dao.boardCountFilter(filterDivision, filterProvince, filterRate);
			//총 페이지 수(올림처리)
			int maxPage = (int)Math.ceil((double)listCount/10);
			//현재 페이지에 보여줄 시작 페이지 수(1,11,21,31...)
			int startPage = (((int) ((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30...)
			int endPage = startPage+10-1;
			if(endPage>maxPage) endPage=maxPage;
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			int startrow = (page-1)*10+1;
			
			return startrow;
			
		}

	@Override
	public ArrayList<String> provinceList() throws Exception {
		return dao.selectProvinceList();
	}
	
	@Override
	public ArrayList<String> rateList() throws Exception {
		return dao.selectRateList();
	}
}
