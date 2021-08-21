package com.mulcam.project.service;

import java.util.ArrayList;

import com.mulcam.project.vo.POICommentVO;

public interface POICommentService {
	
	public int commentCount(int bno) throws Exception;
	
	public ArrayList<POICommentVO> commentList(int bno) throws Exception;
	
	public int commentInsert(POICommentVO vo) throws Exception;
	
	public int commentUpdate(POICommentVO vo) throws Exception;
	
	public int commentDelete(int cno) throws Exception;

}
