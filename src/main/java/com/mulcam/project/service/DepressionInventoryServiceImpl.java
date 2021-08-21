package com.mulcam.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.DepressionInventoryDAO;
import com.mulcam.project.vo.DepressionInventoryVO;

@Service
public class DepressionInventoryServiceImpl implements DepressionInventoryService {

	@Autowired
	DepressionInventoryDAO diDAO;

	@Override
	public ArrayList<DepressionInventoryVO> getAllQuestions() {
		
		return diDAO.selectAllQuestions();
	}
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public String emailSend(String email, String bdiResult) {
		
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(email);
			message.setSubject("코로바 블루에서 보내드리는 메일 입니다.");
			message.setText("BDI 진단결과는 " + bdiResult + "입니다.");
			
			mailSender.send(message);
			 return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "failure";
		}

	}
}
