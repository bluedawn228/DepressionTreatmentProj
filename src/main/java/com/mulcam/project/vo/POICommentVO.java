package com.mulcam.project.vo;

import java.util.Date;

public class POICommentVO {
	
	private int cno;
	private int bno;
	private String content;
	private String writer;
	private Date regDate;
	
	public POICommentVO() {};
	
	public POICommentVO(int cno, int bno, String content, String writer, Date regDate) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

}
