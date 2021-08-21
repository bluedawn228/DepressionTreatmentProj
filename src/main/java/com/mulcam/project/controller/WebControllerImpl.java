package com.mulcam.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.ConsolationService;
import com.mulcam.project.vo.ConsolationVO;
import com.mulcam.project.vo.MemberVO;

@Controller
public class WebControllerImpl implements WebController{

	@Override
	@GetMapping("/")
	public ModelAndView index(@ModelAttribute("userInfo") MemberVO userinfo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("=============== index getmapping ================");
		if (userinfo != null) {
			mv.addObject("userInfo", userinfo);
			System.out.println("index : " + userinfo.getId());
			System.out.println("index : " + userinfo.getName());
			System.out.println("index : " + userinfo.getEmail());
		}
		mv.setViewName("index");

		return mv;
	}

	@Override
	@GetMapping("/intro")
	public String intoduce() {
		
		return "introduce";
	}

	@Override
	@GetMapping("/purpose")
	public String introPurpose() {
		
		return "intro-purpose";
	}
	
	@Override
	@GetMapping("/contributors")
	public String introContributors() {
		
		return "intro-contributors";
	}
	
	@Override
	@GetMapping("/inventory-ces")
	public String inventoryCes() {
		
		return "inventory-bdi";
	}
	
	@Override
	@GetMapping("/inventory-pic")
	public String inventoryPic() {
		
		return "inventory-bdi";
	}
	
	@Override
	@GetMapping("/chore")
	public String chore() {
		
		return "chore-introduce";
	}
	

	@Autowired
	ConsolationService conService;
	
	@Override
	@GetMapping("/chore-story")
	public ModelAndView choreStory() throws Exception {
		ModelAndView mv = new ModelAndView("chore-story");
		
		System.out.println("===========================ConsolationControllerImpl==============================") ;
		
		ConsolationVO vo = conService.randomSelection();
		System.out.println("randomSelection " + vo.getIdx()) ;
		System.out.println("randomSelection " + vo.getTitle()) ;
		System.out.println("randomSelection " + vo.getContent()) ;
		
		mv.addObject("consolation", conService.randomSelection());
		return mv;
	}

	
	@Override
	@GetMapping("/medi")
	public String medi() {
		
		return "medi-introduce";
	}
	
	@Override
	@GetMapping("/medi-step01")
	public String mediStep01() {
		
		return "medi-step01";
	}
	
	@Override
	@GetMapping("/medi-community")
	public String mediCommunity() {
		
		return "medi-community";
	}

	
	@Override
	@GetMapping("/mypage")
	public String mypage() {
		
		return "mypage-personal";
	}
	
	@Override
	@GetMapping("/mypage-history")
	public String mypageHistory() {
		
		return "mypage-history";
	}
	
	@Override
	@GetMapping("/mypage-notes")
	public String mypageNotes() {
		
		return "mypage-notes";
	}
	
	
	@Override
	@GetMapping("/util")
	public String utilAlarm() {
		
		return "util-alarm";
	}
	
	

}
