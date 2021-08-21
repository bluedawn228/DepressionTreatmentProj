package com.mulcam.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.POICommentDAO;
import com.mulcam.project.vo.POICommentVO;

@Service
public class POICommentServiceImpl implements POICommentService {
	
	@Autowired
	POICommentDAO dao;
	
	@Override
	public int commentCount(int bno) throws Exception{
		return dao.commentCount(bno);
	}
	
	@Override
	public ArrayList<POICommentVO> commentList(int bno) throws Exception{
		return dao.commentList(bno);
	}
	
	@Override
	public int commentInsert(POICommentVO vo) throws Exception{
		int maxCno = dao.selectMaxCno(vo.getBno());
		vo.setCno(maxCno+1);
		System.out.println(maxCno);
		return dao.commentInsert(vo);
	}
	
	@Override
	public int commentUpdate(POICommentVO vo) throws Exception{
		return dao.commentUpdate(vo);
	}
	
	@Override
	public int commentDelete(int cno) throws Exception{
		return dao.commentDelete(cno);
	}

}
