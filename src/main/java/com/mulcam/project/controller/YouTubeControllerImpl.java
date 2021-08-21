package com.mulcam.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.YoutubeService;
import com.mulcam.project.vo.YoutubeVO;

@Controller
public class YouTubeControllerImpl implements YouTubeController {
	
	@Autowired
	YoutubeService service;
	
	@Override
	@RequestMapping(value="/chore-youtube", method=RequestMethod.GET)
	public ModelAndView youtube(@RequestParam (value="page", required=false, defaultValue="1") int page) {
		ModelAndView mv = new ModelAndView("chore-youtube");
		ArrayList<YoutubeVO> ytList = new ArrayList<YoutubeVO>();
		int startrow = ( (page-1)*8  > 0 ? (page-1)*8  : 1 ) ;
		ytList = service.getAllYoutube(startrow);
		
		YoutubeVO randomOne = service.getOneYoutube();
		
		mv.addObject("page",page);
		mv.addObject("randomOne",randomOne);
		mv.addObject("ytList", ytList);

		return mv;
	}
	
	@Override
	@RequestMapping(value="/infiniteScrollDown", method=RequestMethod.POST)
	public @ResponseBody List<YoutubeVO> infiniteScrollDownPOST(@RequestBody YoutubeVO vo){
		System.out.println("==================   infiniteScrollDownPOST is called   ===================");
		
		int bnoToStart = vo.getBno() + 1;

		return service.infiniteScrollDown(bnoToStart);
	} // infiniteScrollDownPOST()

	
	@Override
	@RequestMapping(value="/infiniteScrollUp", method=RequestMethod.POST)
	public @ResponseBody List<YoutubeVO> infiniteScrollUpPOST(@RequestBody YoutubeVO vo){
		System.out.println("==================   infiniteScrollUpPOST is called   ===================");
		
		int firstbno = vo.getBno() - 1;
		List<YoutubeVO> voList =  service.infiniteScrollUp(firstbno);
		for (YoutubeVO yv : voList) {
			System.out.println(yv.getBno());
			System.out.println(yv.getId());
			System.out.println(yv.getTitle());
			System.out.println(yv.getUrl());
		}
		return service.infiniteScrollUp(firstbno);
	} // infiniteScrollDownPOST()

	
	@Override
	@PostMapping("/addYoutube")
	public ModelAndView youtubeUpload(@ModelAttribute YoutubeVO vo) {
		System.out.println("=======================   youtubeUpload   =========================");
		
		ModelAndView mv = new ModelAndView("redirect:./chore-youtube");
		service.addYoutube(vo);

		return mv;
	}

	@Override
	@PostMapping("/deleteYoutube")
	public ModelAndView deleteYoutube(@RequestParam(value="itemKey") String itemKey) {
		System.out.println("==========controller=============   youtubeDelete   =========================");
		System.out.println(itemKey);

		ModelAndView mv = new ModelAndView("redirect:./chore-youtube");
		service.deleteYoutube(itemKey.trim());
		return mv;
	}

}
