package com.mulcam.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.DepressionInventoryVO;

@Mapper
@Repository
public interface DepressionInventoryDAO {
	
	public  ArrayList<DepressionInventoryVO> selectAllQuestions();

}
