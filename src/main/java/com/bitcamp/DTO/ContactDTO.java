package com.bitcamp.DTO;

import java.sql.Date;

public class ContactDTO {
private int hno; //�۹�ȣ
private int no; // ȸ����ȣ
private String htitle; //����
private String hcontent; //����
private Date hdate;//��¥
private String himg; //���ϸ�


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


}
