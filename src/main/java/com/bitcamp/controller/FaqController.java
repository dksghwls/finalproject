package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.DTO.FaqDTO;
import com.bitcamp.Service.FaqService;

@Controller
public class FaqController {

	@Resource
	private FaqService faqservice;
	
	@RequestMapping(value = "/helpcenter")
	public String helpcenter() {
		
		return "templete.jsp?page=helpcenter";
	}
	
	
	@RequestMapping("/faq")
	public String faqlist(Model model) {
		List<FaqDTO> list = faqservice.faqlist();
		model.addAttribute("list",list);
		System.out.println("listtest: "+list);
		return "templete.jsp?page=faqlist";
		
	}
	
	@RequestMapping("/faqinsert")
	public String faqinsert(FaqDTO dto) {
		
		return "faqinsertform";
	}
	
	@RequestMapping("/faqinsertok")
	public String faqinsertok(FaqDTO dto) {
		
		int result = faqservice.faqinsert(dto);
		System.out.println("resulttest: "+result);
		return "redirect:faq";
	}
}
