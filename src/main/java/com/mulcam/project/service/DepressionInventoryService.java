package com.mulcam.project.service;

import java.util.ArrayList;

import com.mulcam.project.vo.DepressionInventoryVO;

public interface DepressionInventoryService {
	
	public  ArrayList<DepressionInventoryVO> getAllQuestions();
	
	public String emailSend(String email, String bdiResult) ;

}
