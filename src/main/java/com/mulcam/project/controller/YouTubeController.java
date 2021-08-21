package com.mulcam.project.controller;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.YoutubeVO;

public interface YouTubeController {
	
	public ModelAndView youtube(int page) ;

	public ModelAndView youtubeUpload(YoutubeVO vo) ;
	
	public List<YoutubeVO> infiniteScrollDownPOST(YoutubeVO vo);
	
	public List<YoutubeVO> infiniteScrollUpPOST(YoutubeVO vo);
	
	public ModelAndView deleteYoutube(String itemKey) ;
	

	
}
