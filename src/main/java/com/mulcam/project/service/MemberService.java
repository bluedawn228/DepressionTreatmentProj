package com.mulcam.project.service;

import com.mulcam.project.vo.MemberVO;

public interface MemberService {
	

	public MemberVO login(MemberVO memberVO) ;
	
	public MemberVO searchMemberById(String id);
	
	public void signupMember(MemberVO memberVO);
	
	public int checkIdDuplication(String id);


}
