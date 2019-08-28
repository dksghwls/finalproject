package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.ProductDTO;
import com.bitcamp.Service.DetailService;

@Controller
public class DetailController {
  
	@Resource
	private DetailService service;
	
	
	@RequestMapping("/detail/{pno}")
	public String Detail(@PathVariable int pno,Model model)
	{
		System.out.println(pno);
		
		List<ProductDTO> dto = service.detaillist(pno);
		model.addAttribute("dto", dto);
		
		return "templete.jsp?page=detail";
		
	}
	
	
	
}
