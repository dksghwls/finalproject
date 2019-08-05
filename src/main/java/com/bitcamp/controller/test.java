package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test {

	@RequestMapping("/test")
	public String test() {
		return "templete.jsp?page=test";
	}
	
}
