package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.ContactDTO;
import com.bitcamp.DTO.FileVo;
import com.bitcamp.DTO.MakePage;
import com.bitcamp.Service.ContactService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactservice;

	@RequestMapping("/contact")
	public String contactlist(@RequestParam(required=false, defaultValue="1") int currPage, Model model) {
		
		int totalCount = contactservice.contactcount();
		System.out.println("totalCount: " + totalCount);
		
		int pageSize = 5;
		int blockSize = 5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<ContactDTO> dto = contactservice.contactlist(page.getStartRow(), page.getEndRow());
		model.addAttribute("dto", dto);
		System.out.println("testdto" + dto);
		model.addAttribute("page", page);

		return "templete.jsp?page=contactlist";
	}

	@RequestMapping(value="/contactinsert", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/contactmodify/{no}", method=RequestMethod.GET)
	public String contactmodify(@PathVariable int no, Model model) {
		ContactDTO dto = contactservice.contactdetail(no);
		model.addAttribute("dto",dto);
		
		return "templete.jsp?page=contactmodify";
	}
	
	@RequestMapping("/contactmodifyok")
	public String contactmodifyok(ContactDTO dto) {
		int result = contactservice.contactmodify(dto);
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
