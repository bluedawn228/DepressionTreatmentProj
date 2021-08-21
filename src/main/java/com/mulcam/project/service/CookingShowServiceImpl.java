package com.mulcam.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.CookingShowDAO;
import com.mulcam.project.vo.CookingShowCommentsVO;
import com.mulcam.project.vo.CookingShowDetailVO;
import com.mulcam.project.vo.CookingShowReasonsVO;
import com.mulcam.project.vo.CookingShowVO;

@Service
public class CookingShowServiceImpl implements CookingShowService {

	@Autowired
	CookingShowDAO cookingShowDAO;

	@Override
	public List<CookingShowVO> searchAllArticle() {

		System.out.println("CookingShowServiceImpl searchAllArticle");

		return cookingShowDAO.selectAllArticle();
	}

	@Override
	public void addRecommendation(String articleId) {
		System.out.println("CookingShowServiceImpl addRecommendation");

		cookingShowDAO.updateRecommendation(articleId);

	}

	@Override
	public String searchRecommendation(String articleId) {
		System.out.println("CookingShowServiceImpl searchRecommendation");

		return cookingShowDAO.selectRecommendationById(articleId);
	}

	@Override
	public CookingShowVO searchCookingShowById(String articleId) {
		System.out.println("searchCookingShowById");

		return cookingShowDAO.selectArticleById(articleId);
	}

	@Override
	public List<CookingShowDetailVO> searchCookingShowDetailById(String articleId) {
		System.out.println("searchCookingShowDetailById");

		return cookingShowDAO.selectArticleDetailById(articleId);
	}

	@Override
	public List<CookingShowCommentsVO> searchCookingShowCommentsById(String articleId) {
		System.out.println("searchCookingShowCommentsById");

		return cookingShowDAO.selectArticleCommentsById(articleId);
	}

	@Override
	public void addCookingShowComments(CookingShowCommentsVO csc) {
		System.out.println("CookingShowServiceImpl addCookingShowComments");

		cookingShowDAO.insertComments(csc);
	}

	@Override
	public void addCookingShowMain(CookingShowVO cs) {
		System.out.println("CookingShowServiceImpl addCookingShowMain");

		cookingShowDAO.insertArticleMain(cs);
	}

	@Override
	public void addCookingShowDetail(CookingShowVO cs) {
		System.out.println("CookingShowServiceImpl addCookingShowDetail");

		for (CookingShowReasonsVO r : cs.getReasonsVOList()) {
			cookingShowDAO.insertArticleDetail(r);

		}
		
	}

	@Override
	public int searchCurrentIdx() {
		System.out.println("CookingShowServiceImpl searchCurrentIdx");

		return cookingShowDAO.selectMaxIdx();
	}

}