package com.mulcam.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.CookingShowCommentsVO;
import com.mulcam.project.vo.CookingShowDetailVO;
import com.mulcam.project.vo.CookingShowReasonsVO;
import com.mulcam.project.vo.CookingShowVO;

@Mapper
@Repository("cookingShowDAO")
public interface CookingShowDAO {

	public List<CookingShowVO> selectAllArticle();

	public void updateRecommendation(String articleId);

	public String selectRecommendationById(String articleId);

	public CookingShowVO selectArticleById(String articleId);

	public List<CookingShowDetailVO> selectArticleDetailById(String articleId);

	public List<CookingShowCommentsVO> selectArticleCommentsById(String articleId);

	public void insertComments(CookingShowCommentsVO csc);

	public void insertArticleMain(CookingShowVO cs);

	public void insertArticleDetail(CookingShowReasonsVO csr);

	public int selectMaxIdx();
}
