package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.FileVo;

@Controller
public class UploadController {

	//파일 업로드
		 private String path = "temp";
		 
		 @RequestMapping("/uploadfile")
		 public String contactfileform() {
			 return "fileform";
					 
		 }
		 
		 @RequestMapping("/fileok")
		 public String contactfileok(HttpServletRequest request, FileVo vo, Model model) {
			 
			 MultipartFile multi = vo.getFile1();
			 try {
				 String uploadpath = request.getSession().getServletContext().getRealPath(path);
				 if(!multi.isEmpty()) {
					 File file= new File(uploadpath, multi.getOriginalFilename());
					 multi.transferTo(file);
					 model.addAttribute("title", vo.getFilename());
					 model.addAttribute("filename", vo.getFile1().getOriginalFilename());
					 model.addAttribute("uploadpath", file.getAbsolutePath());
					 return "filelist";
				 }
			 }catch(IOException e) {
				 System.out.println(e);
			 }
			 return "redirect:/uploadfile";
			 
		 }
}
