package com.mulcam.project.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.project.vo.ChatVO;

@Mapper
@Repository
public interface ChatDAO {

	public ArrayList<ChatVO> selectChatList(Date chatTime);

	public void insertChat(ChatVO chat);
	
	public int selectMaxChatId();
	
	public ArrayList<ChatVO> selectRecentChatList(int num);
	
	public ArrayList<ChatVO> selectRecentChatListById(int chatId);

}
