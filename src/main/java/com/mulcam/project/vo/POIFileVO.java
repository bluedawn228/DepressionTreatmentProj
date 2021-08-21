package com.mulcam.project.vo;

public class POIFileVO {
	private int fno;
	private int bno;
	private String filename;				//저장할 파일
	private String fileoriname;			//실제 파일
	private String fileurl;
	
	public POIFileVO() {}

	public POIFileVO(int fno, int bno, String filename, String fileoriname, String fileurl) {
		super();
		this.fno = fno;
		this.bno = bno;
		this.filename = filename;
		this.fileoriname = fileoriname;
		this.fileurl = fileurl;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileoriname() {
		return fileoriname;
	}

	public void setFileoriname(String fileoriname) {
		this.fileoriname = fileoriname;
	}

	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	};
	
	
	
}
