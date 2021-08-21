package com.mulcam.project.controller;

import org.springframework.web.bind.annotation.RequestParam;

public interface ClovaAPIController {
	
	public String sentimentCall(@RequestParam(value="text") String text) throws Exception ;
	
	public String faceRecoCall(@RequestParam(value="urlname") String urlname) throws Exception ;
	
	public String clovaOCRCall(@RequestParam(value="urlname") String urlname) throws Exception ;

}
