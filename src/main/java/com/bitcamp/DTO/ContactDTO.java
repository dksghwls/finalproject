package com.bitcamp.DTO;

import java.sql.Date;

public class ContactDTO {
	
	private int hno; //글번호
	private int no; // 회원번호
	private String nickname; //회원명
	private String email; //이메일
	private String htitle; //제목
	private String hcontent; //내용
	private Date hdate;//날짜
	private String himg; //파일명
	private String recontent; //답글 내용
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHtitle() {
		return htitle;
	}
	public void setHtitle(String htitle) {
		this.htitle = htitle;
	}
	public String getHcontent() {
		return hcontent;
	}
	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}
	public Date getHdate() {
		return hdate;
	}
	public void setHdate(Date hdate) {
		this.hdate = hdate;
	}
	public String getHimg() {
		return himg;
	}
	public void setHimg(String himg) {
		this.himg = himg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

}
