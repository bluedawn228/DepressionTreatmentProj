package com.mulcam.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.ConsolationVO;

@Mapper
@Repository
public interface ConsolationDAO {
	
	public int boardCount();
	
	public ConsolationVO selectOneRandom(int num);

}
