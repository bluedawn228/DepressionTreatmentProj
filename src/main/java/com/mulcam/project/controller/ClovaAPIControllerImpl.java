package com.mulcam.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.project.common.ClovaAPI;

@Controller
public class ClovaAPIControllerImpl implements ClovaAPIController {

	@Override
	@ResponseBody  //실제 구현시 제외 하고 리턴값으로 받으세요 
	@RequestMapping(value = "/senti", method= {RequestMethod.GET, RequestMethod.POST})
	public String sentimentCall(@RequestParam(value="text") String text) throws Exception {
	
		String result = ClovaAPI.SentimentRequest(text);
		
	return result;
	}

	@Override
	@ResponseBody  //실제 구현시 제외 하고 리턴값으로 받으세요 
	@RequestMapping(value = "/faceReco", method= {RequestMethod.GET, RequestMethod.POST})
	public String faceRecoCall(String urlname) throws Exception {
		String result = ClovaAPI.ClavaFaceRecognition(urlname);
		return result;
	}

	@Override
	public String clovaOCRCall(String urlname) throws Exception {
		String result = ClovaAPI.ClovaOCR(urlname);
		return result;
	}
}
