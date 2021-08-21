package com.mulcam.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.MemberDAO;
import com.mulcam.project.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired

	MemberDAO dao;
	
	// 로그인
	@Override
	public MemberVO login(MemberVO memberVO) {
		return dao.selectMemberForLogin(memberVO);
	}
	
	// 회원 정보 찾기
	@Override
	public MemberVO searchMemberById(String id) {
		return dao.selectMemberById(id);
	}

	// 회원가입
	@Override
	public void signupMember(MemberVO memberVO) {
		dao.insertMember(memberVO);
	}
	
	//ID중복체크
	@	Override
	public int checkIdDuplication(String id) {
		return dao.searchUniqueId(id);
	}


}
