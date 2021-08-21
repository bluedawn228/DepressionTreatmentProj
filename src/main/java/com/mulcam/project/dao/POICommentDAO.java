package com.mulcam.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.POICommentVO;

@Mapper
@Repository
public interface POICommentDAO {
	
	//댓글 개수
	public int commentCount(int bno) throws Exception;
	
	//댓글 목록
	public ArrayList<POICommentVO> commentList(int bno) throws Exception;
	
	//댓글 작성
	public int commentInsert(POICommentVO vo) throws Exception;
	
	//댓글 수정
	public int commentUpdate(POICommentVO vo) throws Exception;
	
	//댓글 삭제
	public int commentDelete(int cno) throws Exception;
	
	//댓글 최종번호
	public int selectMaxCno(int bno) throws Exception;

}
