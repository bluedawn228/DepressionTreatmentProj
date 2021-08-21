package com.mulcam.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.MemberVO;

@Mapper

@Repository
public interface MemberDAO {

	public MemberVO selectMemberForLogin(MemberVO memberVO);
	
	public void insertMember(MemberVO memberVO);

	public MemberVO selectMemberById(String id);
	
	public int searchUniqueId(String id);

	
}
