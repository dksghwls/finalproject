package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.CategoryDTO;
import com.bitcamp.Service.CategoryService;

@Controller
public class TestController {

	@Resource
	private CategoryService service;
	
	@RequestMapping("imgTest")
	public String imgList(Model m)
	{
		List<CategoryDTO> dto =  service.imgTest();
		m.addAttribute("list", dto);
		
		
		
		return "imgTest";
	}
	
	
}
