package com.mulcam.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.DepressionInventoryService;
import com.mulcam.project.vo.DepressionInventoryVO;

@Controller
public class DepressionInventoryControllerImpl implements DepressionInventoryController {

	@Autowired
	DepressionInventoryService diService;
	
	@Override
	@GetMapping("/inventory-bdi")
	public ModelAndView bdi() {
		ModelAndView mv = new ModelAndView();
		ArrayList<DepressionInventoryVO> diList = new ArrayList<DepressionInventoryVO>();
		diList = diService.getAllQuestions();
		
		for(DepressionInventoryVO di : diList) {
			System.out.println("DepressionInventory id : " +   di.getBdiId()  );
			System.out.println("DepressionInventory no : " +   di.getAnswerNo()  );
			System.out.println("DepressionInventory answer : " +   di.getAnswer()  );
			System.out.println("DepressionInventory point : " +   di.getPoint()  );
		}
		
		mv.addObject("diList", diList);
		mv.setViewName("inventory-bdi");
		return mv;
	}
	
	@Override
	@GetMapping("/inventory-bdi-main")
	public ModelAndView bdiMain() {
		ModelAndView mv = new ModelAndView();
		ArrayList<DepressionInventoryVO> diList = new ArrayList<DepressionInventoryVO>();
		diList = diService.getAllQuestions();
		
		for(DepressionInventoryVO di : diList) {
			System.out.println("DepressionInventory id : " +   di.getBdiId()  );
			System.out.println("DepressionInventory no : " +   di.getAnswerNo()  );
			System.out.println("DepressionInventory answer : " +   di.getAnswer()  );
			System.out.println("DepressionInventory point : " +   di.getPoint()  );
		}
		
		mv.addObject("diList", diList);
		mv.setViewName("inventory-bdi-main");
		return mv;
	}

	@Override
	@PostMapping("/inventory-bdi-result")
	public ModelAndView bdiResult(@RequestParam("sum_bdi") String sum_bdi , @RequestParam("result_bdi") String result_bdi) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sum_bdi", sum_bdi);
		mv.addObject("result_bdi", result_bdi);
		mv.setViewName("inventory-bdi-result");
		return mv;
	}

	@Override
	@PostMapping("/bdiEmailSend")
	public void bdiEmailSend(@RequestParam("email") String email, @RequestParam("bdiResult") String bdiResult, HttpServletResponse response) throws IOException {
		System.out.println(email);
		String result = diService.emailSend(email, bdiResult);
		
		PrintWriter out = response.getWriter();
		if (result == "success") {
			out.append("success");
		} else {
			out.append("failure");
		}
		
		out.close();

	}

}
