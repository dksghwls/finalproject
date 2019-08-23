package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.DTO.FileVo;
import com.bitcamp.Service.CategoryService;

@Controller
public class EditorController {

	@Autowired
	private CategoryService service;
	private String path = "temp";

	@RequestMapping(value = "/coding")
	public String coding()
	{
		return "templete.jsp?page=coding";
	}
	

	@RequestMapping("insertBoard")
	public String addresult(HttpServletRequest request,CategoryDTO dto,Model model, FileVo vo)
	{
		
		MultipartFile multi = vo.getFile1();
		 try {
			 String uploadpath = request.getSession().getServletContext().getRealPath(path);
			 if(!multi.isEmpty()) {
				 File file= new File(uploadpath, multi.getOriginalFilename());
				 multi.transferTo(file);
				 model.addAttribute("title", vo.getFilename());
				 model.addAttribute("filename", vo.getFile1().getOriginalFilename());
				 model.addAttribute("uploadpath", file.getAbsolutePath());
		

				int result = service.addresult(dto,uploadpath);
				 
				 return "redirect:/adminproduct";
			 }
		 }catch(IOException e) {
			 System.out.println(e);
		 }
		
		return "redirect:/adminproduct";
	}
	@RequestMapping("Payment")
	public String payment()
	{
		
		return "templete.jsp?page=Payment";
	}	

}