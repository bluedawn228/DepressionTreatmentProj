package com.mulcam.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.HealthyDietVO;
import com.mulcam.project.vo.OpenApiRecomendDietVO;

@Mapper
@Repository
public interface HealthyDietDAO {

	public ArrayList<HealthyDietVO> selectAllArticle();

	public HealthyDietVO selectArticleById(String idx);

	public int selectHealthyDietIdxMax();
	
	public void insertHealthyDietMain(OpenApiRecomendDietVO diet);

	public List<HealthyDietVO> selectNextPosts(int numToStart);

}
