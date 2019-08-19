package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.ContactDTO;
import com.bitcamp.DTO.FileVo;
import com.bitcamp.Service.ContactService;

@Controller
public class ContactController {

	@Resource
	private ContactService contactservice;

	@RequestMapping("/contact")
	public String contactlist(Model model) {
		List<ContactDTO> dto = contactservice.contactlist();
		model.addAttribute("dto", dto);
		System.out.println("testdto" + dto);

		return "templete.jsp?page=contactlist";
	}

	@RequestMapping("/contactinsert")
	public String contact(ContactDTO dto) {

		return "contactform";
	}

	@RequestMapping("/contactok")
	public String contactok(ContactDTO dto) {
		int result = contactservice.contactinsert(dto);
		System.out.println("resulttest: " + result);
		return "redirect:contact";
	}

	@RequestMapping("/contactdetail/{no}")
	public String contactdetail(@PathVariable int no, Model model) {

		ContactDTO dto = contactservice.contactdetail(no);
		model.addAttribute("dto", dto);
		System.out.println("contactdtotest: " + dto);

		return "templete.jsp?page=contactdetail";
	}

	@RequestMapping("/contactdelete/{no}")
	public String contactdelete(@PathVariable int no) {

		int result = contactservice.contactdelete(no);
		return "redirect:/contact";
	}
	
	//파일 업로드
	 private String path = "temp";
	 
	 @RequestMapping("/contactfile")
	 public String contactfileform() {
		 return "contactfile";
				 
	 }
	 
	 @RequestMapping("/contactfileok")
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
				 return "contactfilelist";
			 }
		 }catch(IOException e) {
			 System.out.println(e);
		 }
		 return "redirect:/contactfile";
		 
	 }
}
