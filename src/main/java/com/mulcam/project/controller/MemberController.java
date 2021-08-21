package com.mulcam.project.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.MemberVO;

public interface MemberController {
	
	public String login(@CookieValue(value = "cId", required = false) Cookie rCookie, Model model) throws Exception ;
	
	public ModelAndView login(MemberVO memberVO, HttpServletResponse response,
			HttpServletRequest request) throws IOException;
	
	public ModelAndView logout(HttpServletRequest request) throws IOException;
	
	public String signup() throws Exception;
	
	public ModelAndView signup(MemberVO memberVO) throws IOException ;

	public void signupIdChk(String id, HttpServletResponse response) throws Exception;
}
