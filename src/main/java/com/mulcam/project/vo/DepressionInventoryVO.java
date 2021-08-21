package com.mulcam.project.vo;

public class DepressionInventoryVO {
	
	private int bdiId;
	private int answerNo;
	private String answer;
	private int point;
	
	public DepressionInventoryVO() {};
	
	public DepressionInventoryVO(int bdiId, int answerNo, String answer, int point) {
		super();
		this.bdiId = bdiId;
		this.answerNo = answerNo;
		this.answer = answer;
		this.point = point;
	}

	public int getBdiId() {
		return bdiId;
	}

	public void setBdiId(int bdiId) {
		this.bdiId = bdiId;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
	

}
