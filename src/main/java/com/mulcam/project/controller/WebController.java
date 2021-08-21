package com.mulcam.project.controller;

import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.MemberVO;

public interface WebController {

	public ModelAndView index(MemberVO userinfo);

	
	public String intoduce();
	
	public String introPurpose() ;
	
	public String introContributors() ;
	
	
	public String inventoryCes() ;
	
	public String inventoryPic() ;
	
	public String chore() ;
	
	public ModelAndView choreStory() throws Exception;
	
	public String medi() ;
	
	public String mediStep01() ;
	
	public String mediCommunity() ;
	
	
	public String mypage();
	
	public String mypageHistory() ;
	
	public String mypageNotes() ;

	
	public String utilAlarm() ;
	
}
