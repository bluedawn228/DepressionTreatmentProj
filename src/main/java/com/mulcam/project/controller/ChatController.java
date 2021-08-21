package com.mulcam.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.mulcam.project.vo.ChatVO;

public interface ChatController {
	
	public String chatRoom();
	
	public void chatList(String listType, HttpServletResponse response) throws IOException ;
	
	public void recentChatList(int number, HttpServletResponse response) throws IOException ;
	
	public ModelAndView submitChat(ChatVO chat, HttpServletResponse response) throws IOException ;
	
	public void realtimeChatList(int chatId, HttpServletResponse response) throws IOException;
	
	
}
