package com.mulcam.project.service;

import java.util.ArrayList;
import java.util.Date;

import com.mulcam.project.vo.ChatVO;

public interface ChatService {
	
	public ArrayList<ChatVO> getChatList(Date chatTime);
	
	public int submitChat(String chatName, String chatContent);
	
	public int searchMaxChatId();
	
	public ArrayList<ChatVO> getRecentChatList(int num);
	
	public ArrayList<ChatVO> getRecentChatListById(int chatId);
	
}
