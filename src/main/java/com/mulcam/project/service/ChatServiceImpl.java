package com.mulcam.project.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.project.dao.ChatDAO;
import com.mulcam.project.vo.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAO chatDao;
	
	public ArrayList<ChatVO> getChatList(Date chatTime){
		System.out.println("ChatServiceImpl  getChatList ");
		ArrayList<ChatVO> result = new ArrayList<ChatVO>();
		result = chatDao.selectChatList(chatTime);
		for(ChatVO chat : result) {
			System.out.println("ChatServiceImpl Result List");
			System.out.println(chat.getChatName());
			System.out.println(chat.getChatContent());
			System.out.println(chat.getChatTime());
		}
		return result;
	}

	@Override
	public int submitChat(String chatName, String chatContent) {
		
		int maxChatId = chatDao.selectMaxChatId();
		
		
		ChatVO chat = new ChatVO();
		chat.setChatId(maxChatId+1);
		chat.setChatName(chatName);
		chat.setChatContent(chatContent);
		try {
			chatDao.insertChat(chat);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int searchMaxChatId() {
		return chatDao.selectMaxChatId();
	}

	@Override
	public ArrayList<ChatVO> getRecentChatList(int num) {
		
		return chatDao.selectRecentChatList(num);
	}

	@Override
	public ArrayList<ChatVO> getRecentChatListById(int chatId) {
		
		return chatDao.selectRecentChatListById(chatId);
	}

}
