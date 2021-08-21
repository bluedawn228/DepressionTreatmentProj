package com.mulcam.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.service.MemberService;
import com.mulcam.project.vo.MemberVO;


@Controller
public class MemberControllerImpl implements MemberController{
	
    @Autowired
    MemberService service;

    //로그인
  	@Override
  	@GetMapping("/auth-signin")
	public String login(@CookieValue(value = "cId", required = false) Cookie rCookie, Model model) throws Exception {
  		
  		if (rCookie != null) {
			System.out.println(" root Cookie");
			String[] cidArry = rCookie.getValue().split("#");
			System.out.println(rCookie.getValue());
			System.out.println(cidArry[0]);
			System.out.println(cidArry[1]);
			System.out.println(cidArry[2]);

			model.addAttribute("id", cidArry[0]);
			model.addAttribute("password", cidArry[1]);
			model.addAttribute("rememberId", cidArry[2]);
		}
  		

		
  		return "auth-signin";
  	}
    //로그인
	@Override
	@PostMapping("/auth-signin")
	public ModelAndView login(@ModelAttribute MemberVO memberVO, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		// 로그인 시도
		try {
					MemberVO result = service.login(memberVO);
					if (result != null) {

						System.out.println("making Cookie");
						Cookie rCookie = null;

						System.out.println("isRememberId");
						System.out.println(memberVO.isRememberId());

						if (memberVO.isRememberId()) {
							rCookie = new Cookie("cId",
									memberVO.getId() + "#" + memberVO.getPassword() + "#" + memberVO.isRememberId());
							rCookie.setMaxAge(60 * 60 * 24 * 15);
						} else {
							rCookie = new Cookie("cId", "##" + memberVO.isRememberId());
							rCookie.setMaxAge(0);
						}
						rCookie.setPath("/");
						System.out.println("addCookie(rCookie);");
						response.addCookie(rCookie);

						
						System.out.println("session : " + result.getId());
						System.out.println("session : " + result.getName());
						System.out.println("session : " + result.getEmail());
						
						mv.addObject("userInfo", result);
						session.setAttribute("userInfo", result);
					}
					
					
					mv.setViewName("index");
					
			  		
					

				} catch (Exception e) {
					e.printStackTrace();
					mv.setViewName("error");
				}

				return mv;
    }
    

    // 로그아웃
	@Override
	@GetMapping("/auth-signout")
	public ModelAndView logout(HttpServletRequest request) throws IOException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("userInfo", null);
		mv.setViewName("redirect:./");
		
    	HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
		
		return mv;
	}
    
    
	// 회원가입
	@Override
	@GetMapping("/auth-signup")
	public String signup() throws Exception{
		return "auth-signup";
	}
	
	// 회원가입
	@Override
	@PostMapping("/auth-signup")
	public ModelAndView signup(MemberVO memberVO) throws IOException {
		ModelAndView mv = new ModelAndView();

		try {
			//회원가입
			service.signupMember(memberVO);
			
			//로그인하기
			MemberVO user = service.login(memberVO);
			System.out.println("=======Signup=========" + user.getId());
			System.out.println("=======Signup=========" + user.getEmail());
			System.out.println("=======Signup=========" + user.getName());
			
			mv.addObject("userInfo",user);
			mv.setViewName("index");
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("error");
		}
		return mv;
	}
	
	// 회원가입시 ID 중복여부체크
	@Override
	@PostMapping("/signupIdChk")
	public void signupIdChk(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		try {
			int result = service.checkIdDuplication(id);
			System.out.println("checkIdDuplication : " + result);
			
			if ( result >0 ) {
				out.append("1");
			} else {
				out.append("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.append("0");
		} finally {
			out.close();
		}
		
	}
	

}
