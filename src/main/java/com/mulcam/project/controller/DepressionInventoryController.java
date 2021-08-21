package com.mulcam.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface DepressionInventoryController {
	
	public ModelAndView bdi();
	
	public ModelAndView bdiMain() ;
	
	public ModelAndView bdiResult(String sum_bdi , String result_bdi);
	
	public void bdiEmailSend(String email, String bdiResult, HttpServletResponse response)  throws IOException;
	

}
