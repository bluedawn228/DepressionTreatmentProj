package com.mulcam.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.ConsolationDAO;
import com.mulcam.project.vo.ConsolationVO;

@Service
public class ConsolationServiceImpl implements ConsolationService {
	
	@Autowired
	ConsolationDAO dao;
	
	@Override
	public int boardCount() throws Exception {
		
		return dao.boardCount();
	}
	
	@Override
	public ConsolationVO randomSelection() throws Exception{
		
		double min = 1;
		double max = dao.boardCount();
		
		// 1번 게시물 부터 최종 게시물 사이의 임의의 게시번호 생성
		int random = (int) (( Math.random() * (max - min)) + min);
		
		ConsolationVO vo = dao.selectOneRandom(random);
		vo.setCount(dao.boardCount());
		return vo;
	}

}
