package com.mulcam.project.vo;

public class ChatVO {
	private int chatId;
	private String chatName;
	private String chatContent;
	private String chatTime;
	private int num;
	
	public ChatVO() {}

	public ChatVO(int chatId, String chatName, String chatContent, String chatTime, int num) {
		super();
		this.chatId = chatId;
		this.chatName = chatName;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
		this.num = num;
	}

	public int getChatId() {
		return chatId;
	}

	public void setChatId(int chatId) {
		this.chatId = chatId;
	}

	public String getChatName() {
		return chatName;
	}

	public void setChatName(String chatName) {
		this.chatName = chatName;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
	
	
}
