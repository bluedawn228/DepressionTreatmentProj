package com.mulcam.project.vo;

import java.util.Date;

public class CookingShowCommentsVO {
	
	private int idx;
	private int cidx;
	private String commenterId;
	private String comments;
	private Date postDate;
	private Date modifyDate;
	
	public CookingShowCommentsVO() {};
	
	public CookingShowCommentsVO(int idx, int cidx, String commenterId, String comments, Date postDate,
			Date modifyDate) {
		super();
		this.idx = idx;
		this.cidx = cidx;
		this.commenterId = commenterId;
		this.comments = comments;
		this.postDate = postDate;
		this.modifyDate = modifyDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCommenterId() {
		return commenterId;
	}

	public void setCommenterId(String commenterId) {
		this.commenterId = commenterId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	

}
