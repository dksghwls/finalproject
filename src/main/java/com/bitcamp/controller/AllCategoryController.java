package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AllCategoryController {

	@RequestMapping(value = "/AllCategory", method = RequestMethod.GET)
	public String category() {
		return "templete.jsp?page=AllCategory";
	}
	
}
