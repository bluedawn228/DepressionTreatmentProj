package com.mulcam.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.HealthyDietDAO;
import com.mulcam.project.vo.HealthyDietVO;
import com.mulcam.project.vo.OpenApiRecomendDietVO;

@Service
public class HealthyDietServiceImpl implements HealthyDietService {
	
	@Autowired
	HealthyDietDAO dao;
		
	@Override
	public ArrayList<HealthyDietVO> searchAllHealthyDiet() {
		
		return dao.selectAllArticle();
	}
	
	@Override
	public List<HealthyDietVO> dietScrollDown(int numToStart) {

		return dao.selectNextPosts(numToStart);
	}

	@Override
	public HealthyDietVO searchHealthyDietById(String idx) {
		
	 System.out.println("searchHealthyDietById  idx  " + idx );
		
		return dao.selectArticleById(idx);
	}

		@Override
	public void copyHealthyDietMain(OpenApiRecomendDietVO diet) {
		dao.insertHealthyDietMain(diet);
		
	}

	@Override
	public int searchHealthyDietMaxIdx() {
		
		return dao.selectHealthyDietIdxMax();
	}

}
