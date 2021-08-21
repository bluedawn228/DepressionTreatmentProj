package com.mulcam.project.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

public interface SmallTalk {

	public String smallTalk() ;
	
	public void SmallTalkPost(@RequestBody Map<String, Object> jsonValue) throws Exception;
}
