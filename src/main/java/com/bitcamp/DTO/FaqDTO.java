package com.bitcamp.DTO;

public class FaqDTO {

	private int fno; //글번호
	private String ftitle; //글제목
	private String fcontent; //글내용
	private int fcno; //카테고리 번호
	private int no;//회원번호
	private String fcname;//카테고리 이름
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public int getFcno() {
		return fcno;
	}
	public void setFcno(int fcno) {
		this.fcno = fcno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFcname() {
		return fcname;
	}
	public void setFcname(String fcname) {
		this.fcname = fcname;
	}
	
	
	
	
}
