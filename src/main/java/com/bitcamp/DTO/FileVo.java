package com.bitcamp.DTO;

import org.springframework.web.multipart.MultipartFile;

public class FileVo {
	private String filename;
	private MultipartFile file1;
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
 
	
	

}
