package com.mulcam.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.ConsolationService;
import com.mulcam.project.vo.ConsolationVO;

@Controller
public class ConsolationControllerImpl implements ConsolationController {

	@Autowired
	ConsolationService service;
	
	@Override
	@GetMapping("/Consolation")
	public ModelAndView pickOne() throws Exception{
		ModelAndView mv = new ModelAndView("consolation");
		
		System.out.println("===========================ConsolationControllerImpl==============================") ;
		
		ConsolationVO vo = service.randomSelection();
		System.out.println("randomSelection " + vo.getIdx()) ;
		System.out.println("randomSelection " + vo.getTitle()) ;
		System.out.println("randomSelection " + vo.getContent()) ;
		
		mv.addObject("consolation", service.randomSelection());
		return mv;
	}
}
