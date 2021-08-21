package com.mulcam.project.service;

import java.util.ArrayList;
import java.util.List;

import com.mulcam.project.vo.YoutubeVO;

public interface YoutubeService {
	
	public void addYoutube(YoutubeVO vo);
	
	public ArrayList<YoutubeVO> getAllYoutube(int startrow);
	
	public List<YoutubeVO> infiniteScrollDown(int bnoToStart);
	
	public List<YoutubeVO> infiniteScrollUp(int firstbno);

	public void deleteYoutube(String itemKey);
	
	public YoutubeVO getOneYoutube();

}
