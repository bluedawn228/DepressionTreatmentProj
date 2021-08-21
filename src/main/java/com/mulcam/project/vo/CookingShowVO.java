package com.mulcam.project.vo;

import java.util.ArrayList;
import java.util.Date;

public class CookingShowVO {
	
	
	private int idx;
	private String name;
	private String authorid;
	private String title;
	private String contents;
	private String filename;
	private String fileoriname;
	private int recommendation;
	private Date postdate;
	private Date modifydate;
	
	private ArrayList<CookingShowReasonsVO> reasonsVOList = new ArrayList<CookingShowReasonsVO>();
	
	public CookingShowVO() {}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthorid() {
		return authorid;
	}

	public void setAuthorid(String authorid) {
		this.authorid = authorid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(int recommendation) {
		this.recommendation = recommendation;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public ArrayList<CookingShowReasonsVO> getReasonsVOList() {
		return reasonsVOList;
	}

	public void setReasonsVOList(ArrayList<CookingShowReasonsVO> reasonsVOList) {
		this.reasonsVOList = reasonsVOList;
	}

	public String getFileoriname() {
		return fileoriname;
	}

	public void setFileoriname(String fileoriname) {
		this.fileoriname = fileoriname;
	}

	

}
