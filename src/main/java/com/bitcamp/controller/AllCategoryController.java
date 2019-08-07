package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Service.CategoryService;

@Controller
public class AllCategoryController {

	@Resource
	private CategoryService service;
	
	
	@RequestMapping(value = "/AllCategory", method = RequestMethod.GET)
	public String category(Model model) {
		
		List<CategoryDTO> clist = service.AllList();
		
		model.addAttribute("list", clist);
		
		return "templete.jsp?page=AllCategory";
	}
	
	@RequestMapping(value = "/Payment", method = RequestMethod.GET)
	public String payment()
	{
		return "templete.jsp?page=Payment";
	}
	
	
	
}
