package com.bitcamp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "templete.jsp?page=home";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "templete.jsp?page=join";
	}
	
	@RequestMapping("/joinOK")
	public String joinOK() {
		
		
		
		return "templete.jsp?page=login";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "templete.jsp?page=login";
	}
	
	@RequestMapping("/loginOK")
	public String loginOK() {
		
		
		
		return "templete.jsp?page=home";
	}
	
}
