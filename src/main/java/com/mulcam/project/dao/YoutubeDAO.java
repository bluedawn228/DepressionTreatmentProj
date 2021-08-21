package com.mulcam.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.YoutubeVO;

@Mapper
@Repository
public interface YoutubeDAO {
	
	public void insertYoutube(YoutubeVO vo);
	
	public int selectMaxId();
	
	public ArrayList<YoutubeVO> selectAllYoutube(int startrow);

	public List<YoutubeVO> selectNextPosts(int bnoToStart);

	public List<YoutubeVO> selectPreviousPosts(int firstbno);

	public void deleteItem(String itemKey);
	
	
	public YoutubeVO selectOneYoutube(int itemNum);
	
	public int selectMaxNum();
	
	

}
